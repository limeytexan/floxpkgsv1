{ flox, psmisc }:

flox.builders.mkDerivation {
  project = "ptree";
  buildInputs = [ psmisc ];
}
