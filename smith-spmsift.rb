# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SmithSpmsift < Formula
  desc "Swift Package Manager analysis tool - Package dependency analysis and optimization"
  homepage "https://github.com/Smith-Tools/smith-spmsift"
  url "https://github.com/Smith-Tools/smith-spmsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "sha256_placeholder"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  resource "smith-core" do
    url "https://github.com/Smith-Tools/smith-core/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "sha256_placeholder"
  end

  def install
    # Build smith-core dependency first
    resource("smith-core").stage do
      system "swift", "build", "--disable-sandbox", "-c", "release"
      lib.install ".build/release/libSmithCore.dylib" if File.exist?(".build/release/libSmithCore.dylib")
    end

    # Build smith-spmsift
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product SmithSPMSift"
    bin.install ".build/release/SmithSPMSift" => "smith-spmsift"
  end

  test do
    output = shell_output("#{bin}/smith-spmsift --help")
    assert_match "smith-spmsift", output
    assert_match "Smith", output
  end
end