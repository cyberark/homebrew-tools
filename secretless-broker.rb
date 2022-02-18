# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SecretlessBroker < Formula
  desc "Secures your apps by making them Secretless"
  homepage "https://secretless.io"
  version "1.7.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/secretless-broker/releases/download/v1.7.10/secretless-broker_1.7.10_darwin_amd64.tar.gz"
      sha256 "6dccee46083900db6888391cb4e198a6aacae429f9e93973bf0c52f246df0d6f"

      def install
        bin.install "secretless-broker"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/secretless-broker/releases/download/v1.7.10/secretless-broker_1.7.10_linux_amd64.tar.gz"
      sha256 "7de0e290d447249fa9e7dbcb6f2e1b045a9236bdc0607c231ffda3b29e625232"

      def install
        bin.install "secretless-broker"
      end
    end
  end

  test do
    system "#{bin}/secretless-broker", "-version"
  end
end
