# homebrew-dirigenta-ui

A [Homebrew](https://brew.sh) tap for [**dirigenta-ui**](https://github.com/bxt/dirigenta-ui) — a macOS menu bar app for controlling your [IKEA Dirigera](https://www.ikea.com/de/de/p/dirigera-hub-fuer-smarte-produkte-weiss-smart-10503406/) smart home hub.

## Install

```sh
brew tap bxt/dirigenta-ui
brew trust bxt/dirigenta-ui
brew install dirigenta-ui
```

The `brew trust` step is required: Homebrew refuses to load casks from
third-party (non-official) taps until you explicitly trust them. You only run
it once per tap. If you skip it, `brew install` aborts with a
`Refusing to load cask … from untrusted tap` error.

### Gatekeeper

dirigenta-ui is not signed or notarized. The cask clears the quarantine
attribute automatically on install, so the app opens normally — no extra step
needed.

If macOS ever blocks it anyway (for example after you move the app), clear the
attribute manually:

```sh
xattr -r -d com.apple.quarantine "/Applications/dirigenta-ui.app"
```

## Upgrade

```sh
brew upgrade dirigenta-ui
```

## Uninstall

```sh
brew uninstall dirigenta-ui
```

To also remove preferences and cached data:

```sh
brew uninstall --zap dirigenta-ui
```

## License

The cask in this tap is available under the terms of the
[BSD 2-Clause license](LICENSE). dirigenta-ui itself is licensed separately —
see the [app repository](https://github.com/bxt/dirigenta-ui).
