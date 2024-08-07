# Nixos 



[NixOS is Mindblowing](https://youtu.be/fuWPuJZ9NcU?si=JJkJUeO5Tnkz1Xju)  


[Say Goodbye to Containers - Ephemeral Environments with Nix Shell](https://youtu.be/0ulldVwZiKA?si=KVl00ibkwcvv6JCJ)  

[NIX OS: the BEST package manager on the MOST SOLID Linux distribution](https://youtu.be/DMQWirkx5EY?si=u4osR3y89QXpn4GY)  





# Nix - package manager  






[Matthew Croughan - Use flake.nix, not Dockerfile - MCH2022](https://youtu.be/0uixRE8xlbY?si=7ArVdUBpDLui1Ub_)  


## Learning Curve  


- install the nix package manger  
- install packages globally with nix-env -iA  
- install packages locally with nix-shell  
- familiarize yourself with nix language  
- swith to nix profile install  
- re-write your nix shells to nix flakes  
- install home manager as a flake  
- manage your .dotfiles with home manager  
- install and configure NixOs  
- Learn the Nix language properly  

```

nix run  
nix build
nix develop
nixos-rebuild
home-manager

nix flake show

nix develop ~/myflake#somedevshell  

nixos-rebuild switch --flake ~/myflake#somenixos




To prepare an initial Home Manager configuration for your logged in user, you can run the Home Manager init command directly from its flake.

For example, if you are using the unstable version of Nixpkgs or NixOS, then to generate and activate a basic configuration run the command

nix run home-manager/master -- init --switch

For Nixpkgs or NixOS version 24.05 run

nix run home-manager/release-24.05 -- init --switch


home-manager switch
home-manager build
home-manager packages


```


#### Nix flake  

[Ultimate Nix Flakes Guide](https://youtu.be/JCeYq72Sko0?si=lP9LoDV-35fpSYtb)

#### Nix Homemanager  


[Ultimate NixOS Guide  Flakes  Home-manager](https://youtu.be/a67Sv4Mbxmc?si=rWpW5gDalKQ_5lhj)


[https://youtu.be/utoj6annRK0?si=dJprTP0xTI5bLvlv](https://youtu.be/utoj6annRK0?si=dJprTP0xTI5bLvlv)

[Manage Your Dotfiles with Home Manager!](https://youtu.be/IiyBeR-Guqw?si=Po9Tb1zF82ReEbJw)  


using home-manager standalone there is a good idea because you do not need to rebuild your whole system to change your Vim or shell config.


[https://nix-community.github.io/home-manager/options.xhtml](https://nix-community.github.io/home-manager/options.xhtml)






Nix Homemanger with flakes  

nix flake init  

nix flake update  


https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes  




```
nix run home-manager/$branch -- init

# Edit files in ~/.config/home-manager

nix run home-manager/$branch -- init --switch

```


https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-prerequisites

```
Nix Flakes

Home Manager is compatible with Nix Flakes. But please be aware that this support is still experimental and may change in backwards incompatible ways.

Just like in the standard installation you can use the Home Manager flake in three ways:

    Using the standalone home-manager tool. For platforms other than NixOS and Darwin, this is the only available choice. It is also recommended for people on NixOS or Darwin that want to manage their home directory independently of the system as a whole. See Standalone setup for instructions on how to perform this installation.

    As a module within a NixOS system configuration. This allows the user profiles to be built together with the system when running nixos-rebuild. See NixOS module for a description of this setup.

    This allows the user profiles to be built together with the system when running darwin-rebuild. See nix-darwin module for a description of this setup.

Table of Contents

Prerequisites
Standalone setup
NixOS module
nix-darwin module

Prerequisites

    Install Nix 2.4 or later, or have it in nix-shell.

    Enable experimental features nix-command and flakes.

        When using NixOS, add the following to your configuration.nix and rebuild your system.

        nix = {
          package = pkgs.nixFlakes;
          extraOptions = ''
            experimental-features = nix-command flakes
          '';
        };

        If you are not using NixOS, add the following to nix.conf (located at ~/.config/nix/ or /etc/nix/nix.conf).

        experimental-features = nix-command flakes

        You may need to restart the Nix daemon with, for example, sudo systemctl restart nix-daemon.service.

        Alternatively, you can enable flakes on a per-command basis with the following additional flags to nix and home-manager:

nix --extra-experimental-features "nix-command flakes" <sub-commands>

        home-manager --extra-experimental-features "nix-command flakes" <sub-commands>

    Prepare your Home Manager configuration (home.nix).

    Unlike the channel-based setup, home.nix will be evaluated when the flake is built, so it must be present before bootstrap of Home Manager from the flake. See Configuration Example for introduction about writing a Home Manager configuration.

Standalone setup

To prepare an initial Home Manager configuration for your logged in user, you can run the Home Manager init command directly from its flake.

For example, if you are using the unstable version of Nixpkgs or NixOS, then to generate and activate a basic configuration run the command

nix run home-manager/master -- init --switch

For Nixpkgs or NixOS version 24.05 run

nix run home-manager/release-24.05 -- init --switch

This will generate a flake.nix and a home.nix file in ~/.config/home-manager, creating the directory if it does not exist.

If you omit the --switch option then the activation will not happen. This is useful if you want to inspect and edit the configuration before activating it.

nix run home-manager/$branch -- init

# Edit files in ~/.config/home-manager

nix run home-manager/$branch -- init --switch

Where $branch is one of master or release-24.05.

After the initial activation has completed successfully then building and activating your flake-based configuration is as simple as

home-manager switch

It is possible to override the default configuration directory, if you want. For example,

nix run home-manager/$branch -- init --switch ~/hmconf

# And after the initial activation.

home-manager switch --flake ~/hmconf

Note

The flake inputs are not automatically updated by Home Manager. You need to use the standard nix flake update command for that.

If you only want to update a single flake input, then the command nix flake lock --update-input <input> can be used.

You can also pass flake-related options such as --recreate-lock-file or --update-input <input> to home-manager when building or switching, and these options will be forwarded to nix build. See the NixOS Wiki page for details.
```





### Install 

```

sh <(curl -L https://nixos.org/nix/install) --no-daemon  

mkdir -p ~/.config/nix  

echo 'experimental-feautures = nix-command flakes' >> ~/.config/nix/nix.conf  


sudo systemctl restart nix-daemon



```





#### Commands  


```
nix-shell --help
nix-shell --version
nix-shell -p cowsay lolcat
nix-shell -p cowsay hello
nix-shell -p cowsay --run "cowsay nix"                                                                                                               
nix-shell -p git --run "git --version" --pure -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz   
nix-shell -p git --pure -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz                         
nix-shell -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz                                


nix-collect-garbage

nix-collect-garbage --delete-older-than 15d



nix profile history  

nix profile list  

nix profile install nixpkgs#direnv nixpkgs#nix-direnv  

nix profile upgrade '.*'  


nix-env -iA nixpkgs.neovim

nix profile install nixpkgs#neovim

nix profile install


Warning: Using nix-env permanently modifies a local profile of installed packages. This must be updated and maintained by the user in the same way as with a traditional package manager, foregoing many of the benefits that make Nix uniquely powerful. Using nix-shell or a NixOS configuration is recommended instead.

On NixOS:

nix-env -iA nixos.neovim

On Non NixOS:

# without flakes:
nix-env -iA nixpkgs.neovim
# with flakes:
nix profile install nixpkgs#neovim




# Flake commands  


nix develop github:devinsideyou/scala-seed#java17  

nix develop github:devinsideyou/scala-seed#java11

nix develop github:devinsideyou/scala-seed#java8


nix flake metadata github:devinsideyou/scala-seed

nix flake show github:devinsideyou/scala-seed  



nix run github:gvolpe/neovim flake#scala tokyo night  

nix search nixpkgs ncdu  

nix shell nixpkgs#ncdu -c ncdu /nix/store





```

#### Nix File  


shell.nix  
```
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  GREETING = "Hello, Nix!";

  shellHook = ''
    echo $GREETING | cowsay | lolcat
  '';

}
```



#### Nix Language  

[https://nix.dev/manual/nix/2.18/language/index.html](https://nix.dev/manual/nix/2.18/language/index.html)

```
nix repl
```



## Nix for CI  

www.cachix.org  
Leverage the nix ecosystem to share binaries between CI  


Github action  

```
name: "Test"
on:
  pull_request:
  push:
jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: cachix/install-nix-action@v222
        with:
          nix_path: nixpkgs=channel:nixos-unstable
      - run: nix-build
      - run: nix-shell --run "npm run test

```


