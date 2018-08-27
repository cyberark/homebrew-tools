class DevFlow < Formula
  desc "CLI for standardizing and automating common development tasks"
  homepage "https://github.com/cyberark/dev-flow"
  url "https://github.com/cyberark/dev-flow/releases/download/vSNAPSHOT-ed7d79a124d91a29de2934c3879c37d32a4601b7/summon-conjur-darwin-amd64.tar.gz"
  version "SNAPSHOT-ed7d79a124d91a29de2934c3879c37d32a4601b7"
  sha256 "6b3e37af71111e5a39201651f0f0f055afbfc7978baa133c8506c1b4c2c792a8"

  def install
    bin.install "dev-flow"
  end

  test do
    system "#{bin}/dev-flow", "-h"
  end
end
