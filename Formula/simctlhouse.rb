class Simctlhouse < Formula
  desc "Lease iOS simulators to parallel coding agents"
  homepage "https://github.com/juraj-blahunka/simctlhouse"
  url "https://github.com/juraj-blahunka/simctlhouse/releases/download/v0.2.0/simctlhouse-0.2.0-macos.tar.gz"
  sha256 "478bd8a1729828662fc03796a1628c1fad46c21d83c61b4c09c217a3fd02b876"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "bin/simctlhouse"
    pkgshare.install "share/simctlhouse/skills"
  end

  def caveats
    <<~EOS
      To make the simctlhouse skill available to your coding agents, run once:
        simctlhouse skill install
      Upgrades update the skill automatically.
      Before uninstalling, remove the pool's simulators, the daemon and the skill links:
        simctlhouse uninstall
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/simctlhouse --version").strip
    assert_path_exists pkgshare/"skills/simctlhouse/SKILL.md"
  end
end
