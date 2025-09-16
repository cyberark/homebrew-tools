# typed: false
# frozen_string_literal: true

require_relative 'github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class ConjurCli < Formula
  @@repo = "cyberark/conjur-cli-go"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "CyberArk Secrets Manager command line interface"
  homepage "https://github.com/#{@@repo}"
  version @@ver

  @@artifact = @@artifacts["conjur-cli-go_#{@@ver}_#{OS.kernel_name.downcase}_#{GithubUpdate.arch(Hardware::CPU.type)}.tar.gz"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]

  def install
    bin.install "conjur"
  end

  test do
    system "#{bin}/conjur", "--version"
  end
end
