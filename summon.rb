class Summon < Formula
  desc "Tool to make working with secrets easier"
  homepage "https://github.com/conjurinc/summon"
  url "https://github.com/conjurinc/summon/releases/download/v0.3.2/summon_v0.3.2_darwin_amd64.tar.gz"
  version "0.3.2"
  sha256 "2d98e687a65223ec81c950d8d3f7877b7161fc88cd66e2cd85418e03cf9baf3d"

  bottle :unneeded

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
