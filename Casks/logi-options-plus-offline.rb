cask "logi-options-plus-offline" do
  version "1.8.8"
  sha256 "d8f6309ef1e6b8712f3ee8bcfbca4e5443bacc862fbb39f9d48df6d34ca036ac"

  url "https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer_offline.zip"
  name "Logi Options Offline Installer"
  desc "Logitech Options offline installer for configuring Logitech devices"
  homepage "https://prosupport.logi.com/hc/en-us/articles/10991109278871-Logitech-Options-Offline-Installer"

  livecheck do
    skip "Offline version"
  end

  depends_on macos: ">= :catalina"

  # Script is copied from the official Logi Options cask
  # See https://github.com/Homebrew/homebrew-cask/blob/4d3d9d83e738b2c90a7d515f0417f0666341f3aa/Casks/l/logi-options+.rb
  installer script: {
    executable: "logioptionsplus_installer_offline.app/Contents/MacOS/logioptionsplus_installer",
    args:       ["--quiet"],
    sudo:       true,
  }

  uninstall launchctl: [
              "com.logi.cp-dev-mgr",
              "com.logi.optionsplus",
              "com.logi.optionsplus.updater",
            ],
            quit:      [
              "com.logi.cp-dev-mgr",
              "com.logi.optionsplus",
              "com.logi.optionsplus.driverhost",
              "com.logi.optionsplus.updater",
              "com.logitech.FirmwareUpdateTool",
              "com.logitech.logiaipromptbuilder",
            ],
            delete:    [
              "/Applications/logioptionsplus.app",
              "/Applications/Utilities/Logi Options+ Driver Installer.bundle",
              "/Library/Application Support/Logitech.localized/LogiOptionsPlus",
            ],
            rmdir:     "/Library/Application Support/Logitech.localized"

  zap trash: [
    "/Users/Shared/logi",
    "/Users/Shared/LogiOptionsPlus",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.logi.optionsplus*.sfl*",
    "~/Library/Application Support/LogiOptionsPlus",
    "~/Library/Preferences/com.logi.cp-dev-mgr.plist",
    "~/Library/Preferences/com.logi.optionsplus.driverhost.plist",
    "~/Library/Preferences/com.logi.optionsplus.plist",
    "~/Library/Saved Application State/com.logi.optionsplus.savedState",
  ]

  caveats do
    reboot
  end
end
