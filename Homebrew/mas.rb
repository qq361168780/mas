class Mas < Formula
  desc "Mac App Store command-line interface"
  homepage "https://github.com/mas-cli/mas"
  url "https://github.com/mas-cli/mas/archive/v1.4.1.tar.gz"
  sha256 "4fd91c13b46d403b52dbee3891adb3cd6571e07ad20cf58de0100c9f695e6c24"
  revision 1
  head "https://github.com/mas-cli/mas.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "2d03fa8338e5a75ab8c93e6318607654306d17df3e747586a903d014bb102032" => :high_sierra
    sha256 "9d50b4a359bbb100c341fff41a3690aa0c855b6651a1ac93ef4f6e974b9a7cd4" => :sierra
    sha256 "05f5b0166c716896da57f0db781ae3f818dd2fbe561099f288b847c777687970" => :el_capitan
  end

  depends_on :xcode => ["9.0", :build]

  def install
    xcodebuild "-project", "mas-cli.xcodeproj",
               "-scheme", "mas-cli Release",
               "-configuration", "Release",
               "SYMROOT=build"
    bin.install "build/mas"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/mas version").chomp
  end
end
