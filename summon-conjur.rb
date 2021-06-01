# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SummonConjur < Formula
  desc "Conjur provider for Summon"
  homepage "https://github.com/cyberark/summon-conjur"
  version "0.5.5"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/summon-conjur/releases/download/v0.5.5/summon-conjur-darwin-amd64.tar.gz"
      sha256 "3cf85dcb535a6d60823be91d2a6521cbbae61d99c0bea4b4e1b4b678f94b3c1b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/summon-conjur/releases/download/v0.5.5/summon-conjur-linux-amd64.tar.gz"
      sha256 "cef5eace1438222dfd4ff0b5ab06c19c21073e9f477dc9ef02ca279e2651e6d4"
    end
  end

  def install
    target = lib/"summon"
    target.install "summon-conjur"
  end

  test do
    system lib/"summon"/"summon-conjur", "-V"
  end
end
