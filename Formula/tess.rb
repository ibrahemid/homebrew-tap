class Tess < Formula
  desc "CLI-first TOTP/2FA authenticator for macOS"
  homepage "https://tessera.ibrahemid.com/"
  version "1.0.2"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_darwin_arm64.tar.gz"
      sha256 "f0b41aa4a75baf57dd6f55e9191e3dcac4761653f4fa2ca0ced85001810be18d"
    end
    on_intel do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_darwin_amd64.tar.gz"
      sha256 "16c16f0adb8bd967a4597b0d86cc7b6d2cafa2995c1539b64e757a69fc34a491"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_linux_arm64.tar.gz"
      sha256 "1988dcf8dcca0eafd3ae8d9b16dd978db799ff06464a841a46f2386df2f115fe"
    end
    on_intel do
      url "https://github.com/ibrahemid/tessera/releases/download/v#{version}/tess_#{version}_linux_amd64.tar.gz"
      sha256 "3758e770c7da4547fb4e31e54fd97e5c9761468d4a356fe41ee3170ac52f838f"
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
