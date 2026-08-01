cask "logi-options-plus" do
    version "1.0"
    sha256 :no_check

    url "https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.zip"
    name "Logitech Options Plus"
    desc "Software for Logitech devices"
    homepage "https://www.logitech.com/en-us/software/logi-options-plus.html"

    livecheck do
      skip "Custom installer has no version information"
    end

  depends_on macos: :catalina

  installer script: {
    executable: "logioptionsplus_installer.app/Contents/MacOS/logioptionsplus_installer",
   args: [
    "--quiet",
    "--analytics", "no",
    "--sso", "no",
    "--flow", "no",
    "--smartactions", "no",
    "--actions-ring", "no",
    "--aipromptbuilder", "no",
  ],
    sudo:       true,
  }

  uninstall launchctl: [
              "com.logi.cp-dev-mgr",
              "com.logi.optionsplus",
              "com.logi.optionsplus.updater",
              "com.logitech.LogiRightSight",
              "com.logitech.LogiRightSight.Agent",
            ],
            quit:      [
              "com.logi.cp-dev-mgr",
              "com.logi.optionsplus",
              "com.logi.optionsplus.driverhost",
              "com.logi.optionsplus.updater",
              "com.logitech.FirmwareUpdateTool",
              "com.logitech.logiaipromptbuilder",
            ],
            pkgutil:   "com.logitech.LogiRightSightForWebcams.pkg",
            delete:    [
              "/Applications/logioptionsplus.app",
              "/Applications/Utilities/Logi Options+ Driver Installer.bundle",
              "/Library/Application Support/Logi",
              "/Library/Application Support/Logitech.localized/LogiOptionsPlus",
            ],
            rmdir:     "/Library/Application Support/Logitech.localized"

  zap trash: [
    "/Users/Shared/logi",
    "/Users/Shared/LogiOptionsPlus",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.logi.optionsplus.sfl4",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.logi.optionsplus.driverhost.sfl4",
    "~/Library/Application Support/Logi",
    "~/Library/Application Support/LogiOptionsPlus",
    "~/Library/HTTPStorages/LogiPluginServiceNative",
    "~/Library/Logs/xlog_logitech",
    "~/Library/Preferences/com.logi.cp-dev-mgr.plist",
    "~/Library/Preferences/com.logi.lps.settings.plist",
    "~/Library/Preferences/com.logi.optionsplus.driverhost.plist",
    "~/Library/Preferences/com.logi.optionsplus.plist",
    "~/Library/Preferences/com.logi.pluginservice.plist",
    "~/Library/Saved Application State/com.logi.optionsplus.savedState",
  ]

  caveats do
    reboot
  end
end
