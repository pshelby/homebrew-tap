# Some comments are needed for the Makefile to substitute lines, do not remove!
class MuCli < Formula
  desc "A full-stack DevOps on AWS tool"
  homepage "https://getmu.io"
  if OS.mac?
    url "https://github.com/stelligent/mu/releases/download/v1.0.4/mu-darwin-amd64" # The MacOS master url
    sha256 "558b41f106734d3c6ac505fb9ee2c3c0ad3cc34602d21f6b2848efa643d531a5" # The MacOS master sha256sum
  elsif OS.linux?
    url "https://github.com/stelligent/mu/releases/download/v1.0.4/mu-linux-amd64" # The Linux master url
    sha256 "01cfe1cfafbf13e873f423492eb17140f7cfc1a4d23d7e89c275caf8a7817626" # The Linux master sha256sum
  end
  version "1.0.4" # The master version
  devel do
    if OS.mac?
    url "https://github.com/stelligent/mu/releases/download/v1.1.1-develop/mu-darwin-amd64" # The MacOS develop url
    sha256 "ad8b7fe2a49f69dcfdbb7c74bd72b20c5a143a32aeda28fcbf251bf5faf99bed" # The MacOS develop sha256sum
    elsif OS.linux?
    url "https://github.com/stelligent/mu/releases/download/v1.1.1-develop/mu-linux-amd64" # The Linux develop url
    sha256 "e6e5c27f0e16e51b4567fe0e0d48e5dde79b49860dfe0ba44387e3837d83712d" # The Linux develop sha256sum
    end
    version "1.1.1-develop" # The develop version
  end

  bottle :unneeded

  def install
    if OS.mac?
      bin.install "mu-darwin-amd64"
      mv "#{bin}/mu-darwin-amd64", "#{bin}/mu"
    elsif OS.linux?
      bin.install "mu-linux-amd64"
      mv "#{bin}/mu-linux-amd64", "#{bin}/mu"
    end
  end

  test do
    system "#{bin}/mu" ,"--version"
  end
end
