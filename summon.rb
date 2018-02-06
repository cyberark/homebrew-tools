VERSION = "0.6.6"
SHA = "dfbccbc484dba027e4998924174a16cd6b1cc5127ad54dbd900a73d047554c9e"

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
