# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithValidation < Formula
  desc "TCA architectural validation engine (Rules 1.1-1.5) for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-validation"
  url "https://github.com/Smith-Tools/smith-validation/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a610a8c237f7aee2dcb4159b98c9cdb51269ae2f93980bc7cf52f3b75b790e39"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]
  depends_on "swift"

  resource "SmithValidationCore" do
    url "https://github.com/Smith-Tools/SmithValidationCore.git", branch: "main"
  end

  def install
    # Vendor SmithValidationCore and repoint the path dependency
    (buildpath/"Deps/SmithValidationCore").install resource("SmithValidationCore")
    inreplace "Package.swift",
              '../SmithValidationCore',
              'Deps/SmithValidationCore'

    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "smith-validation"
    bin.install ".build/release/smith-validation"
  end

  test do
    # Basic help invocation
    output = shell_output("#{bin}/smith-validation --help")
    assert_match "smith-validation", output
  end
end
