class SummonConjur < Formula
  desc "Conjur provider for Summon"
  homepage "https://github.com/cyberark/summon-conjur"
  url "https://github.com/cyberark/summon-conjur/releases/download/v0.5.3/summon-conjur-darwin-amd64.tar.gz"
  version "0.5.3"
  sha256 "c878a4949e0202363382df8646be537684576f8245e4b04bcbc79fce640dc8eb"

  def install
    target = lib/"summon"
    target.install "summon-conjur"
  end

  test do
    system lib/"summon"/"summon-conjur", "-V"
  end
end
