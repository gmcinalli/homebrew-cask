cask "boom" do
  version "1.6.11"
  sha256 "624f8f01299d657e677098acfe4df6291136da5cff9949218168f4aced9a3be3"

  # d13nae1tw8tdnq.cloudfront.net/Boom2mac/ was verified as official when first introduced to the cask
  url "https://d13nae1tw8tdnq.cloudfront.net/Boom2mac/webstore/Boom2.dmg"
  appcast "https://macupdater.net/cgi-bin/check_urls/check_url_lastmodified.cgi?url=https://d13nae1tw8tdnq.cloudfront.net/Boom2mac/webstore/Boom2.dmg"
  name "Boom"
  desc "Transforms audio input"
  homepage "https://www.globaldelight.com/boom"

  depends_on macos: ">= :yosemite"

  app "Boom 2.app"

  uninstall kext:      "com.globaldelight.driver.Boom2Device",
            launchctl: "com.globaldelight.Boom2Daemon",
            signal:    ["TERM", "com.globaldelight.Boom2"]

  zap trash: [
    "~/Library/Application Support/com.globaldelight.Boom2",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.globaldelight.boom2.sfl*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.globaldelight.boom2daemon.sfl*",
    "~/Library/Preferences/com.globaldelight.Boom2.plist",
    "~/Library/Preferences/com.globaldelight.Boom2Daemon.plist",
  ]
end
