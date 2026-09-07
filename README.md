# Emzero Homebrew tap

Homebrew cask for [Emzero](https://github.com/nick-friedrich/emzero), a fast, private desktop mail client.

## Install

```sh
brew install --cask nick-friedrich/tap/emzero
```

Or tap first, then install:

```sh
brew tap nick-friedrich/tap
brew install --cask emzero
```

In a `Brewfile`:

```ruby
tap "nick-friedrich/tap"
cask "emzero"
```

## Requirements

- Apple Silicon (arm64). Intel Macs are not currently supported, because the
  release pipeline only builds a `darwin-arm64` artifact.
- macOS 12 (Monterey) or newer.

Builds are signed with a Developer ID certificate and notarized by Apple, so
they launch without a Gatekeeper prompt.

## Upgrading and removal

```sh
brew upgrade --cask emzero
```

```sh
brew uninstall --cask emzero
```

`brew uninstall` leaves account data and settings in place. To remove those too:

```sh
brew uninstall --zap --cask emzero
```

Note that a zap deletes locally cached mail and stored account credentials.

## Issues

Report problems with the application itself at
[nick-friedrich/emzero](https://github.com/nick-friedrich/emzero/issues).
Use this repository's issues only for packaging problems.
