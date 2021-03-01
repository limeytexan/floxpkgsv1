{ lib, python, buildPythonPackage, fetchPypi, setuptools_scm, xopen }:

buildPythonPackage rec {
  pname = "dnaio";
  version = "0.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0k0ka0m7jiqn7nkh31j579nilwi6rgw6f5yqcni58y85b68rf0bd";
  };

  nativeBuildInputs = [ setuptools_scm ];

  propagatedBuildInputs = [ xopen ];

  # checkPhase = "VERSIONS=${python.interpreter} ./run_tests.sh";

  meta = with lib; {
    description = "dnaio parses FASTQ and FASTA";
    license = licenses.mit;
    homepage = "https://github.com/marcelm/dnaio/";
    maintainers = with maintainers; [ limeytexan ];
  };
}
