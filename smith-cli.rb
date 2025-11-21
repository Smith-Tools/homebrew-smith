# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithCli < Formula
  desc "Unified CLI interface for Smith Tools ecosystem - Single entry point for all Smith utilities"
  homepage "https://github.com/Smith-Tools/smith-cli"
  url "https://github.com/Smith-Tools/smith-cli/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "96ff8be2701ab520eb7b17f3c5904f4e5e48103b5393666983a96ad8ff0b790e"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    # Build smith-cli
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/smith-cli" => "smith-cli"
  end

  test do
    output = shell_output("#{bin}/smith-cli --help")
    assert_match "smith-cli", output
    assert_match "Smith Tools", output
  end
end