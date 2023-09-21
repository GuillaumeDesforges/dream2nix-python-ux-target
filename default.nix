{ dream2nixSource ? builtins.fetchTarball {
    url = "https://github.com/nix-community/dream2nix/tarball/main";
    # sha256 = "";
  }
,
}:
let
  dream2nix = import dream2nixSource;
  nixpkgs = import dream2nix.inputs.nixpkgs { };
  # current pyproject project
  settings = {
    paths.projectRoot = "${./.}";
    paths.projectRootFile = "${./pyproject.toml}";
    paths.package = "${./.}";
  };
  package = dream2nix.lib.evalModules {
    modules = [ settings ./package.nix ];
    packageSets.nixpkgs = nixpkgs;
  };
in
package

# TODO
# nix run -f default.nix lock
