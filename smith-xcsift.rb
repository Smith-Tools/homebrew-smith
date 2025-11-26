# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithXcsift < Formula
  desc "Xcode build analysis for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-xcsift"
  url "https://github.com/Smith-Tools/smith-xcsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c0e2959eea566a92819169fe070b6ed5421f39b0d00b63c4626af0ef8ab166e6"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product smith-xcsift"
    bin.install ".build/arm64-apple-macosx/release/smith-xcsift"
  end

  test do
    output = shell_output("#{bin}/smith-xcsift --help")
    assert_match "smith-xcsift", output
  end
end
