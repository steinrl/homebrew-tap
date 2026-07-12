cask "logi-options-plus-offline" do
  version "1.0"
  sha256 :no_check

  url "https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer_offline.zip"
  name "Logi Options+ Offline Installer"
  desc "Offline installer for Logitech Options+"
  homepage "https://support.logi.com/hc/en-us/articles/11570501236119-Logitech-Options-offline-installer"

  livecheck do
    skip "Offline installer has no version information"
  end

  depends_on macos: :catalina

  installer script: {
    executable: "logioptionsplus_installer_offline.app/Contents/MacOS/logioptionsplus_installer",
    args: ["--quiet"],
    sudo: true,
  }

  uninstall launchctl: [
              "com.logi.cp-dev-mgr",
              "com.logi.optionsplus",
              "com.logi.optionsplus.updater",
              "com.logitech.LogiRightSight",
              "com.logitech.LogiRightSight.Agent",
            ],
            quit: [
              "com.logi.cp-dev-mgr",
              "com.logi.optionsplus",
              "com.logi.optionsplus.driverhost",
              "com.logi.optionsplus.updater",
            ],
            pkgutil: [
              "com.logitech.LogiRightSightForWebcams.pkg",
              "com.logi.installer.pluginservice.package",
              "com.logi.installer.pluginservice.media.package",
            ],
            delete: [
              "/Applications/logioptionsplus.app",
              "/Applications/Utilities/Logi Options+ Driver Installer.bundle/Logi Options+ Driver Installer.app",
              "/Applications/Utilities/LogiPluginService.app",
              "/Library/Application Support/Logi/LogiPluginService",
              "/Library/Application Support/Logitech.localized/LogiOptionsPlus",
              "/Library/Application Support/Logi/LogiOptionsPlus",
              "/Library/Logs/Logi/LogiOptionsPlus",
            ]

  zap trash: [
    "~/Library/Application Support/LogiOptionsPlus",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.logi.optionsplus.sfl4",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.logi.optionsplus.driverhost.sfl4",
    "~/Library/Preferences/com.logi.cp-dev-mgr.plist",
    "~/Library/Preferences/com.logi.optionsplus.driverhost.plist",
    "~/Library/Preferences/com.logi.optionsplus.plist",
    "~/Library/Preferences/com.logi.pluginservice.plist",
    "~/Library/Saved Application State/com.logi.optionsplus.savedState",
  ]

  caveats do
    reboot
  end
end
