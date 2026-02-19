class Portal < Formula
  include Language::Python::Virtualenv

  desc "Modern CLI tool for managing Git worktrees with color coding and editor integration"
  homepage "https://github.com/aureliensibiril/portal"
  url "https://files.pythonhosted.org/packages/ab/f8/5086e2e4d700cc9f6881a1dbf327671607d5b0ef319b9a5475e47bd93a90/git_portal-0.1.0.tar.gz"
  sha256 "f8fb90f920901599f058e2fb06f26865819699e9e615022c49994aa15693f32c"
  license "MIT"

  depends_on "python@3.12"
  depends_on "git"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-cache-dir", "git-portal[cli]==0.1.0"
    (bin/"portal").write_env_script libexec/"bin/portal", PATH: "#{libexec}/bin:${PATH}"
  end

  test do
    system bin/"portal", "--version"
  end
end
