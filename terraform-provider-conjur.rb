class TerraformProviderConjur < Formula
  desc "Terraform provider for CyberArk Conjur"
  homepage "https://github.com/cyberark/terraform-provider-conjur"
  url "https://github.com/cyberark/terraform-provider-conjur/releases/download/v0.2.0/terraform-provider-conjur-darwin-amd64.tar.gz"
  version "0.2.0"
  sha256 "6161c4a163e4b2560111bdca23f8a0a496080061201f45def3e18be75346396c"
  
  depends_on "terraform"

  def install
    bin.install "terraform-provider-conjur"
  end

  def caveats; <<~EOS
    After installation, you must symlink the provider into Terraform's plugins directory.
    
    mkdir -p ~/.terraform.d/plugins/
    ln -sf /usr/local/Cellar/terraform-provider-conjur/$VERSION/bin/terraform-provider-conjur ~/.terraform.d/plugins/terraform-provider-conjur
    
    Symlinking is necessary because Homebrew is sandboxed and cannot write to your home directory.
    Replace $VERSION above.
    If Homebrew is installing somewhere other than /usr/local/Cellar, update the path as well.
  EOS
  end

  test do
    system "#{bin}/terraform-provider-conjur", "-h"  # running bin directly gives error, exit code 1
  end
end
