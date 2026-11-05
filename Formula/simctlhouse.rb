class Simctlhouse < Formula
  desc "Lease iOS simulators to parallel coding agents"
  homepage "https://github.com/juraj-blahunka/simctlhouse"
  url "https://github.com/juraj-blahunka/simctlhouse/releases/download/v0.2.1/simctlhouse-0.2.1-macos.tar.gz"
  sha256 "9e97c2affef6e5695438e4f3fff57b4cc33accea85893f09efdd3ce981e6dfd5"
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
