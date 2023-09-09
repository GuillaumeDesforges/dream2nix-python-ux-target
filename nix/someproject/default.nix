{ dream2nix
, config
, lib
, ...
}:

let
  pyproject = builtins.fromTOML (builtins.readFile ../../pyproject.toml);
in
{
  imports = [
    # TODO: pyproject module
    dream2nix.modules.dream2nix.pip
  ];

  mkDerivation.src = ../..;
  mkDerivation.buildInputs = [ config.deps.python.pkgs.setuptools ];
  buildPythonPackage.format = "pyproject";

  name = pyproject.project.name;
  version = pyproject.project.version;

  # TODO remove
  pip.pypiSnapshotDate = "2050-01-01";
  pip.requirementsList = [ "." ];

  pip.drvs.triton.env.pythonRemoveDeps = [
    "torch"
  ];
  pip.drvs.triton.mkDerivation.nativeBuildInputs = [
    config.deps.python.pkgs.pythonRelaxDepsHook
  ];
}
