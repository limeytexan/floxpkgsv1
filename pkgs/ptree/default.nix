{ flox, psmisc }:

flox.mkDerivation {
  project = "ptree";
  buildInputs = [ psmisc ];
}
