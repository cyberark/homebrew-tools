class DevFlow < Formula
  desc "CLI for standardizing and automating common development tasks"
  homepage "https://github.com/cyberark/dev-flow"
  url "https://github.com/cyberark/dev-flow/releases/download/v0.1.0/dev-flow-darwin-amd64.tar.gz"
  version "0.1.0"
  sha256 "e2f5132cadf1a2ae2f20b89ec648c5026807af33a28ecd5457f771381b220b41"

  def install
    bin.install "dev-flow"
  end

  test do
    system "#{bin}/dev-flow", "-h"
  end
end
