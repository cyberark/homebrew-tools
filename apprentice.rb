class Apprentice < Formula
  desc "Management tool for Conjur evaluation images, training materials and tutorials."
  homepage "https://github.com/conjurinc/apprentice"
  url "https://github.com/conjurinc/apprentice/archive/0.0.3.tar.gz"
  version "0.0.3"
#  sha256 "e4349cd72036447ce9758f9937848ef1636301d5ed390a48c3d22306b9d6fe05"

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on :pandoc

  resource "progressbar2" do
    url "https://files.pythonhosted.org/packages/93/e7/e1223370a6a9c685c76049460c0c7fa90862195a79d436a86de636ef156f/progressbar2-3.12.0.tar.gz"
    sha256 "5300c821258fdf381317969019828fe724d3e1f1f7555f89bb1aec2d2f0b229b"
  end

  resource "Conjur" do
    url "https://files.pythonhosted.org/packages/af/08/6271e8ff18ee37dfdfb4dc828810a6685bc2a2baf706085331989b193c47/Conjur-0.4.4.tar.gz"
    sha256 "61bfd6f343576da926da92400d394c3f7b9669196888e9949005b64736619680"
  end
  
  def install
    vendor_site_packages = libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", vendor_site_packages

    resources.each do |r|
      r.stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"

    chmod 0755, "apprentice"
    bin.install "apprentice"
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/apprentice", "-v"
  end
end
