# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithSpmsift < Formula
  desc "Swift Package Manager analysis for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-spmsift"
  url "https://github.com/Smith-Tools/smith-spmsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "sha256_placeholder"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product SmithSPMSift"
    bin.install ".build/release/SmithSPMSift" => "smith-spmsift"
  end

  test do
    output = shell_output("#{bin}/smith-spmsift --help")
    assert_match "smith-spmsift", output
  end
end
