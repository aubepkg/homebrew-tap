class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.sh"
  url "https://github.com/aubepkg/aube/archive/refs/tags/v2.8.1.tar.gz"
  sha256 "157d04293f4a84387ac0aa36f4b080d1a47f4e69dae2ed13c058be076a4c467f"
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
