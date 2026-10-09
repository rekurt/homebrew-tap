require "json"

class Prt < Formula
  desc "Inspect network ports, processes and SSH tunnel health in the terminal"
  homepage "https://rekurt.github.io/prt/"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rekurt/prt/releases/download/v0.6.0/prt-aarch64-apple-darwin.tar.gz"
      sha256 "666426d62b5e8e3a8c1205748388d4e7a055cc4279c1fd76e7154606d581cc1a"
    end
    on_intel do
      url "https://github.com/rekurt/prt/releases/download/v0.6.0/prt-x86_64-apple-darwin.tar.gz"
      sha256 "8e811f2361a4bd32649b3dd054dc4188bf010407646ffdc4f01438601638d7aa"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/rekurt/prt/releases/download/v0.6.0/prt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "066c70415ffad0552a9713948134c0e7b14399270aa3e6e93c7a190f8c5f9ac8"
    end
  end

  def install
    bin.install "prt"
  end

  test do
    assert_equal "prt #{version}", shell_output("#{bin}/prt --version").strip
    assert_match "--export", shell_output("#{bin}/prt --help")
    assert_kind_of Array, JSON.parse(shell_output("#{bin}/prt --export json"))
  end
end
