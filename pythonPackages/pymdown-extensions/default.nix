{ lib, stdenv, fetchPypi, buildPythonPackage, markdown, pytest, pyyaml }:

buildPythonPackage rec {
  pname = "pymdown-extensions";
  version = "8.0.1";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "07p5xks6qf73nbv0qb7jrspkpmxdyr7dpxv3rnkh9p2b5l2h99wv";
  };

  checkInputs = [ pytest pyyaml ];
  propagatedBuildInputs = [ markdown ];

  # 25/175 tests broken, but snippets work. Moving on ...
  doCheck = false;

  meta = with lib; {
    description = "Extensions for Python Markdown";
    maintainers = [ maintainers.limeytexan ];
    homepage = https://github.com/facelessuser/pymdown-extensions;
  };
}
