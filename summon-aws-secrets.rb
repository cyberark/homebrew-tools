class SummonAwsSecrets < Formula
  desc "Conjur provider for AWS Secrets Manager"
  homepage "https://github.com/cyberark/summon-aws-secrets"
  url "https://github.com/cyberark/summon-aws-secrets/releases/download/v0.3.0/summon-aws-secrets-darwin-amd64.tar.gz"
  version "0.3.0"
  sha256 "f995961357f82709c78a9850186d6110a6075bc7d61a9eadc50e28b08346c455"

  def install
    target = lib/"summon"
    target.install "summon-aws-secrets"
  end

  test do
    system lib/"summon"/"summon-aws-secrets", "-V"
  end
end
