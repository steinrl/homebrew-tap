# Logi Options+ variants for Homebrew 6.x

This tap provides **offline** and **customized** variants of Logitech Logi Options+ for installation through Homebrew.

The standard Homebrew cask (`logi-options-plus`) installs only the default online package and does not allow passing the installation arguments needed to disable certain features without modifying the cask itself. Those features include:

- Flow
- SmartActions
- Actions Ring
- Device recommendations
- Logi Voice

## Available casks

### `logi-options-plus-offline`
Packages Logitech’s official offline installer and includes the required installation logic to make Logi Options+ Offline installable through Homebrew.

More information: [Logitech Options+ offline installer](https://support.logi.com/hc/en-us/articles/11570501236119-Logitech-Options-offline-installer)

### `logi-options-plus-custom`
Uses the official online installer, but disables Flow, SmartActions, Actions Ring, device recommendations, and Logi Voice during installation.

## Compatibility

Tested on macOS 26.5.x.

## Installation

```sh
brew tap steinrl/tap
brew trust steinrl/tap
brew install --cask logi-options-plus-offline
# or
brew install --cask logi-options-plus-custom
```

## Reinstall

```sh
brew reinstall --cask logi-options-plus-offline
```

## Uninstall

```sh
brew uninstall --cask --zap logi-options-plus-offline
# or
brew uninstall --cask --zap logi-options-plus-custom
brew untap steinrl/tap
```
