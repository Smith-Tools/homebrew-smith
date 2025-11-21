# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithValidation < Formula
  desc "TCA architectural validation engine (Rules 1.1-1.5) for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-validation"
  head "https://github.com/Smith-Tools/smith-validation.git", branch: "main"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]
  depends_on "swift"

  def install
    # Build with local SmithValidationCore dependency
    # Note: This requires SmithValidationCore to be available at ../SmithValidationCore
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "smith-validation"
    bin.install ".build/release/smith-validation"
  end

  test do
    # Basic help invocation
    output = shell_output("#{bin}/smith-validation --help")
    assert_match "smith-validation", output
  end
end
