# flake-btw

My own NixOS configuration.

## Installation

> [!NOTE]
> You should not use hardware-configuration.nix blindly.

```bash
git clone https://github.com/kzzzld/flake-btw ~/flake-btw
cd ~/flake-btw
sudo nixos-rebuild switch --flake .#nixpc-btw
```
