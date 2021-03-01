{ lib, python, buildPythonPackage, cython, fetchPypi, autoPatchelfHook, isa-l
, pathlib
# , backports_functools_lru_cache # for py2
}:

buildPythonPackage rec {
  pname = "isal";
  version = "0.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0jjf0xhsjgd7a0sg9c3jw5rlrap1bpna09waxbqwf9ihs8lclq2v";
  };
  postPatch = ''
    substituteInPlace setup.py --replace \
      'possible_prefixes = [sys.exec_prefix, sys.base_exec_prefix]' \
      'possible_prefixes = [ "${isa-l}" ]'
  '';

  nativeBuildInputs = [ autoPatchelfHook cython ];

  buildInputs = [ isa-l ];

  preConfigure = ''
    export PYTHON_ISAL_LINK_DYNAMIC=true
  '';

  meta = with lib; {
    description =
      "Faster zlib and gzip compatible compression and decompression by providing Python bindings for the ISA-L library";
    license = licenses.mit;
    homepage = "https://github.com/pycompression/python-isal";
    maintainers = with maintainers; [ limeytexan ];
  };
}

