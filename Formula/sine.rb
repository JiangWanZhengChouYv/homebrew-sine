class Sine < Formula
  desc "macOS Wine engine optimized for gaming"
  homepage "https://github.com/JiangWanZhengChouYv/sine"
  url "https://github.com/JiangWanZhengChouYv/sine/releases/download/v11.12/sine-stable-macos.tar.gz"
  sha256 "db447ab5cb64c4474ac0a59e74131f8e2b21cef98ffbfc8759d377a9add82b8d"
  license "LGPL-2.1"

  depends_on :macos => :sonoma

  def install
    cd "sine-stable" do
      libexec.install Dir["*"]
    end
    bin.install_symlink libexec/"bin/sine"
    bin.install_symlink libexec/"bin/wineserver"
    bin.install_symlink libexec/"bin/wineboot"
    bin.install_symlink libexec/"bin/winecfg"
    bin.install_symlink libexec/"bin/winedbg"
    bin.install_symlink libexec/"bin/notepad"
    bin.install_symlink libexec/"bin/regedit"
    bin.install_symlink libexec/"bin/winepath"
    bin.install_symlink libexec/"bin/wineconsole"
    bin.install_symlink libexec/"bin/winefile"
    bin.install_symlink libexec/"bin/msiexec"
    bin.install_symlink libexec/"bin/regsvr32"
    bin.install_symlink libexec/"bin/winemine"
  end

  def caveats
    <<~EOS
      Sine is a renamed build of Wine 11.12.
      Run `sine --version` to verify the installation.
    EOS
  end

  test do
    system "#{bin}/sine", "--version"
  end
end
