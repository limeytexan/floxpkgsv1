let nixexprsLib = import <nixexprs-lib>;
in nixexprsLib.channel {
  name = "limeytexan";

  outputOverlays = [
    (nixexprsLib.auto.pkgs ./pkgs)
  ];
}
