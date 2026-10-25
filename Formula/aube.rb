class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.sh"
  url "https://github.com/aubepkg/aube/archive/refs/tags/v2.8.3.tar.gz"
  sha256 "fe8a03efa3c72a9d96d49cbe6bc17b7e858074277f541c93562af55d1af5ed75"
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
