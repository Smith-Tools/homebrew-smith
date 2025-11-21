# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithCli < Formula
  desc "Unified CLI interface for Smith Tools ecosystem - Single entry point for all Smith utilities"
  homepage "https://github.com/Smith-Tools/smith-cli"
  url "https://github.com/Smith-Tools/smith-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "3a777fbd63a134f826977dbfdb28a76ec2279b6094d14439873cbbb6af0785b6"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    # Build smith-cli
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/SmithCLI" => "smith-cli"
  end

  test do
    output = shell_output("#{bin}/smith-cli --help")
    assert_match "smith-cli", output
    assert_match "Smith Tools", output
  end
end
