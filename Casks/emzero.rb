cask "emzero" do
  arch arm: "arm64", intel: "x64"

  version "1.5.0"
  sha256 arm:   "86fb9c001a7b81d86ffe53e2f77453898e4f6c3f4c38fde0cf3de30ff3fe69a9",
         intel: "15c055c1bf4a24d84bd5627f8bfffe521895dbf3b2e15b562ab86dbb4d9275f6"

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
