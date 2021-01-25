{ flox, help2man }:

flox.mkDerivation rec {
  project = "tracelinks";
  nativeBuildInputs = [ help2man ];
  makeFlags = [ "PREFIX=$(out)" ];
}
