VERSION = "0.6.0"
SHA = "235af39c84f9fb690690347135896324f926185fb18f9d8c4cac8059db175baa"

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
