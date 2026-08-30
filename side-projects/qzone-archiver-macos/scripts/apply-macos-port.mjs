#!/usr/bin/env node
/**
 * QZone Archiver macOS port patcher.
 *
 * Applies a small, auditable macOS compatibility layer to the upstream
 * salt-fishes/qzone-archiver v4.0.0 desktop source without modifying the
 * QQ Space collection/recovery engine.
 *
 * Modified files are clearly marked to comply with Apache-2.0 section 4(b).
 */

import fs from 'node:fs';
import path from 'node:path';
import process from 'node:process';

const upstreamRoot = path.resolve(process.argv[2] || '.');
const desktopDir = path.join(upstreamRoot, 'desktop');

function fail(message) {
  console.error(`[mac-port] ${message}`);
  process.exit(1);
}

function read(file) {
  return fs.readFileSync(file, 'utf8');
}

function write(file, content) {
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, content, 'utf8');
  console.log(`[mac-port] updated ${path.relative(upstreamRoot, file)}`);
}

if (!fs.existsSync(path.join(upstreamRoot, 'LICENSE'))) {
  fail(`Upstream LICENSE not found: ${upstreamRoot}`);
}
if (!fs.existsSync(path.join(desktopDir, 'package.json'))) {
  fail(`Upstream desktop/package.json not found: ${desktopDir}`);
}

// ---------------------------------------------------------------------------
// 1. package.json — add explicit macOS build commands.
// ---------------------------------------------------------------------------
const packageFile = path.join(desktopDir, 'package.json');
const pkg = JSON.parse(read(packageFile));

pkg.description = 'QQ空间档案备份桌面版（macOS port：内嵌登录 → 采集 → 打包 → 内置 SPA 浏览）';
pkg.scripts = {
  ...pkg.scripts,
  'dist:mac': 'npm run build:renderer && electron-builder --mac',
  'dist:mac:arm64': 'npm run build:renderer && electron-builder --mac --arm64',
  'dist:mac:x64': 'npm run build:renderer && electron-builder --mac --x64',
};

write(
  packageFile,
  `${JSON.stringify(pkg, null, 2)}\n`,
);

// ---------------------------------------------------------------------------
// 2. electron-builder — macOS DMG/ZIP, ARM64 + Intel, unsigned by default.
// ---------------------------------------------------------------------------
const builderFile = path.join(desktopDir, 'electron-builder.yml');
const builderConfig = `# MODIFIED FOR macOS PORT by Cliffer1999
# Based on salt-fishes/qzone-archiver v4.0.0 (Apache-2.0)
appId: com.cliffer1999.qzonearchiver.macos
productName: QZoneArchiver
copyright: Copyright © 2026 qzone-archiver contributors

asar: true

directories:
  output: release
  buildResources: build

files:
  - src/main/**/*
  - src/preload/**/*
  - src/engine/**/*
  - src/renderer/dist/**/*
  - assets/**/*
  - package.json
  - LICENSE-UPSTREAM.txt
  - NOTICE-MACOS-PORT.txt

mac:
  category: public.app-category.utilities
  identity: null
  hardenedRuntime: false
  gatekeeperAssess: false
  target:
    - target: dmg
      arch:
        - arm64
        - x64
    - target: zip
      arch:
        - arm64
        - x64
  artifactName: \${productName}-\${version}-mac-\${arch}.\${ext}
  extendInfo:
    NSHighResolutionCapable: true
    NSRequiresAquaSystemAppearance: false

dmg:
  title: QZoneArchiver \${version}
  artifactName: \${productName}-\${version}-mac-\${arch}.\${ext}
  contents:
    - x: 130
      y: 220
    - x: 410
      y: 220
      type: link
      path: /Applications

# Chinese mirror retained from upstream to reduce Electron download failures.
electronDownload:
  mirror: https://npmmirror.com/mirrors/electron/
`;
write(builderFile, builderConfig);

