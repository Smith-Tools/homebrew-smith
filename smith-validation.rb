class SmithValidation < Formula
  desc "TCA architectural validation engine (Rules 1.1-1.5) for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-validation"
  url "https://github.com/Smith-Tools/smith-validation/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "4176fc0c1585abfad5902d9ef1784d32e9f652ab40efd047f38d928a39dcf10a"
  license "MIT"
  head "https://github.com/Smith-Tools/smith-validation.git", branch: "main"

  bottle do
    root_url "https://github.com/Smith-Tools/homebrew-smith/releases/download/smith-validation-1.0.8"
    rebuild 1
    sha256 cellar: :any, arm64_tahoe: "da33a92b93b7e859927aac983a1e0d5bf37c67e6351a1d5149a798a6ba8569e7"
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
