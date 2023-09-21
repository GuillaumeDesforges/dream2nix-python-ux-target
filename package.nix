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

  deps = { nixpkgs, ... }: {
    inherit (nixpkgs.cudaPackages) autoAddOpenGLRunpathHook;
  };

  pip.drvs.torch.mkDerivation.nativeBuildInputs = [
    config.deps.autoAddOpenGLRunpathHook
  ];

  pip.drvs.nvidia-curand-cu11.env.cudaNeededPhase = ''
    patchelf --add-needed libcuda.so.1 $out/${config.deps.python.sitePackages}/nvidia/*/lib/*
  '';
  pip.drvs.nvidia-curand-cu11.mkDerivation.postPhases = [ "cudaNeededPhase" ];
  pip.drvs.nvidia-curand-cu11.mkDerivation.nativeBuildInputs = [
    config.deps.autoAddOpenGLRunpathHook
  ];
}
