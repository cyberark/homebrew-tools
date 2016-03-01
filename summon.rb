VERSION = "0.4.0"
SHA = "c48c39356e85260e2394bf94b6f489654b43db2ddf12c08d99c5f640b789ae59"

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
