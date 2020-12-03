{ flox }:

flox.buildRustPackage rec {
  project = "hello-rust";
  cargoSha256  = "0qh46qyzklh4zj88brvrzqfzgdbkfpcszfb9zv7zq1rhnynkibs1";
}
