VERSION = "0.6.4"
SHA = "28767f28ac6f4e33e5e2bad9f40d2989b51e04ef09c78c88cff28e3f03781481"

class Summon < Formula
  desc "Tool to make working with secrets easier"
  homepage "https://github.com/conjurinc/summon"
  url "https://github.com/conjurinc/summon/releases/download/v#{VERSION}/summon_v#{VERSION}_darwin_amd64.tar.gz"
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
