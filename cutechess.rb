class Cutechess < Formula
  desc "Interface and a library for playing chess"
  homepage "https://cutechess.com/"
  url "https://github.com/cutechess/cutechess/archive/1.2.0.tar.gz"
  sha256 "d0e1b2c9c2eaccf0f8c4d5e5fe7e169358f5de9606bd27de3f9d1ce4ddcdb0bc"
  license "GPL-3.0-or-later"

  depends_on xcode: :build
  depends_on "qt"

  def install
    system "qmake"
    system "make"
    bin.install "projects/cli/cutechess-cli" => "cutechess-cli"
    prefix.install "projects/gui/Cute Chess.app"
    bin.write_exec_script "#{prefix}/Cute\ Chess.app/Contents/MacOS/Cute\ Chess"
  end

  test do
    assert_equal "cutechess-cli", shell_output("#{bin}/cutechess-cli -v").chomp
  end
end

