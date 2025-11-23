# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Maxwell < Formula
  desc "Multi-Skill Specialist System - Framework expertise coordination and knowledge access"
  homepage "https://github.com/Smith-Tools/Maxwell"
  url "https://github.com/Smith-Tools/Maxwell/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]
  depends_on "swift"
  depends_on "sqlite"

  def install
    # Build maxwell CLI binary from Swift
    cd "database" do
      system "swift", "build", "--disable-sandbox", "-c", "release"
      bin.install ".build/release/Maxwell" => "maxwell"
    end

    # Install database
    mkdir_p "#{var}/maxwell"
    cp "database/maxwell.db", "#{var}/maxwell/maxwell.db"

    # Create symlink for database in standard location
    mkdir_p "#{ENV["HOME"]}/.claude/resources/databases"
    ln_sf "#{var}/maxwell/maxwell.db", "#{ENV["HOME"]}/.claude/resources/databases/maxwell.db"

    # Documentation
    doc.install "README.md"
    doc.install "START-HERE.md"
    doc.install "KNOWLEDGE-MAINTENANCE.md"
    doc.install "ARCHITECTURE-DECISION.md"
  end

  def caveats
    <<~EOS
      Maxwell has been installed successfully!

      📚 Quick Start:
        1. Test the binary: maxwell search "TCA"
        2. Check database: maxwell domain SharePlay
        3. See documentation: open #{doc}

      🗄️  Database Location:
        #{ENV["HOME"]}/.claude/resources/databases/maxwell.db

      🚀 Using Maxwell with Claude Code:
        - Skills auto-trigger on framework keywords
        - Use: @maxwell for complex multi-domain questions
        - Search: maxwell search "query" [--domain] [--limit]

      📖 Documentation:
        #{doc}/README.md          - Overview and architecture
        #{doc}/START-HERE.md      - Getting started guide
        #{doc}/KNOWLEDGE-MAINTENANCE.md - How to extend Maxwell
        #{doc}/ARCHITECTURE-DECISION.md - Design decisions

      🔗 Repository:
        https://github.com/Smith-Tools/Maxwell
    EOS
  end

  test do
    output = shell_output("#{bin}/maxwell --help")
    assert_match "maxwell", output
    assert_match "search", output
    assert_match "domain", output
  end
end
