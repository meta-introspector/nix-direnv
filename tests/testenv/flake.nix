{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
  inputs.flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";

  # deadnix: skip
  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShell = import ./shell.nix { pkgs = nixpkgs.legacyPackages.${system}; };
    });
}
