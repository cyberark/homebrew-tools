class Summon < Formula
  desc "CLI that provides on-demand secrets access for common DevOps tools."
  homepage "https://github.com/cyberark/summon"
  url "https://github.com/cyberark/summon/releases/download/v0.6.8/summon-darwin-amd64.tar.gz"
  version "0.6.8"
  sha256 "3b3f9124970c711994625fd0f855dfaf25f403f4ed9a82ed570249ec439c1d3b"

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
