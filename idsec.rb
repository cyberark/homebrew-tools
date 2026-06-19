# typed: false
# frozen_string_literal: true

require_relative 'lib/github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class Idsec < Formula
  @@repo = "cyberark/idsec-cli-golang"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "CyberArk Identity Security command line interface"
  homepage "https://github.com/#{@@repo}"
  version @@ver

  @@artifact = @@artifacts["idsec_#{@@ver}_#{OS.kernel_name.downcase}_#{GithubUpdate.arch(Hardware::CPU.type)}.tar.gz"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]

  def install
    if OS.mac?
      bin.install "idsec-darwin" => "idsec"
    else
      bin.install "idsec-linux" => "idsec"
    end
  end

  test do
    system "#{bin}/idsec", "version"
  end
end
