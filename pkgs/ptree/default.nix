{ flox, psmisc }:

flox.mkDerivation {
  project = "ptree";
  makeFlags = [ "PREFIX=$(out)" ];
  buildInputs = [ psmisc ];
}
