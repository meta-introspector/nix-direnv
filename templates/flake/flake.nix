{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
  inputs.systems.url = "github:meta-introspector/default?ref=feature/CRQ-016-nixify";
  inputs.flake-utils = {
    url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell { packages = [ pkgs.bashInteractive ]; };
      }
    );
}
