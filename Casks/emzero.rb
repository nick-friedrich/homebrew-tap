cask "emzero" do
  arch arm: "arm64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "393415d1ac64d6272226ce930057bd0bb5445f3481e1df28746c00b56cdf7c37",
         intel: "c7fda54540949ae1820df6e80c54c27ee8bce21f3456d96e735016f3e96637e1"

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
