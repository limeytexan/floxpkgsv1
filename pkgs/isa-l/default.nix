{ lib, stdenv, fetchFromGitHub, autoPatchelfHook, autoreconfHook269, nasm, yasm
}:

let autoreconfHook = autoreconfHook269;

in stdenv.mkDerivation rec {
  pname = "isa-l";
  version = "2.30.0";

  src = fetchFromGitHub {
    owner = "intel";
    repo = "isa-l";
    rev = "v${version}";
    sha256 = "06ymkrf3hkkd94i59ahm79545rk709y8rd0v2l86w38z6is942q0";
  };

  postPatch = ''
    # If autoconf finds `as` in the PATH then it never falls back to
    # look for either of nasm or yasm, so we modify configure.ac to
    # always look for it by default. This is most certainly a bug.
    substituteInPlace configure.ac --replace \
      'if test x"$AS" = x""; then' 'if test x"" = x""; then'
  '';

  nativeBuildInputs = [ autoPatchelfHook autoreconfHook nasm ];

  checkTarget = "check";
  doCheck = true;

  meta = with lib; {
    homepage = "https://www.bioinformatics.babraham.ac.uk/projects/trim_galore";
    description =
      "Wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data";
    license = licenses.gpl3;
    maintainers = with maintainers; [ limeytexan ];
  };
}
