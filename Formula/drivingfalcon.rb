class Drivingfalcon < Formula
  include Language::Python::Shebang

  desc "Zen terminal flight through a quiet galaxy (non-commercial fan project)"
  homepage "https://github.com/Olivia295/drivingfalcon"
  url "https://github.com/Olivia295/drivingfalcon/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ac6a6f0d50abb963a2283c8416c6616a852be81f390171f62518b42510b15750"
  license "MIT"

  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "drivingfalcon.py"
    bin.install "drivingfalcon.py" => "drivingfalcon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drivingfalcon --version")
    assert_match "needs a real terminal", pipe_output(bin/"drivingfalcon", "", 0)
  end
end
