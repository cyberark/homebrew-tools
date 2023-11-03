class DevFlow < Formula
  desc "CLI for standardizing and automating common development tasks"
  homepage "https://github.com/cyberark/dev-flow"
  url "https://github.com/cyberark/dev-flow/releases/download/v0.1.0/dev-flow-darwin-amd64.tar.gz"
  version "0.1.0"
  sha256 "e2f5132cadf1a2ae2f20b89ec648c5026807af33a28ecd5457f771381b220b41"
  deprecate! date: "2023-12-01", because: :repo_archived
  # This repo is archived. There is only one release, so no need to update to automatic upgrades.
  # This formula can be removed after the deprecation period.

  def install
    bin.install "dev-flow"
  end

  test do
    system "#{bin}/dev-flow", "-h"
  end
end
