{ flox }:

flox.buildRustPackage rec {
  project = "flox-rust-testing";

  cargoSha256 = "012nlq0hriixajbpdir5qhs2yi71ar6r5w8zpsriv2fhqf3n7vcs";

  # Programs and libraries used only at build-time.
  nativeBuildInputs = [ ];

  # Programs and libraries used by the new derivation at run-time.
  buildInputs = [ ];

  # The propagated equivalent of buildInputs. Note that python modules
  # must always be listed in this section on account of the way that the
  # python module support works in Nix.
  propagatedBuildInputs = [ ];

  # See https://nixos.org/manual/nixpkgs/stable/#ssec-stdenv-dependencies for
  # more information on the various ways of specifying dependencies with Nix.
}
