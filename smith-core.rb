# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SmithCore < Formula
  desc "Core framework for Smith Tools ecosystem providing unified data models and shared functionality"
  homepage "https://github.com/Smith-Tools/smith-core"
  url "https://github.com/Smith-Tools/smith-core/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "sha256_placeholder"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/smith-core" if File.exist?(".build/release/smith-core")

    # Install library files
    lib.install Dir["Sources/SmithCore/*.swift"]

    # Install modulemap
    (lib/"smith-core.modulemap").write <<~EOS
      module SmithCore {
        header "module.modulemap"
        export *
      }
    EOS
  end

  test do
    # Test that the module can be imported
    (testpath/"test.swift").write <<~EOS
      import SmithCore
      print("Smith Core module loaded successfully")
    EOS

    system "#{Formula["swift"].bin}/swift", "build"
  end
end