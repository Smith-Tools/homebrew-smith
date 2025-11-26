class SmithValidation < Formula
  desc "AI-optimized Progressive Intelligence architectural analysis for Swift projects"
  homepage "https://github.com/Smith-Tools/smith-validation"
  url "https://github.com/Smith-Tools/smith-validation/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "2d34411f2ddfc7e0b54f9b37bb19fd8c4b63f1c17b10afa7051f4548b05d4bba"
  license "MIT"
  head "https://github.com/Smith-Tools/smith-validation.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on :macos
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "smith-validation"
    bin.install ".build/release/smith-validation"
  end

  test do
    # Test Progressive Intelligence analysis
    test_project = testpath/"TestProject"
    test_project.mkdir
    (test_project/"Test.swift").write("import SwiftUI\n\nstruct TestView: View {\n    var body: some View { Text(\"Hello\") }\n}")

    output = shell_output("#{bin}/smith-validation #{test_project} --level=critical")
    assert_match "smith-validation-progressive-intelligence", output
    assert_match "analysisLevel", output
  end
end
