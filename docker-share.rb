VERSION = "0.1.0"
SHA = "1ea930bb694b72041ddd7116bc73515d7788261ee50040ef9d1baea46948eb2d"

APP = "docker-share"
DESCRIPTION = "Tool for granting customers access to Conjur appliance Docker images"

class DockerShare < Formula
  desc DESCRIPTION
  homepage "https://github.com/conjurinc/#{APP}"
  url "https://github.com/conjurinc/#{APP}/releases/download/v#{VERSION}/#{APP}_v#{VERSION}_darwin_amd64.tar.gz"
  version VERSION
  sha256 SHA

  bottle :unneeded

  def install
    bin.install "#{APP}"
  end

  test do
    system "#{bin}/#{APP}", "-v"
  end
end
