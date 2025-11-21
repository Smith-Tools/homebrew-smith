# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithValidation < Formula
  desc "TCA architectural validation engine (Rules 1.1-1.5) for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-validation"
  url "https://github.com/Smith-Tools/smith-validation/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b0927815209a85beb22fdc08e4022e6af023111817f6b66a520623ccf3928df4"
  license "MIT"
  head "https://github.com/Smith-Tools/smith-validation.git", branch: "main"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "smith-validation"
    bin.install ".build/release/smith-validation"
  end

  test do
    # Basic help invocation
    output = shell_output("#{bin}/smith-validation --help")
    assert_match "smith-validation", output
  end
end
