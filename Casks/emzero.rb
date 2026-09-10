cask "emzero" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "23360e49467f400081cfa9bfdaf6bb08d9bb700d942c879acc3d8cbb9fc9469c",
         intel: "549e6ad895e2f2c313f41bd4a248cd98b1662f53087cb26e320b208e208a1be9"

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
