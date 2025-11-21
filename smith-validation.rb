class SmithValidation < Formula
  desc "TCA architectural validation engine (Rules 1.1-1.5) for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-validation"
  url "https://github.com/Smith-Tools/smith-validation/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "13901cda30c33c32744e2b49ddf59dc3ab57f63a9f7b95ef3128aa5eac165d61"
  license "MIT"
  head "https://github.com/Smith-Tools/smith-validation.git", branch: "main"

  bottle do
    root_url "https://github.com/Smith-Tools/homebrew-smith/releases/download/smith-validation-1.0.9"
    rebuild 0
    sha256 cellar: :any, arm64_tahoe: ""
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
