# typed: false
# frozen_string_literal: true

require_relative 'github-update'

# This formulae will fetch the latest release from github. Versioning is
# still functional so homebrew will know which version is installed and
# when updates are available.
class TerraformProviderConjur < Formula
  @@repo = "cyberark/terraform-provider-conjur"
  @@ver, @@artifacts = GithubUpdate.getLatestRelease(@@repo)
  desc "Terraform provider for CyberArk Secrets Manager"
  homepage "https://github.com/#{@@repo}"
  version @@ver

  @@artifact = @@artifacts["terraform-provider-conjur_#{@@ver}_#{OS.kernel_name.downcase}_#{GithubUpdate.arch(Hardware::CPU.type)}.zip"]
  url @@artifact["url"]
  sha256 @@artifact["hash"]

  depends_on "terraform"

  def install
    bin.install "terraform-provider-conjur_v#{@@ver}"
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
      ln -sf /usr/local/Cellar/terraform-provider-conjur/#{@@ver}/bin/terraform-provider-conjur_v#{@@ver} ~/.terraform.d/plugins/terraform-provider-conjur_v#{@@ver}
    EOS
  end

  test do
    # Running bin directly gives error, exit code 1
    # So just check some expected output is there.
    system "#{bin}/terraform-provider-conjur_v#{@@ver} 2>&1 | grep 'This binary is a plugin'"
  end
end
