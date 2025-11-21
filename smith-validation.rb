class SmithValidation < Formula
  desc "TCA architectural validation engine (Rules 1.1-1.5) for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-validation"
  url "https://github.com/Smith-Tools/smith-validation/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "4176fc0c1585abfad5902d9ef1784d32e9f652ab40efd047f38d928a39dcf10a"
  license "MIT"
  head "https://github.com/Smith-Tools/smith-validation.git", branch: "main"

  bottle do
    root_url "https://github.com/Smith-Tools/homebrew-smith/releases/download/smith-validation-1.0.8"
    rebuild 0
    sha256 cellar: :any, arm64_tahoe: "22ea27fa3333b4211877db8746c5fddb8e79af91613602c7506dfe372f55097b"
  end

  depends_on xcode: ["15.0", :build]
  depends_on :macos
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
