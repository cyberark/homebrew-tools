# typed: false
# frozen_string_literal: true

require_relative 'github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class SummonConjur < Formula
  @@repo = "cyberark/summon-conjur"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "Conjur provider for Summon"
  homepage "https://github.com/#{@@repo}"
  version @@ver

  @@artifact = @@artifacts["summon-conjur-#{OS.kernel_name.downcase}-#{GithubUpdate.arch(Hardware::CPU.type)}.tar.gz"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]

  def install
    target = lib/"summon"
    target.install "summon-conjur"
  end

  test do
    system lib/"summon"/"summon-conjur", "-V"
  end
end
