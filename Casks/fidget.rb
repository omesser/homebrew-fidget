# Token is the product name. url, app, quit, zap, and the caveat name the
# bundle in one Release disk image; scripts/bump-homebrew-cask.sh rewrites
# them from that tag. livecheck follows GitHub's latest Release.
cask "fidget" do
  version "0.5.0"
  sha256 "b415b5fe83914c24d1eac1f08beeccac5819bc0a695bb5c91f83e9984d39017d"

  url "https://github.com/omesser/fidget/releases/download/v#{version}/Fidget_#{version}_aarch64.dmg"
  name "Fidget"
  desc "Desktop companion that lives on your screen"
  homepage "https://github.com/omesser/fidget"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Fidget.app"

  uninstall quit: "dev.omesser.fidget"

  zap trash: [
    "~/Library/Application Support/fidget",
  ]

  caveats <<~EOS
    This build installs Fidget. It is not signed. Dismiss the Gatekeeper
    dialog, then System Settings → Privacy & Security → Open Anyway.
  EOS
end
