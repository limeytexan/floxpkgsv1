{ lib, python, buildPythonPackage, fetchPypi, isal, setuptools_scm }:

buildPythonPackage rec {
  pname = "xopen";
  version = "1.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1cxdx5jzqym92s3b9r9yy4dz988131wr7rqr5s1fichkcfwpw9rq";
  };

  nativeBuildInputs = [ setuptools_scm ];

  propagatedBuildInputs = [ isal ];

  # checkPhase = "VERSIONS=${python.interpreter} ./run_tests.sh";

  meta = with lib; {
    description =
      "Provides an xopen function that works like the built-in open function, but can also deal with compressed files";
    license = licenses.mit;
    homepage = "https://github.com/pycompression/xopen";
    maintainers = with maintainers; [ limeytexan ];
  };
}
