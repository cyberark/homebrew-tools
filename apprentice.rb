class Apprentice < Formula
  include Language::Python::Virtualenv

  desc "Management tool for Conjur evaluation images, training materials and tutorials."
  homepage "https://github.com/conjurinc/apprentice"
  url "https://github.com/conjurinc/apprentice/archive/v0.0.5.tar.gz"
  version "0.0.5"
  sha256 "d324e2b883933d5b33b1a889cb0f9a79367365a5ec91a3325b05856c8d62b705"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "Conjur" do
    url "https://files.pythonhosted.org/packages/af/08/6271e8ff18ee37dfdfb4dc828810a6685bc2a2baf706085331989b193c47/Conjur-0.4.4.tar.gz"
    sha256 "61bfd6f343576da926da92400d394c3f7b9669196888e9949005b64736619680"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/16/09/37b69de7c924d318e51ece1c4ceb679bf93be9d05973bb30c35babd596e2/requests-2.13.0.tar.gz"
    sha256 "5722cd09762faa01276230270ff16af7acf7c5c45d623868d9ba116f15791ce8"
  end

  resource "boto" do
    url "https://files.pythonhosted.org/packages/01/e6/c49b2d0c91f644fc067122ddf098f88b02417079053870e26bbbfa9ebb2c/boto-2.45.0.tar.gz"
    sha256 "053d64727b3bd7d24a64163d28feaa044257c5f49343f2c6cdd991c9fd4aab3b"
  end

  resource "progressbar2" do
    url "https://files.pythonhosted.org/packages/93/e7/e1223370a6a9c685c76049460c0c7fa90862195a79d436a86de636ef156f/progressbar2-3.12.0.tar.gz"
    sha256 "5300c821258fdf381317969019828fe724d3e1f1f7555f89bb1aec2d2f0b229b"
  end

  resource "python-utils" do
    url "https://files.pythonhosted.org/packages/46/e8/60bc82e7bb5d9e326c4691ed73e02a2a0e3ce6bb7adefd8cb2d9d8456b3a/python-utils-2.0.1.tar.gz"
    sha256 "985f44edf24918d87531c339f8b126ce2d303cbbc9a4c7fc4dc81ac0726079ff"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
  end

  def install
    virtualenv_install_with_resources

    chmod 0755, "apprentice"
    bin.install "apprentice"
    bin.install "conjur.pem"
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => libexec/"lib/python2.7/site-packages")
  end

  test do
    system "#{bin}/apprentice", "-h"
  end
end
