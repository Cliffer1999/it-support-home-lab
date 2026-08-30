# QZone Archiver macOS

A macOS desktop port of the open-source [`salt-fishes/qzone-archiver`](https://github.com/salt-fishes/qzone-archiver) project.

The upstream v4.0.0 desktop application was released for Windows only. Its Electron application and backup engine are largely cross-platform, so this project adds the macOS packaging, native application behaviour and automated Mac builds needed to run the same desktop workflow on Apple Silicon and Intel Macs.

## What it does

The application can locally archive QQ Space content including posts, blogs, albums, videos, guestbook entries, favourites, shares, friends and visitors.

It also preserves the upstream **deleted-post recovery** feature: deleted QQ Space posts can sometimes be reconstructed from the "related to me" / interaction notification data when likes, comments or other surviving interaction records still exist.

Recovery is limited by what QQ Space still exposes. A deleted post with no surviving interaction record cannot be reconstructed by this method.

## macOS port

This port adds:

- macOS `.dmg` and `.zip` packaging
- Apple Silicon (`arm64`) build for M1/M2/M3/M4 Macs
- Intel (`x64`) build
- native macOS application/edit/window menus
- macOS lifecycle behaviour (`Cmd+Q`, dock re-open, window activation)
- persistent QQ Space login session using Electron's `persist:qzone` partition
- Finder-compatible backup folder opening
- automated GitHub Actions build on a real macOS runner
- upstream Apache-2.0 attribution bundled with the application

## Architecture

The port intentionally keeps the upstream backup/recovery engine unchanged as much as possible.

```text
Upstream qzone-archiver v4.0.0
          |
          v
apply-macos-port.mjs
          |
          +-- macOS electron-builder config
          +-- native macOS menu patch
          +-- attribution / licence files
          |
          v
Electron desktop app
          |
     .dmg / .zip
```

This makes the port easier to audit: QQ Space API/recovery logic remains upstream, while this repository focuses on platform adaptation.

## Build locally on a Mac

Requirements:

- macOS 12+
- Node.js 20+
- Git

From this repository's `side-projects/qzone-archiver-macos` directory:

```bash
git clone https://github.com/salt-fishes/qzone-archiver.git upstream-qzone-archiver
node scripts/apply-macos-port.mjs upstream-qzone-archiver

cd upstream-qzone-archiver/desktop
npm install --no-audit --no-fund
npm run dist:mac:arm64
```

For an Intel Mac:

```bash
npm run dist:mac:x64
```

Build output is written to:

```text
desktop/release/
```

## GitHub Actions

The repository includes `.github/workflows/build-qzone-macos.yml`.

The workflow pins the upstream source to the v4.0.0 commit, applies this port, builds on GitHub's macOS runner, and uploads the `.dmg` / `.zip` files as Actions artifacts.

## Opening an unsigned build

The automated build is intentionally unsigned because this project does not contain an Apple Developer signing certificate.

On first launch macOS may show that the developer cannot be verified. Use:

1. Finder → Applications
2. Control-click / right-click `QZoneArchiver`
3. Choose **Open**
4. Confirm **Open**

Alternatively use System Settings → Privacy & Security after the first blocked launch.

## Privacy

- QQ login cookies remain in the local Electron session.
- The port does not add a server or analytics service.
- Backups are written to the directory selected by the user.
- Do not upload cookies, `p_skey`, `skey`, exported private archives or personal QQ data to GitHub.

Use this tool only with accounts and data you are authorised to access.

## Upstream and licence

Based on:

- `salt-fishes/qzone-archiver`
- upstream commit: `63967a184b44ea3eaf339f0abac72bb5244c0a75` (v4.0.0)
- upstream licence: Apache License 2.0

This port preserves upstream attribution and includes the upstream Apache-2.0 licence in generated desktop builds.

## Status

**macOS port implementation: complete**  
**Automated macOS build: configured**  
**Primary target: Apple Silicon (M1/M2/M3/M4)**
