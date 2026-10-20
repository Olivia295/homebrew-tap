class Drivingfalcon < Formula
  include Language::Python::Shebang

  desc "Zen terminal flight through a quiet galaxy (non-commercial fan project)"
  homepage "https://github.com/Olivia295/drivingfalcon"
  url "https://github.com/Olivia295/drivingfalcon/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1bd2d8c6cdbbc3aa1b9a2ba11ee2465d0843490d3ecbcbc4ff492d9f0c94651a"
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
