# flake

My own NixOS configuration.

> [!NOTE]
> I don't use all configs here in [config](./home/config) folder. I only use some of them.

## Installation

> [!NOTE]
> You should not use hardware-configuration.nix blindly.

```bash
git clone https://github.com/kzzzld/flake ~/flake
cd ~/flake
sudo nixos-rebuild switch --flake .#nixpc-btw
```

## Contributing

It's my own personal repo but I'm welcome for PRs, issues etc. If you want to merge code, please ensure it's formatted. To format file, you can use alejandra.

```bash
nix-shell -p alejandra --run "alejandra ."
```
