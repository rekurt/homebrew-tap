class GitBarber < Formula
  desc "Trim stale merged git branches (classic + squash merges), with a TUI"
  homepage "https://github.com/rekurt/git-barber"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rekurt/git-barber/releases/download/v0.3.0/git-barber-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "132739eec2500ddf88fabbfe741a3f739c03faea091b9158d55e37a7b21a8d33"
    end
    on_intel do
      url "https://github.com/rekurt/git-barber/releases/download/v0.3.0/git-barber-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "e664a3c68e1e08bb01d1f8c1d9d6d8d368d1deab9074920394fdb118020c542c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rekurt/git-barber/releases/download/v0.3.0/git-barber-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "28d1d7477239aa52a6826681e21b38c8c3c506fc3d740ab55840161d4bbcdbd7"
    end
    on_intel do
      url "https://github.com/rekurt/git-barber/releases/download/v0.3.0/git-barber-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "16820cee078da356c39a7ceb1bd22f81504ed2823b60573352ffc156b2540ab6"
    end
  end

  def install
    bin.install "git-barber"
    bash_completion.install "completions/git-barber.bash" => "git-barber"
    zsh_completion.install "completions/git-barber.zsh" => "_git-barber"
    fish_completion.install "completions/git-barber.fish"
    man1.install "man/git-barber.1"
  end

  test do
    assert_match "git-barber", shell_output("#{bin}/git-barber --version")
  end
end
