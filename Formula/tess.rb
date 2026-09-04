class Tess < Formula
  desc "CLI-first TOTP/2FA authenticator for macOS"
  homepage "https://tessera.ibrahemid.com/"
  version "1.1.0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_darwin_arm64.tar.gz"
      sha256 "75df08b715dc31a326d25061a64171423bce245cf6f5943753577470a0275568"
    end
    on_intel do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_darwin_amd64.tar.gz"
      sha256 "84cd31b461cc868cdb219b3da47c7885fff70f9a6b501a69258d1b5aea5399f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_linux_arm64.tar.gz"
      sha256 "baf83665ca822a8f75882cc9e08178593d8ca65bbf8c6deb3d4158fbb4264346"
    end
    on_intel do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_linux_amd64.tar.gz"
      sha256 "94144967eddcc5635ce2f1087ea51644fc7195b8482a7c28c12622804b933387"
    end
  end

  def install
    bin.install "tess"
    generate_completions_from_executable(bin/"tess", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tess --version")
    assert_match "#compdef tess", shell_output("#{bin}/tess completion zsh")
  end
end
