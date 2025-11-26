# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class SmithSpmsift < Formula
  desc "Swift Package Manager analysis for Smith Tools"
  homepage "https://github.com/Smith-Tools/smith-spmsift"
  url "https://github.com/Smith-Tools/smith-spmsift/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bdbc27f65341619a57c718821b011d634b1c2b32321835972f3faafdb546bf6b"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product spmsift"
    bin.install ".build/arm64-apple-macosx/release/spmsift"
  end

  test do
    output = shell_output("#{bin}/spmsift --help")
    assert_match "spmsift", output
  end
end
