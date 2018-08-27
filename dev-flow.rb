class DevFlow < Formula
  desc "CLI for standardizing and automating common development tasks"
  homepage "https://github.com/cyberark/dev-flow"
  url "https://github.com/cyberark/dev-flow/releases/download/v0.1.0/summon-conjur-darwin-amd64.tar.gz"
  version "0.1.0"
  sha256 "bdadbf5c0c8811971f2323acc1a89efca7c8b7e26d26d0d706163017ec78f751"

  def install
    bin.install "dev-flow"
  end

  test do
    system "#{bin}/dev-flow", "-h"
  end
end
