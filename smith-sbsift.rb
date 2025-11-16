# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SmithSbsift < Formula
  desc "Swift build analysis tool - Parse and analyze Swift build output for development workflows"
  homepage "https://github.com/Smith-Tools/smith-sbsift"
  url "https://github.com/Smith-Tools/smith-sbsift/archive/refs/tags/v1.0.0.tar.gz"
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

    # Build smith-sbsift
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product SmithSBSift"
    bin.install ".build/release/SmithSBSift" => "smith-sbsift"
  end

  test do
    output = shell_output("#{bin}/smith-sbsift --help")
    assert_match "smith-sbsift", output
    assert_match "Smith", output
  end
end