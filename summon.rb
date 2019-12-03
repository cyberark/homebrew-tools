class Summon < Formula
  desc "CLI that provides on-demand secrets access for common DevOps tools."
  homepage "https://github.com/cyberark/summon"
  url "https://github.com/cyberark/summon/releases/download/v0.8.0/summon-darwin-amd64.tar.gz"
  version "0.8.0"
  sha256 "bbb3340492d6ef97634a55a0a54b541e17ab13d28044527f21366272caf32d55"

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
