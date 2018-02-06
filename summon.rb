VERSION = "0.6.6"
SHA = "c95e0c72ba9f4262d5d4c737855c234489ff33d4eb5240e1889e37905cd73698"

class Summon < Formula
  desc "CLI tool that provides on-demand secrets access for common DevOps tools."
  homepage "https://github.com/cyberark/summon"
  url "https://github.com/cyberark/summon/releases/download/v#{VERSION}/summon-darwin-amd64.tar.gz"
  version VERSION
  sha256 SHA

  bottle :unneeded

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
