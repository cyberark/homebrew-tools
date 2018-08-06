class SummonConjur < Formula
  desc "Conjur provider for Summon"
  homepage "https://github.com/cyberark/summon-conjur"
  url "https://github.com/cyberark/summon-conjur/releases/download/v0.5.2/summon-conjur-darwin-amd64.tar.gz"
  version "0.5.2"
  sha256 "797cff087b048b3f8400a1b03fd342391c54d39cd7cf734602983cc8cc80b972"

  def install
    target = lib/"summon"
    target.install "summon-conjur"
  end

  test do
    system lib/"summon"/"summon-conjur", "-V"
  end
end
