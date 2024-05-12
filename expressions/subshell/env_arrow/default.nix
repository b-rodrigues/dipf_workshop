# This file was generated by the {rix} R package v0.6.0 on 2024-05-12
# with following call:
# >rix(r_ver = "407f8825b321617a38b86a4d9be11fd76d513da2",
#  > r_pkgs = c("dplyr",
#  > "arrow"),
#  > project_path = path_env_arrow,
#  > overwrite = TRUE)
# It uses nixpkgs' revision 407f8825b321617a38b86a4d9be11fd76d513da2 for reproducibility purposes
# which will install R version 4.1.1
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/407f8825b321617a38b86a4d9be11fd76d513da2.tar.gz") {};
 rpkgs = builtins.attrValues {
  inherit (pkgs.rPackages) dplyr arrow;
};
   system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocales nix ;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [  rpkgs  system_packages  ];
      
  }
