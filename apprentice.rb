class Apprentice < Formula
  include Language::Python::Virtualenv

  desc "Management tool for Conjur evaluation images, training materials and tutorials."
  homepage "https://github.com/conjurinc/apprentice"
  url "https://github.com/conjurinc/apprentice/archive/v0.0.4.tar.gz"
  version "0.0.4"
  sha256 "c4995f10a58bf8584bcdb5168cd3b0783b3120c1c2700793ff3ce971d5f13411"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    virtualenv_install_with_resources

    chmod 0755, "apprentice"
    bin.install "apprentice"
  end

  test do
    system "#{bin}/apprentice", "-h"
  end
end
