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
    version = "5b0c682d7092e02a0e8e0f047370be8c61ad3b4e";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "consult";
      rev = "5b0c682d7092e02a0e8e0f047370be8c61ad3b4e";
      fetchSubmodules = false;
      sha256 = "sha256-MJjKuavbkH2FweIjtNs0LAd0ZZWq5GiwA0w8RoVoPis=";
    };
    date = "2025-01-28";
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
    version = "867a3debf907cbd7c5b0eb8837354a1efc7c2db9";
    src = fetchFromGitHub {
      owner = "copilot-emacs";
      repo = "copilot.el";
      rev = "867a3debf907cbd7c5b0eb8837354a1efc7c2db9";
      fetchSubmodules = false;
      sha256 = "sha256-BEA5cQSNgAMOULM3uNMATYHtFwV7CXAsZYi5IT1kB8A=";
    };
    date = "2025-01-15";
  };
  emacs-corfu = {
    pname = "emacs-corfu";
    version = "2c476b442ccfda9935e472b26d9cd60d45726560";
    src = fetchFromGitHub {
      owner = "minad";
      repo = "corfu";
      rev = "2c476b442ccfda9935e472b26d9cd60d45726560";
      fetchSubmodules = false;
      sha256 = "sha256-Y+dcVX2zXkYaHvsS+SuhqqCnwwm188dj0VJf7BYxzHs=";
    };
    date = "2025-01-28";
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
    version = "42c61e232eadd05027c118497a04cd4acbe5d802";
    src = fetchFromGitHub {
      owner = "orzechowskid";
      repo = "tree-sitter-css-in-js";
      rev = "42c61e232eadd05027c118497a04cd4acbe5d802";
      fetchSubmodules = false;
      sha256 = "sha256-9xyWD/zPGL4QOH/FffmGIHbOzJME8gPUfd7uQc2MTpg=";
    };
    date = "2024-06-13";
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
  emacs-magit = {
    pname = "emacs-magit";
    version = "5e364d2ff3eb9fb47ca9fcc7f748a984f704401d";
    src = fetchFromGitHub {
      owner = "magit";
      repo = "magit";
      rev = "5e364d2ff3eb9fb47ca9fcc7f748a984f704401d";
      fetchSubmodules = false;
      sha256 = "sha256-4Pk4OHaXjBIdfqc/B51U0tTzP90d+gubt6sAYjJGR70=";
    };
    date = "2025-01-30";
  };
  emacs-modus-themes = {
    pname = "emacs-modus-themes";
    version = "4b10426687d2b417a93ccffbe8d05b2039aa7d7c";
    src = fetchFromGitHub {
      owner = "protesilaos";
      repo = "modus-themes";
      rev = "4b10426687d2b417a93ccffbe8d05b2039aa7d7c";
      fetchSubmodules = false;
      sha256 = "sha256-k0wOm15k8LxWV9gtSdAu7UCiEq9QFp2AsJFJWx1+lRk=";
    };
    date = "2025-01-27";
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
  emacs-org-modern-indent = {
    pname = "emacs-org-modern-indent";
    version = "52b46c6ecd63e627ab5bfb83c580b51f68a23774";
    src = fetchFromGitHub {
      owner = "jdtsmith";
      repo = "org-modern-indent";
      rev = "52b46c6ecd63e627ab5bfb83c580b51f68a23774";
      fetchSubmodules = false;
      sha256 = "sha256-9aaaPGCvt51FknRKB5zT8AdHjhH/sQMc1IyQS3KnJsU=";
    };
    date = "2024-12-16";
  };
  emacs-projectile = {
    pname = "emacs-projectile";
    version = "06faf0928687e69ff0a0fc70f019f2d70222e872";
    src = fetchFromGitHub {
      owner = "bbatsov";
      repo = "projectile";
      rev = "06faf0928687e69ff0a0fc70f019f2d70222e872";
      fetchSubmodules = false;
      sha256 = "sha256-4Xw/v03ukQCJw8fPMVVnDkMSBj1OJNDQHAXF76orK6U=";
    };
    date = "2025-01-30";
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
  emacs-tsx-mode = {
    pname = "emacs-tsx-mode";
    version = "2dd6168b3919652a851fb92c3f17c3b161d7b60b";
    src = fetchFromGitHub {
      owner = "orzechowskid";
      repo = "tsx-mode.el";
      rev = "2dd6168b3919652a851fb92c3f17c3b161d7b60b";
      fetchSubmodules = false;
      sha256 = "sha256-jX1jfCJGqrw7uZ3HCug8+zvU6zxxZ6hTKVzSRS5v4C4=";
    };
    date = "2025-01-26";
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
    version = "5679dfd6aa05fb38773cf5551aef1b657b73ac78";
    src = fetchgit {
      url = "https://github.com/minad/vertico";
      rev = "5679dfd6aa05fb38773cf5551aef1b657b73ac78";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-daUq5G8rzbu8UOQvk1EGkpxhOzowmd6uPRk4yQrvDLM=";
    };
    date = "2025-01-28";
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
