VERSION = "0.6.5"
SHA = "9c239cf593e302737e4565a9233a0856b35b3c81ad32b04d718505a10ba51e62"

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
