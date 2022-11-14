# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TerraformProviderConjur < Formula
  desc "Terraform provider for CyberArk Conjur"
  homepage "https://github.com/cyberark/terraform-provider-conjur"
  version "0.6.4"

  depends_on "terraform"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cyberark/terraform-provider-conjur/releases/download/v0.6.4/terraform-provider-conjur_0.6.4_darwin_arm64.zip"
      sha256 "207db94c8f1a6b4c5be7f43ca3b8609c5df44f5b991c1af6448176f517f42fd7"

      def install
        bin.install "terraform-provider-conjur_v0.6.4"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/terraform-provider-conjur/releases/download/v0.6.4/terraform-provider-conjur_0.6.4_darwin_amd64.zip"
      sha256 "7c2b5963870d04549c591edaa78f09ea8888c1aba99b4a4bcf83aa30a68ebe7d"

      def install
        bin.install "terraform-provider-conjur_v0.6.4"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/terraform-provider-conjur/releases/download/v0.6.4/terraform-provider-conjur_0.6.4_linux_amd64.zip"
      sha256 "9b26952621775aa904ec02cc72edbaa70cefbc0a96575a0f55fc08570a193d73"

      def install
        bin.install "terraform-provider-conjur_v0.6.4"
      end
    end
  end

  def caveats
    <<~EOS
      After installation, you must symlink the provider into Terraform's plugins directory.
      Symlinking is necessary because Homebrew is sandboxed and cannot write to your home directory.

      # Make the plugins directory if not present
      mkdir -p ~/.terraform.d/plugins/

      # Remove any old unversioned plugins (if applicable)
      rm -f  ~/.terraform.d/plugins/terraform-provider-conjur

      # Symlink the provider to your home dir. If Homebrew is installing somewhere other than /usr/local/Cellar, update the path as well.
      ln -sf /usr/local/Cellar/terraform-provider-conjur/0.6.4/bin/terraform-provider-conjur_v0.6.4 ~/.terraform.d/plugins/terraform-provider-conjur_v0.6.4
    EOS
  end

  test do
    # Running bin directly gives error, exit code 1
    system "#{bin}/terraform-provider-conjur_v0.6.4", "-h"
  end
end
