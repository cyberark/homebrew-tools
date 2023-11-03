# typed: false
# frozen_string_literal: true

require_relative 'github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class SummonAwsSecrets < Formula
  @@repo = "cyberark/summon-aws-secrets"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "AWS Secrets Manager provider for Summon"
  homepage "https://github.com/#{@@repo}"
  version @@ver

  @@artifact = @@artifacts["summon-aws-secrets-#{OS.kernel_name.downcase}-#{GithubUpdate.arch(Hardware::CPU.type)}.tar.gz"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]
  def install
    target = lib/"summon"
    target.install "summon-aws-secrets"
  end

  test do
    system lib/"summon"/"summon-aws-secrets", "-v"
  end
end
