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

  pip.drvs.torch.env.appendRunpaths = [ "/run/opengl-driver/lib" ];
  pip.drvs.nvidia-cublas-cu11.env.appendRunpaths = [ "/run/opengl-driver/lib" ];
  pip.drvs.nvidia-curand-cu11.env.appendRunpaths = [ "/run/opengl-driver/lib" ];
}
