class Simctlhouse < Formula
  desc "Lease iOS simulators to parallel coding agents"
  homepage "https://github.com/juraj-blahunka/simctlhouse"
  url "https://github.com/juraj-blahunka/simctlhouse/releases/download/v0.3.0/simctlhouse-0.3.0-macos.tar.gz"
  sha256 "db025d5e7968e0b06d7c5ccc6c250ab1226f291376d69243f295bbfc7f30d20f"
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
