# This file was generated by GoReleaser. DO NOT EDIT.
class SecretlessBroker < Formula
  desc "Secures your apps by making them Secretless"
  homepage "https://secretless.io"
  version "1.4.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cyberark/secretless-broker/releases/download/v1.4.1/secretless-broker_1.4.1_darwin_amd64.tar.gz"
    sha256 "0b274c6f4b9189604f255365b1f348440a81ba7ead6f636effa821a9f399293d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/secretless-broker/releases/download/v1.4.1/secretless-broker_1.4.1_linux_amd64.tar.gz"
      sha256 "9ec6f07d18e582cb1f8f2550fda9e20da93cd262859ef8697380cf663c58ef00"
    end
  end

  def install
    bin.install "secretless-broker"
  end

  test do
    system "#{bin}/secretless-broker", "-version"
  end
end
