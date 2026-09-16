cask "emzero" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "e68e626069caa9c2b7e4fdde70943c90fc2efde890ce78ede4c5aea5e254afbc",
         intel: "28642a873b2400306dfcfa3453994b29f2191abae1a50d93c41de50ef5ca19b6"

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
