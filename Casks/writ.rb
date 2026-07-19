cask "writ" do
  version "0.1.0"
  sha256 "384516b243e1ea8dcba8594db9576b778beaaeb906b6bf9c8a348d2e5fea891b"

  url "https://github.com/ibrahemid/writ/releases/download/v#{version}/Writ_#{version}_universal.dmg"
  name "Writ"
  desc "Lightweight, always-ready text editor for developers"
  homepage "https://github.com/ibrahemid/writ"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Writ.app"

  zap trash: [
    "~/Library/Application Support/com.writ.editor",
    "~/Library/Caches/com.writ.editor",
    "~/Library/Preferences/com.writ.editor.plist",
    "~/Library/Saved Application State/com.writ.editor.savedState",
    "~/Library/WebKit/com.writ.editor",
  ]
end
