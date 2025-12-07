class SmithParser < Formula
  desc "Unified build log parser for Swift, Xcode, and SPM"
  homepage "https://smith-tools.dev/"
  url "https://github.com/Smith-Tools/smith-parser/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on :xcode => ["14.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/smith-parser"
  end

  test do
    output = shell_output("#{bin}/smith-parser --help")
    assert_match "Usage: smith-parser", output
  end
end
