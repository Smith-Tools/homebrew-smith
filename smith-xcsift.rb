# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SmithXcsift < Formula
  desc "Xcode build analysis tool - Enhanced xcodebuild output parsing and analysis"
  homepage "https://github.com/Smith-Tools/smith-xcsift"
  url "https://github.com/Smith-Tools/smith-xcsift/archive/refs/tags/v1.0.0.tar.gz"
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

    # Build smith-xcsift
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product SmithXCSift"
    bin.install ".build/release/SmithXCSift" => "smith-xcsift"
  end

  test do
    output = shell_output("#{bin}/smith-xcsift --help")
    assert_match "smith-xcsift", output
    assert_match "Smith", output
  end
end