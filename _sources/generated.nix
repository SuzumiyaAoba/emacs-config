# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  emacs-anzu = {
    pname = "emacs-anzu";
    version = "21cb5ab2295614372cb9f1a21429381e49a6255f";
    src = fetchFromGitHub {
      owner = "emacsorphanage";
      repo = "anzu";
      rev = "21cb5ab2295614372cb9f1a21429381e49a6255f";
      fetchSubmodules = false;
      sha256 = "sha256-xnBSzfxcrLIprMVtj2HYgEZIdWIVM0An5XS55G4ueOU=";
    };
    date = "2024-09-28";
  };
  emacs-consult = {
    pname = "emacs-consult";
    version = "4314c45d84d9e00d45d2b611562d8fe2e4ddcf48";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "consult";
      rev = "4314c45d84d9e00d45d2b611562d8fe2e4ddcf48";
      fetchSubmodules = false;
      sha256 = "sha256-vL7+LxzYjvVaMWGvanhvZEyruoTzAaBXTu0QxVpwdqM=";
    };
    date = "2025-06-28";
  };
  emacs-consult-ghq = {
    pname = "emacs-consult-ghq";
    version = "65a99980fb313d473376542cb87464a8a44ff25e";
    src = fetchFromGitHub {
      owner = "tomoya";
      repo = "consult-ghq";
      rev = "65a99980fb313d473376542cb87464a8a44ff25e";
      fetchSubmodules = false;
      sha256 = "sha256-kLF06zQSLb1fZGKZ3XWJoPoSiIR4MzRV8ujpd/v5a/8=";
    };
    date = "2023-11-11";
  };
  emacs-copilot = {
    pname = "emacs-copilot";
    version = "acea1487a5d47dce1fc75dc06abe18c7fd119f6e";
    src = fetchFromGitHub {
      owner = "copilot-emacs";
      repo = "copilot.el";
      rev = "acea1487a5d47dce1fc75dc06abe18c7fd119f6e";
      fetchSubmodules = false;
      sha256 = "sha256-oMOVku7u8P+u3MFljixgcJCl7OOp8y2OKjwAlTlysF0=";
    };
    date = "2025-06-22";
  };
  emacs-corfu = {
    pname = "emacs-corfu";
    version = "5e9a2229322541c1ee28b72128cf7c097b32dd5d";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "corfu";
      rev = "5e9a2229322541c1ee28b72128cf7c097b32dd5d";
      fetchSubmodules = false;
      sha256 = "sha256-Lrr/jh9wvx2YKBBpFxKg1nXUjx69c9EDwDs0ImLI5QY=";
    };
    date = "2025-06-17";
  };
  emacs-corfu-terminal = {
    pname = "emacs-corfu-terminal";
    version = "501548c3d51f926c687e8cd838c5865ec45d03cc";
    src = fetchgit {
      url = "https://codeberg.org/akib/emacs-corfu-terminal";
      rev = "501548c3d51f926c687e8cd838c5865ec45d03cc";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-0qdSsuPE2s+DVu6yuqebMEt/29ypRlvb7TbvWEMHsjU=";
    };
    date = "2023-08-10";
  };
  emacs-css-in-js-mode = {
    pname = "emacs-css-in-js-mode";
    version = "bcbacde99123f65978580dcf8f1aa51107e546c3";
    src = fetchFromGitHub {
      owner = "orzechowskid";
      repo = "tree-sitter-css-in-js";
      rev = "bcbacde99123f65978580dcf8f1aa51107e546c3";
      fetchSubmodules = false;
      sha256 = "sha256-Ye68aAdxjjvlzMCaTEcuinEC2iEzWJEJ2yK/uRWSV+I=";
    };
    date = "2025-03-16";
  };
  emacs-devil = {
    pname = "emacs-devil";
    version = "c2dc9fc2886471daff654e12b46a144a4d1361ae";
    src = fetchFromGitHub {
      owner = "susam";
      repo = "devil";
      rev = "c2dc9fc2886471daff654e12b46a144a4d1361ae";
      fetchSubmodules = false;
      sha256 = "sha256-GMpVFZs2vugh5hAJkRVKw698pBkuGY+g/tWs3lPfR/A=";
    };
    date = "2024-01-29";
  };
  emacs-eglot-booster = {
    pname = "emacs-eglot-booster";
    version = "1260d2f7dd18619b42359aa3e1ba6871aa52fd26";
    src = fetchFromGitHub {
      owner = "jdtsmith";
      repo = "eglot-booster";
      rev = "1260d2f7dd18619b42359aa3e1ba6871aa52fd26";
      fetchSubmodules = false;
      sha256 = "sha256-teAKWDDL7IrCBiZUVIVlB3W22G9H6IrWiRV/P62dFy0=";
    };
    date = "2025-04-28";
  };
  emacs-eglot-x = {
    pname = "emacs-eglot-x";
    version = "8e872efd3d0b7779bde5b1e1d75c8e646a1f729f";
    src = fetchFromGitHub {
      owner = "nemethf";
      repo = "eglot-x";
      rev = "8e872efd3d0b7779bde5b1e1d75c8e646a1f729f";
      fetchSubmodules = false;
      sha256 = "sha256-a2qkitikqGZBXI4aVdn8c7P4HFwep9RPWkOVBbgQV2g=";
    };
    date = "2025-06-26";
  };
  emacs-flymake-popon = {
    pname = "emacs-flymake-popon";
    version = "99ea813346f3edef7220d8f4faeed2ec69af6060";
    src = fetchgit {
      url = "https://codeberg.org/akib/emacs-flymake-popon";
      rev = "99ea813346f3edef7220d8f4faeed2ec69af6060";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-YUyCP3WIjOAvaTP6d2G68mqwGwWdRqhoFMaJWai1WFI=";
    };
    date = "2023-02-08";
  };
  emacs-hydra-posframe = {
    pname = "emacs-hydra-posframe";
    version = "142a04dd588af6c725e331863c3ca7bd5dda13ec";
    src = fetchFromGitHub {
      owner = "Ladicle";
      repo = "hydra-posframe";
      rev = "142a04dd588af6c725e331863c3ca7bd5dda13ec";
      fetchSubmodules = false;
      sha256 = "sha256-9nVBnpaWZIYNDvS2WWBED0HsIRIv4AR4as6wEe463tI=";
    };
    date = "2023-07-17";
  };
  emacs-magit = {
    pname = "emacs-magit";
    version = "725efbd24964819cce3f09ab1aec0eb318a326eb";
    src = fetchFromGitHub {
      owner = "magit";
      repo = "magit";
      rev = "725efbd24964819cce3f09ab1aec0eb318a326eb";
      fetchSubmodules = false;
      sha256 = "sha256-tme1Beg8bDlHW0txb6f1b1Phjag8nhzaVazpGD6WCH8=";
    };
    date = "2025-06-28";
  };
  emacs-modus-themes = {
    pname = "emacs-modus-themes";
    version = "3550360e88b33b3a8f5f271a1d05afa27ffe54aa";
    src = fetchFromGitHub {
      owner = "protesilaos";
      repo = "modus-themes";
      rev = "3550360e88b33b3a8f5f271a1d05afa27ffe54aa";
      fetchSubmodules = false;
      sha256 = "sha256-Hkj9MT5Gf47igpWPIct8T1Z/3MeBT2vxv9xa/UmwuHY=";
    };
    date = "2025-06-23";
  };
  emacs-moody = {
    pname = "emacs-moody";
    version = "7a420e213d589387adb2c556d14c8fe38131e601";
    src = fetchFromGitHub {
      owner = "tarsius";
      repo = "moody";
      rev = "7a420e213d589387adb2c556d14c8fe38131e601";
      fetchSubmodules = false;
      sha256 = "sha256-22oJ4VmjIIFCWa81lMvg3MsYYR6hbC3CTAU8Z5pNkjY=";
    };
    date = "2025-06-16";
  };
  emacs-nerd-icons-dired = {
    pname = "emacs-nerd-icons-dired";
    version = "69b5d3176b7bb08ac1f477cf7c5a491b9b0b5b54";
    src = fetchFromGitHub {
      owner = "rainstormstudio";
      repo = "nerd-icons-dired";
      rev = "69b5d3176b7bb08ac1f477cf7c5a491b9b0b5b54";
      fetchSubmodules = false;
      sha256 = "sha256-gv2VUvv6lOffVw9rMF/R52eY+BiJZ3hztC5BUkX33+A=";
    };
    date = "2025-05-06";
  };
  emacs-nix-mode = {
    pname = "emacs-nix-mode";
    version = "719feb7868fb567ecfe5578f6119892c771ac5e5";
    src = fetchFromGitHub {
      owner = "NixOS";
      repo = "nix-mode";
      rev = "719feb7868fb567ecfe5578f6119892c771ac5e5";
      fetchSubmodules = false;
      sha256 = "sha256-W/bxCAn4cvzKGbhILxtTiWJ5Wln2w6g4TPgk+ziCXsQ=";
    };
    date = "2023-04-21";
  };
  emacs-orderless = {
    pname = "emacs-orderless";
    version = "254f2412489bbbf62700f9d3d5f18e537841dcc3";
    src = fetchFromGitHub {
      owner = "oantolin";
      repo = "orderless";
      rev = "254f2412489bbbf62700f9d3d5f18e537841dcc3";
      fetchSubmodules = false;
      sha256 = "sha256-iGpDDteSXzaWC++RTX4lhLVs1OlbWU4gAMYKMaYLSdE=";
    };
    date = "2025-03-16";
  };
  emacs-org-modern-indent = {
    pname = "emacs-org-modern-indent";
    version = "9973bd3b91e4733a3edd1fca232208c837c05473";
    src = fetchFromGitHub {
      owner = "jdtsmith";
      repo = "org-modern-indent";
      rev = "9973bd3b91e4733a3edd1fca232208c837c05473";
      fetchSubmodules = false;
      sha256 = "sha256-st3338Jk9kZ5BLEPRJZhjqdncMpLoWNwp60ZwKEObyU=";
    };
    date = "2025-04-12";
  };
  emacs-projectile = {
    pname = "emacs-projectile";
    version = "58e33ef298a843984aa7b590233c81c8560d14cd";
    src = fetchFromGitHub {
      owner = "bbatsov";
      repo = "projectile";
      rev = "58e33ef298a843984aa7b590233c81c8560d14cd";
      fetchSubmodules = false;
      sha256 = "sha256-ONO0+3WXtCfvFBjSyQMko9uRQic/tzoF9E03cvHHGfw=";
    };
    date = "2025-06-18";
  };
  emacs-rg = {
    pname = "emacs-rg";
    version = "7611852b5517212a4f0fdab9cd9ecb0cf3995f08";
    src = fetchFromGitHub {
      owner = "dajva";
      repo = "rg.el";
      rev = "7611852b5517212a4f0fdab9cd9ecb0cf3995f08";
      fetchSubmodules = false;
      sha256 = "sha256-38a4/ckKLYpWQ3PBiAKQX5YcGa/Q+vaBaDIzqQDjmG8=";
    };
    date = "2025-06-25";
  };
  emacs-scss-mode = {
    pname = "emacs-scss-mode";
    version = "e8f8a4d64e46f05a833fce2b684d6cb02bd6a94d";
    src = fetchFromGitHub {
      owner = "takeokunn";
      repo = "scss-mode";
      rev = "e8f8a4d64e46f05a833fce2b684d6cb02bd6a94d";
      fetchSubmodules = false;
      sha256 = "sha256-DX/zU0NQw7/6ph8WymTKDm3UE0uQA7Ij+uDbxlgNY5A=";
    };
    date = "2024-12-28";
  };
  emacs-setup = {
    pname = "emacs-setup";
    version = "dfea961eede4023b38f58722bd65c337975d2cb0";
    src = fetchgit {
      url = "https://git.sr.ht/~pkal/setup";
      rev = "dfea961eede4023b38f58722bd65c337975d2cb0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-+W6v5eVQwTfuIog9QGO64pAGB9+pJS0fzEA0seQye1I=";
    };
    date = "2025-01-31";
  };
  emacs-tsx-mode = {
    pname = "emacs-tsx-mode";
    version = "52cf9e2c818182983de70e9bf8971b9befeb72f9";
    src = fetchFromGitHub {
      owner = "orzechowskid";
      repo = "tsx-mode.el";
      rev = "52cf9e2c818182983de70e9bf8971b9befeb72f9";
      fetchSubmodules = false;
      sha256 = "sha256-1OOuSwMyVuXz5Viq9C6lv3uNZOBFYUWb4prdenBWr08=";
    };
    date = "2025-06-23";
  };
  emacs-undohist = {
    pname = "emacs-undohist";
    version = "307c0fbaab630595c0fc1f112cf7ac5a0c4c4a26";
    src = fetchFromGitHub {
      owner = "emacsorphanage";
      repo = "undohist";
      rev = "307c0fbaab630595c0fc1f112cf7ac5a0c4c4a26";
      fetchSubmodules = false;
      sha256 = "sha256-/NB0XCXhUr4OCIXr101CDngcDGnRXLhbZfMqI+mG+EM=";
    };
    date = "2025-04-22";
  };
  emacs-vertico = {
    pname = "emacs-vertico";
    version = "fcab88ad878e16356c392c99a64f172e7541dd65";
    src = fetchgit {
      url = "https://github.com/minad/vertico";
      rev = "fcab88ad878e16356c392c99a64f172e7541dd65";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-Psxywo9xH+Rk3S7h2Xlircauxb0VFuFoBxpvNbp9NiE=";
    };
    date = "2025-06-27";
  };
  emacs-vundo = {
    pname = "emacs-vundo";
    version = "30f85b4ae1f2a7189d44bb738b49559928d046cb";
    src = fetchFromGitHub {
      owner = "casouri";
      repo = "vundo";
      rev = "30f85b4ae1f2a7189d44bb738b49559928d046cb";
      fetchSubmodules = false;
      sha256 = "sha256-ngVWSIjQeX1TBpIo4vz+9IMeBKyA8BJuPWMt4/o4Xqg=";
    };
    date = "2025-06-17";
  };
}
