VERSION = "0.5.0"
SHA = "5971a3f18dd0f5ca8aa156d18017922916ae385311c0eb0db634b8674d6f7ab8"

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
