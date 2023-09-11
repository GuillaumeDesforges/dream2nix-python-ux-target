{
  dream2nixSource ?
    builtins.fetchTarball {
      url = "https://github.com/nix-community/dream2nix/tarball/main";
      # sha256 = "";
    },
}: let
  dream2nix = import dream2nixSource;
  nixpkgs = import dream2nix.inputs.nixpkgs {};
  # current pyproject project
  packages = dream2nix.lib.importPackages {
    projectRoot = ./.;
    projectRootFile = "pyproject.toml";
    packagesDir = "./nix";
    packageSets.nixpkgs = nixpkgs;
  };
in
  packages.someproject

  # TODO
  # dream2nix.lib.importPackage {
  #   projectRoot = ./.;
  #   projectRootFile = "pyproject.toml";
  #   packageFile = "./package.nix";
  #   packageSets.nixpkgs = nixpkgs;
  # };

  # TODO
  # nix run -f default.nix lock
