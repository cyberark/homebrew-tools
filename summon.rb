class Summon < Formula
  desc "CLI that provides on-demand secrets access for common DevOps tools."
  homepage "https://github.com/cyberark/summon"
  url "https://github.com/cyberark/summon/releases/download/v0.6.9/summon-darwin-amd64.tar.gz"
  version "0.6.9"
  sha256 "5e480dc875f7160ac00b8be370ddc444096b6655919e89a166dde23a9101105b"

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
