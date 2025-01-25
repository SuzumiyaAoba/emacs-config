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
    version = "31b5c191f9869aa26bedf35991635e03539a1270";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "consult";
      rev = "31b5c191f9869aa26bedf35991635e03539a1270";
      fetchSubmodules = false;
      sha256 = "sha256-PcZXdMLq0lxPzvg83GalL7mlf3M/fdUJRXIJCO1dpGw=";
    };
    date = "2025-01-21";
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
  emacs-corfu = {
    pname = "emacs-corfu";
    version = "a401b6a3a645705b4767d938a2efa02183ba96f4";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "corfu";
      rev = "a401b6a3a645705b4767d938a2efa02183ba96f4";
      fetchSubmodules = false;
      sha256 = "sha256-o21CjnhW/ZT3BtO0j67u7EpdZiqAm43v452GdXnZOu0=";
    };
    date = "2025-01-20";
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
  emacs-magit = {
    pname = "emacs-magit";
    version = "e9614a336ffef61e8660188a95ae5d78674ed36d";
    src = fetchFromGitHub {
      owner = "magit";
      repo = "magit";
      rev = "e9614a336ffef61e8660188a95ae5d78674ed36d";
      fetchSubmodules = false;
      sha256 = "sha256-LGqdDfdU+77qbRnOrBij83Gct1haSH+5DI7RdwdUvjk=";
    };
    date = "2025-01-20";
  };
  emacs-modus-themes = {
    pname = "emacs-modus-themes";
    version = "75791f5efc49ebb7e714fe2e0d813a0d1e70c25d";
    src = fetchFromGitHub {
      owner = "protesilaos";
      repo = "modus-themes";
      rev = "75791f5efc49ebb7e714fe2e0d813a0d1e70c25d";
      fetchSubmodules = false;
      sha256 = "sha256-1updJxXXtkzQ3ObhoCnMt92Nlev3yXPbed8felEua0Q=";
    };
    date = "2025-01-22";
  };
  emacs-moody = {
    pname = "emacs-moody";
    version = "26dd59b300c149a0e2e332023115b280b42ead12";
    src = fetchFromGitHub {
      owner = "tarsius";
      repo = "moody";
      rev = "26dd59b300c149a0e2e332023115b280b42ead12";
      fetchSubmodules = false;
      sha256 = "sha256-AivCBH2/Y/T5tlMq5Un36/H833ZG0ZA0FpYFchuE168=";
    };
    date = "2025-01-01";
  };
  emacs-nerd-icons-dired = {
    pname = "emacs-nerd-icons-dired";
    version = "c0b0cda2b92f831d0f764a7e8c0c6728d6a27774";
    src = fetchFromGitHub {
      owner = "rainstormstudio";
      repo = "nerd-icons-dired";
      rev = "c0b0cda2b92f831d0f764a7e8c0c6728d6a27774";
      fetchSubmodules = false;
      sha256 = "sha256-yoiwuf90qhwzSGQgaXZb+Zo+cTxjeEIt6NoZKQb8mMc=";
    };
    date = "2024-10-13";
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
    version = "411051c3257d60f0492cf88065193bb443b6ca0d";
    src = fetchFromGitHub {
      owner = "oantolin";
      repo = "orderless";
      rev = "411051c3257d60f0492cf88065193bb443b6ca0d";
      fetchSubmodules = false;
      sha256 = "sha256-ttDlbaDdU7+7ly1DLeqJ/1dwwBVzrJ/0FD/q8UeBxRY=";
    };
    date = "2025-01-01";
  };
  emacs-projectile = {
    pname = "emacs-projectile";
    version = "36763dde3bc70d3e43ff2f8e61c783a8ff0f8532";
    src = fetchFromGitHub {
      owner = "bbatsov";
      repo = "projectile";
      rev = "36763dde3bc70d3e43ff2f8e61c783a8ff0f8532";
      fetchSubmodules = false;
      sha256 = "sha256-1UZPD7SdCzew45J8SLFDA92IHxrvBCJTUeoVLhsMgmg=";
    };
    date = "2025-01-24";
  };
  emacs-rg = {
    pname = "emacs-rg";
    version = "94813ba3a7ccf3af68beb23a2c39154a99e8c9ec";
    src = fetchFromGitHub {
      owner = "dajva";
      repo = "rg.el";
      rev = "94813ba3a7ccf3af68beb23a2c39154a99e8c9ec";
      fetchSubmodules = false;
      sha256 = "sha256-IEG/wg9Rpp81xWQRcPXqcdohE/aDdHwcmf+2aOUEHqw=";
    };
    date = "2025-01-02";
  };
  emacs-setup = {
    pname = "emacs-setup";
    version = "992e7b49f0dbbd6979598902e67079fa9607febf";
    src = fetchgit {
      url = "https://git.sr.ht/~pkal/setup";
      rev = "992e7b49f0dbbd6979598902e67079fa9607febf";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-cIIPrzQvQjBekM5YJcWUYDIp1xV/YBEKm5txdASl4qY=";
    };
    date = "2024-12-24";
  };
  emacs-undohist = {
    pname = "emacs-undohist";
    version = "fd11900663f307958dc7e1d7ea1b0004f6cdb4d0";
    src = fetchFromGitHub {
      owner = "emacsorphanage";
      repo = "undohist";
      rev = "fd11900663f307958dc7e1d7ea1b0004f6cdb4d0";
      fetchSubmodules = false;
      sha256 = "sha256-pbnevZCJInOIgLaIGSBn5rcYyRL5dzE59fBWbiubvcQ=";
    };
    date = "2024-09-25";
  };
  emacs-vertico = {
    pname = "emacs-vertico";
    version = "fef56a0c7fe571c28ad102b54b26e07ebbbd5e82";
    src = fetchgit {
      url = "https://github.com/minad/vertico";
      rev = "fef56a0c7fe571c28ad102b54b26e07ebbbd5e82";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-iamNT7u+5Fe86WEx1lHT92y/xz+0XGjUKhWxJXm9ElM=";
    };
    date = "2025-01-17";
  };
  emacs-vundo = {
    pname = "emacs-vundo";
    version = "288892ee93214ddcaf65fdd9f3134c1bd10100ee";
    src = fetchFromGitHub {
      owner = "casouri";
      repo = "vundo";
      rev = "288892ee93214ddcaf65fdd9f3134c1bd10100ee";
      fetchSubmodules = false;
      sha256 = "sha256-dJZqPOWq9IK/il2RjAKYy0rSQyKpW4TShkBh7ytwrLg=";
    };
    date = "2025-01-14";
  };
}
