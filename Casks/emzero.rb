cask "emzero" do
  version "0.1.0"
  sha256 "fac10a4b7966e8a76435b8a72b36976f321f6dc38d8e59b9fe2a1f466b63bac3"

  url "https://github.com/nick-friedrich/emzero/releases/download/v#{version}/Emzero-darwin-arm64-#{version}.zip"
  name "Emzero"
  desc "Fast, private desktop mail client"
  homepage "https://github.com/nick-friedrich/emzero"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Emzero.app"

  # v0.1.0 ships CFBundleIdentifier com.electron.emzero; later releases use
  # email.emzero.desktop. Both are listed so a zap cleans up either install.
  zap trash: [
    "~/Library/Application Support/Emzero",
    "~/Library/Logs/Emzero",
    "~/Library/Preferences/com.electron.emzero.plist",
    "~/Library/Preferences/email.emzero.desktop.plist",
    "~/Library/Saved Application State/com.electron.emzero.savedState",
    "~/Library/Saved Application State/email.emzero.desktop.savedState",
  ]
end
