class Simctlhouse < Formula
  desc "Lease iOS simulators to parallel coding agents"
  homepage "https://github.com/juraj-blahunka/simctlhouse"
  url "https://github.com/juraj-blahunka/simctlhouse/releases/download/v0.1.1/simctlhouse-0.1.1-macos.tar.gz"
  sha256 "5be110842cd7915bbe413dfbaf3cd5aeae5a1d29b859a7e204017df66125419f"
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
      Before uninstalling, run:
        simctlhouse skill uninstall
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/simctlhouse --version").strip
    assert_path_exists pkgshare/"skills/simctlhouse/SKILL.md"
  end
end
