{ flox, stdenv }:

flox.buildRustPackage rec {
  project = "flox-rust-testing";

  cargoSha256 = if stdenv.isAarch64 then
    "0gqvknk58d9134j7586lzrmdz050awpwy7r1a3l02z6dm7fn1k63"
  else
    "1i4wq8xavrg652njmc87g0dzknjmdvhn93jsf9xsi4x34v8cvf38";

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
