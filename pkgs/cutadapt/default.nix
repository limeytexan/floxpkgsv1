{ lib, python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "cutadapt";
  version = "3.2";

  src = fetchFromGitHub {
    owner = "marcelm";
    repo = "cutadapt";
    rev = "v${version}";
    sha256 = "044kqi61q6zdxpjb5qzp0g36mj4cknsr06z66p62may1aiyfi6a3";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace 'dnaio~=0.5.0' 'dnaio>=0.5.0' \
      --replace 'xopen~=1.0.0' 'xopen>=1.0.0'
  '';

  preConfigure = ''
    export SETUPTOOLS_SCM_PRETEND_VERSION=${version}
  '';

  nativeBuildInputs = with python3Packages; [ cython setuptools_scm ];

  propagatedBuildInputs = with python3Packages; [ dnaio xopen ];

  meta = with lib; {
    homepage = "https://cutadapt.readthedocs.io/en/stable/";
    description =
      "Finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads";
    # license = licenses.???;	# own license.
    maintainers = with maintainers; [ limeytexan ];
  };
}
