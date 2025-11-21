# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithCli < Formula
  desc "Unified CLI interface for Smith Tools ecosystem - Single entry point for all Smith utilities"
  homepage "https://github.com/Smith-Tools/smith-cli"
  url "https://github.com/Smith-Tools/smith-cli/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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