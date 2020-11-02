{ channels, psmisc }:

channels.flox.mkDerivation {
  project = "ptree";
  buildInputs = [ psmisc ];
}
