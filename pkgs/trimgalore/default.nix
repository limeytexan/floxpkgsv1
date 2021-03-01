{ lib, stdenv, fetchFromGitHub, cutadapt, makeWrapper, perl }:

stdenv.mkDerivation rec {
  pname = "trimgalore";
  version = "0.6.6";

  src = fetchFromGitHub {
    owner = "FelixKrueger";
    repo = "TrimGalore";
    rev = version;
    sha256 = "0yrwg6325j4sb9vnplvl3jplzab0qdhp92wl480qjinpfq88j4rs";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ cutadapt perl ];

  installPhase = ''
    mkdir -p $out/bin
    install trim_galore $out/bin
  '';

  preFixup = ''
    wrapProgram $out/bin/trim_galore \
      --prefix PATH : "${cutadapt}/bin"
  '';

  meta = with lib; {
    homepage = "https://www.bioinformatics.babraham.ac.uk/projects/trim_galore";
    description =
      "Wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data";
    license = licenses.gpl3;
    maintainers = with maintainers; [ limeytexan ];
  };
}
