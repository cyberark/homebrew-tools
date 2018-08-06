class Summon < Formula
  desc "CLI that provides on-demand secrets access for common DevOps tools."
  homepage "https://github.com/cyberark/summon"
  url "https://github.com/cyberark/summon/releases/download/v0.6.7/summon-darwin-amd64.tar.gz"
  version "0.6.7"
  sha256 "9aad973343db85433e8b5dfa53d4c0f3851073cd2389f1278603b13ae5486fd5"

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
