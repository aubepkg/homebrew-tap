class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.sh"
  url "https://github.com/aubepkg/aube/archive/refs/tags/v2.8.0.tar.gz"
  sha256 "21e848a45b3ed2087533e0fd86cf6f94a2ae6cae027526af57a4525f2d3ce497"
  license "MIT"

  depends_on "rust" => :build
  depends_on "usage" => :build
  depends_on "cmake" => :build
  depends_on "pkgconf" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/aube")
    generate_completions_from_executable(bin/"aube", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aube --version")
    assert_match "Usage:", shell_output("#{bin}/aube --help")
  end
end
