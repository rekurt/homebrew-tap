class GitBarber < Formula
  desc "Trim stale merged git branches (classic + squash merges), with a TUI"
  homepage "https://github.com/rekurt/git-barber"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rekurt/git-barber/releases/download/v0.2.0/git-barber-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "5b85bd15f7e782089b0acd5c3cbe7793195ca0e9306a7c3a628df2cc077dbf7a"
    end
    on_intel do
      url "https://github.com/rekurt/git-barber/releases/download/v0.2.0/git-barber-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "73f2e22282e5c6a120d45ae77835fadd22a3df65937f392d17926cb1480110d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rekurt/git-barber/releases/download/v0.2.0/git-barber-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f04d62d96a5b39ee779591a0e436ba8c1b0cfb113b8792bc6a97cd7f10a81af"
    end
    on_intel do
      url "https://github.com/rekurt/git-barber/releases/download/v0.2.0/git-barber-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e0fd3c05f96737f6f5febd562e7acbd565ab0086b884f5c184fc28b6580f0832"
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
