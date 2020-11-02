{ stdenv, fetchurl, libX11 }:

stdenv.mkDerivation rec {
  pname    = "xmahjongg";
  version = "3.7";

  src = fetchurl {
    url = "https://www.lcdf.org/${pname}/${pname}-${version}.tar.gz";
    sha256 = "1kzz8y34q7wibcrmfb3p9rrz88qriz4slxpf1yrrfny23il66g94";
  };

  buildInputs = [ libX11 ];

  meta = with stdenv.lib; {
    description = "Computer Solitaire Mah Jongg";
    license = licenses.mit;
    maintainers = with maintainers; [ limeytexan ];
    homepage = "https://www.lcdf.org/xmahjongg/";
  };
}
