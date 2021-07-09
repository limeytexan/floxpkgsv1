{ stdenv, fetchurl, lib, xorg }:

stdenv.mkDerivation rec {
  pname    = "xmahjongg";
  version = "3.7";

  src = fetchurl {
    url = "https://www.lcdf.org/${pname}/${pname}-${version}.tar.gz";
    sha256 = "1kzz8y34q7wibcrmfb3p9rrz88qriz4slxpf1yrrfny23il66g94";
  };

  buildInputs = [ xorg.libX11 ];

  meta = with lib; {
    description = "Computer Solitaire Mah Jongg";
    license = licenses.mit;
    maintainers = with maintainers; [ limeytexan ];
    homepage = "https://www.lcdf.org/xmahjongg/";
  };
}
