cask "dirigenta-ui" do
  version "0.9.13"
  sha256 "9e2d8e074166b91907bae8e9c3bb04e5e0985d08adbbed5a9d6db9b0a2abd15a"

  url "https://github.com/bxt/dirigenta-ui/releases/download/v#{version}/dirigenta-ui-v#{version}.zip"
  name "dirigenta-ui"
  desc "Menu bar controller for IKEA Dirigera smart home hubs"
  homepage "https://github.com/bxt/dirigenta-ui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "dirigenta-ui.app"

  postflight do
    # dirigenta-ui is unsigned/un-notarized, so macOS quarantines it and
    # Gatekeeper blocks the first launch. Clear the attribute on install so the
    # app opens without a manual override. must_succeed is false because xattr
    # exits non-zero for nested files that never had the attribute.
    system_command "/usr/bin/xattr",
                   args:         ["-r", "-d", "com.apple.quarantine", "#{appdir}/dirigenta-ui.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/dirigenta-ui",
    "~/Library/Caches/bxt.dirigenta-ui",
    "~/Library/HTTPStorages/bxt.dirigenta-ui",
    "~/Library/Preferences/bxt.dirigenta-ui.plist",
    "~/Library/Saved Application State/bxt.dirigenta-ui.savedState",
  ]

  caveats <<~EOS
    #{token} is not signed or notarized. The quarantine attribute is cleared
    automatically on install so the app can open. If macOS still blocks it (for
    example after you move the app), clear it again manually:

      xattr -r -d com.apple.quarantine "#{appdir}/dirigenta-ui.app"

    Requires macOS 26.2 or later.
  EOS
end