// ---------------------------------------------------------------------------
// 3. Native macOS application menu.
//    Upstream removes the menu entirely because the released desktop build is
//    Windows-only. macOS applications should retain standard App/Edit/Window
//    roles so Cmd+Q/C/V/A and native window commands behave normally.
// ---------------------------------------------------------------------------
const mainFile = path.join(desktopDir, 'src/main/index.js');
let mainSource = read(mainFile);

if (!mainSource.includes('function buildMacMenu()')) {
  const marker = 'const gotLock = app.requestSingleInstanceLock();';
  if (!mainSource.includes(marker)) fail('Could not locate main-process patch marker.');

  const macMenu = `// MODIFIED FOR macOS PORT: native application menu.\nfunction buildMacMenu() {\n  return Menu.buildFromTemplate([\n    {\n      label: app.name,\n      submenu: [\n        { role: 'about' },\n        { type: 'separator' },\n        { role: 'services' },\n        { type: 'separator' },\n        { role: 'hide' },\n        { role: 'hideOthers' },\n        { role: 'unhide' },\n        { type: 'separator' },\n        { role: 'quit' },\n      ],\n    },\n    { label: '编辑', submenu: [{ role: 'undo' }, { role: 'redo' }, { type: 'separator' }, { role: 'cut' }, { role: 'copy' }, { role: 'paste' }, { role: 'selectAll' }] },\n    { label: '窗口', submenu: [{ role: 'minimize' }, { role: 'zoom' }, { type: 'separator' }, { role: 'front' }] },\n  ]);\n}\n\n`;
  mainSource = mainSource.replace(marker, `${macMenu}${marker}`);
}

const menuLine = 'Menu.setApplicationMenu(null);';
if (mainSource.includes(menuLine)) {
  mainSource = mainSource.replace(
    menuLine,
    `// MODIFIED FOR macOS PORT: keep the standard native menu on macOS.\n    Menu.setApplicationMenu(process.platform === 'darwin' ? buildMacMenu() : null);`,
  );
}

write(mainFile, mainSource);

// ---------------------------------------------------------------------------
// 4. Main window — native inset title bar on macOS; Windows behaviour remains
//    unchanged. This is presentation-only and does not touch backup logic.
// ---------------------------------------------------------------------------
const windowsFile = path.join(desktopDir, 'src/main/windows.js');
let windowsSource = read(windowsFile);
const browserWindowMarker = `windows.main = new BrowserWindow({\n    width: 1200,`;
if (windowsSource.includes(browserWindowMarker)) {
  windowsSource = windowsSource.replace(
    browserWindowMarker,
    `windows.main = new BrowserWindow({\n    // MODIFIED FOR macOS PORT: native traffic-light/title-bar layout.\n    titleBarStyle: process.platform === 'darwin' ? 'hiddenInset' : 'default',\n    width: 1200,`,
  );
}
write(windowsFile, windowsSource);

// ---------------------------------------------------------------------------
// 5. Attribution bundled into the generated .app.
// ---------------------------------------------------------------------------
fs.copyFileSync(
  path.join(upstreamRoot, 'LICENSE'),
  path.join(desktopDir, 'LICENSE-UPSTREAM.txt'),
);
console.log('[mac-port] copied upstream Apache-2.0 licence');

const notice = `QZoneArchiver macOS Port\n\nThis build is a derivative platform port of:\n  salt-fishes/qzone-archiver\n  https://github.com/salt-fishes/qzone-archiver\n\nPinned upstream commit:\n  63967a184b44ea3eaf339f0abac72bb5244c0a75 (v4.0.0)\n\nUpstream licence: Apache License 2.0.\n\nmacOS-specific modifications:\n- electron-builder DMG/ZIP targets for arm64 and x64\n- native macOS application menu\n- native macOS main-window title-bar behaviour\n- build and attribution metadata\n\nThe QQ Space collection, deleted-post recovery and export engine are retained\nfrom upstream rather than reimplemented in this port.\n`;
write(path.join(desktopDir, 'NOTICE-MACOS-PORT.txt'), notice);

console.log('[mac-port] macOS port applied successfully');
