VERSION = "0.6.3"
SHA = "9cc6b118f85195ec13abcc49399411fed1959f30fc43333ca242dccdcbe1781f"

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
