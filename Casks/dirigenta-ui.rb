cask "dirigenta-ui" do
  version "0.9.12"
  sha256 "34be110695e9b6a9a6b52381f7b0b01688fd5ce13aff7d0ac40c32ff960fa5b0"

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

  zap trash: [
    "~/Library/Application Support/dirigenta-ui",
    "~/Library/Caches/bxt.dirigenta-ui",
    "~/Library/HTTPStorages/bxt.dirigenta-ui",
    "~/Library/Preferences/bxt.dirigenta-ui.plist",
    "~/Library/Saved Application State/bxt.dirigenta-ui.savedState",
  ]

  caveats <<~EOS
    #{token} is not signed or notarized, so macOS Gatekeeper blocks it the first
    time you try to open it. After installing, clear the quarantine attribute:

      xattr -r -d com.apple.quarantine "#{appdir}/dirigenta-ui.app"

    Or skip quarantine at install time instead:

      brew install --cask --no-quarantine #{token}

    Requires macOS 26.2 or later.
  EOS
end
