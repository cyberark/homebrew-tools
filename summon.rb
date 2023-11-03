# typed: false
# frozen_string_literal: true

require_relative 'github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class Summon < Formula
  @@repo = "cyberark/summon"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "CLI that provides on-demand secrets access for common DevOps tools."
  homepage "https://github.com/#{@@repo}"
  version @@ver

  @@artifact = @@artifacts["summon-#{OS.kernel_name.downcase}-#{GithubUpdate.arch(Hardware::CPU.type)}.tar.gz"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]

  def install
    bin.install "summon"
  end

  test do
    system "#{bin}/summon", "-v"
  end
end
