# Nixos 



[NixOS is Mindblowing](https://youtu.be/fuWPuJZ9NcU?si=JJkJUeO5Tnkz1Xju)  


[Say Goodbye to Containers - Ephemeral Environments with Nix Shell](https://youtu.be/0ulldVwZiKA?si=KVl00ibkwcvv6JCJ)  

[NIX OS: the BEST package manager on the MOST SOLID Linux distribution](https://youtu.be/DMQWirkx5EY?si=u4osR3y89QXpn4GY)  



# Nix - package manager  





[Matthew Croughan - Use flake.nix, not Dockerfile - MCH2022](https://youtu.be/0uixRE8xlbY?si=7ArVdUBpDLui1Ub_)  




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


