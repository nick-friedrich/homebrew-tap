cask "emzero" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "923bae8eed501c117fe07e2bd8238bbcb1f5bab137581e477087fa471310a720",
         intel: "2203344853bba2be3ce5c9e5c2504a893418fbd371b857c976a1f9cb4aee2cba"

  url "https://github.com/nick-friedrich/emzero/releases/download/v#{version}/Emzero-darwin-#{arch}-#{version}.zip"
  name "Emzero"
  desc "Fast, private desktop mail client"
  homepage "https://github.com/nick-friedrich/emzero"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Emzero.app"

  # v0.1.0 shipped CFBundleIdentifier com.electron.emzero; v0.1.1 onward uses
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
