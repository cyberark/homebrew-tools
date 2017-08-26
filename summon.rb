VERSION = "0.6.5"
SHA = "3e60ee735152d9487b932f460fb91ecd6173c346dd755cc5ddf20f2bb24f9b56"

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
