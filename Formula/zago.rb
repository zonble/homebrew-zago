class Zago < Formula
  desc "Terminal text editor and plain-text diagramming tool"
  homepage "https://github.com/zonble/zago"
  url "https://github.com/zonble/zago/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "35cb7b3a2c1938d0f797b00ddcf195a0e8b1a46758bec50078b0e7bebb28cce2"
  license "MIT"
  head "https://github.com/zonble/zago.git", branch: "main"

  on_macos do
    depends_on xcode: ["16.0", :build]
  end

  on_linux do
    depends_on "swift" => :build
  end 

  def install
    system "swift", "build",
      "--configuration", "release",
      "-Xswiftc", "-Osize",
      "--disable-sandbox",
      "--product", "zago"

    bin.install ".build/release/zago"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zago --version")
  end
end
