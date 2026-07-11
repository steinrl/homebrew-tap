# Logi Options+ Offline for Homebrew 6.x

A Homebrew cask for installing the **offline** version of Logi Options+.

Homebrew cask only provides the standard installer, and cannot pass required arguments during installation to turn off certain features (flow, smartactions, actions-ring) without modifying it. This cask packages the offline installer with the required installation logic, allowing Logi Options+ Offline to be installed through Homebrew.

More information here: (https://support.logi.com/hc/en-us/articles/11570501236119-Logitech-Options-offline-installer)

Tested on macOS 26.5.x.

## Installation

```sh
brew tap steinrl/tap
brew trust steinrl/tap
brew install --cask logi-options-plus-offline
```

## Reinstall

```sh
brew reinstall --cask logi-options-plus-offline
```

## Uninstall

```sh
brew uninstall --cask --zap logi-options-plus-offline
brew untap steinrl/tap
```
