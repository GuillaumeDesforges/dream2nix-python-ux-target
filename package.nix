{ dream2nix
, config
, lib
, ...
}: {
  imports = [
    # TODO: pyproject module
    dream2nix.modules.dream2nix.WIP-python-pyproject
  ];

  mkDerivation.src = ./.;

  pip.drvs.triton.env.pythonRemoveDeps = [
    "torch"
  ];
  pip.drvs.triton.mkDerivation.nativeBuildInputs = [
    config.deps.python.pkgs.pythonRelaxDepsHook
  ];
  pip.drvs.torch.env.autoPatchelfIgnoreMissingDeps = ["libcuda.so.1"];
  pip.drvs.torch.mkDerivation.dontStrip = true;
}
