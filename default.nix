{ dream2nixSource ? builtins.fetchTarball {
    url = "https://github.com/nix-community/dream2nix/tarball/0d3146539a0c57cbe9c49b8d3b1852d04394cec6";
  }
, nixpkgsSource ? builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/tarball/00416be09afb1de1c4f91ff7f11da1a68b711899";
  }
}:
let
  dream2nix = import dream2nixSource;
  nixpkgs = import dream2nix.inputs.nixpkgs { };
  # nixpkgs = import nixpkgsSource { };
  # current pyproject project
  settings = {
    paths.projectRoot = ./.;
    paths.projectRootFile = "pyproject.toml";
    paths.package = ".";
  };
  package = dream2nix.lib.evalModules {
    modules = [ settings ./package.nix ];
    packageSets.nixpkgs = nixpkgs;
  };
in
package

# TODO
# nix run -f default.nix lock
