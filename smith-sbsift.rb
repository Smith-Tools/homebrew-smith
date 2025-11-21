# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithSbsift < Formula
  desc "Swift build analysis for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-sbsift"
  url "https://github.com/Smith-Tools/smith-sbsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "sha256_placeholder"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product SmithSBSift"
    bin.install ".build/release/SmithSBSift" => "smith-sbsift"
  end

  test do
    output = shell_output("#{bin}/smith-sbsift --help")
    assert_match "smith-sbsift", output
  end
end
