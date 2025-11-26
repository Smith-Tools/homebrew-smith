class SmithTcaTrace < Formula
  desc "TCA performance profiling and multi-instrument enrichment analysis"
  homepage "https://github.com/Smith-Tools/smith-tca-trace"
  url "https://github.com/Smith-Tools/smith-tca-trace/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/arm64-apple-macosx/release/smith-tca-trace"
  end

  test do
    output = shell_output("#{bin}/smith-tca-trace --version")
    assert_match "smith-tca-trace", output
  end
end