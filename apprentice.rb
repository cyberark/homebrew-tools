class Apprentice < Formula
  desc "Management tool for Conjur evaluation images, training materials and tutorials."
  homepage "https://github.com/conjurinc/apprentice"
  url "https://github.com/conjurinc/apprentice/archive/0.0.2.tar.gz"
  version "0.0.2"
#  sha256 "e4349cd72036447ce9758f9937848ef1636301d5ed390a48c3d22306b9d6fe05"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "progressbar2" do
    url "https://files.pythonhosted.org/packages/93/e7/e1223370a6a9c685c76049460c0c7fa90862195a79d436a86de636ef156f/progressbar2-3.12.0.tar.gz"
    sha256 "5300c821258fdf381317969019828fe724d3e1f1f7555f89bb1aec2d2f0b229b"
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
