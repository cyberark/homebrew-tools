# typed: false
# frozen_string_literal: true

require_relative 'github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class SecretlessBroker < Formula
  @@repo = "cyberark/secretless-broker"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "Secures your apps by making them Secretless"
  homepage "https://secretless.io"
  version @@ver
  @@artifact = @@artifacts["secretless-broker_#{@@ver}_#{OS.kernel_name.downcase}_#{GithubUpdate.arch(Hardware::CPU.type)}.tar.gz"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]

  def install
    bin.install "secretless-broker"
  end

  test do
    system "#{bin}/secretless-broker", "-version"
  end
end
