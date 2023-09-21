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

  deps = {nixpkgs, ...}: {
    inherit (nixpkgs.cudaPackages) autoAddOpenGLRunpathHook;
  };
  pip.drvs.torch.mkDerivation.nativeBuildInputs = [
    config.deps.autoAddOpenGLRunpathHook
  ];
}
