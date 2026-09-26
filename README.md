# flake

My own NixOS configuration.

<img width="2560" height="1663" alt="Image" src="https://github.com/user-attachments/assets/c71b3565-9192-49b0-a791-1d0bbee413b0" />
<img width="2560" height="1663" alt="Image" src="https://github.com/user-attachments/assets/545de417-dd5a-4637-90c7-b8a6bd0f15e9" />

> [!NOTE]
> I don't use all configurations here in [config](./home/config) folder. I only use some of them.
> Other configurations will exist as archive. But, you may have problems when you try to use it.
> To check am I actively using it, you can see bottom of [home.nix](./home/home.nix) file. If that line is commented, then I'm not using it.

## Installation

> [!NOTE]
> You should not use hardware-configuration.nix blindly.

```bash
git clone https://github.com/kzzzld/flake ~/flake
cd ~/flake

# for nixmac-btw
# NOTE: You should use --impure if you are in Asahi. Because Asahi needs to read firmware.cpio and it's in /boot.
# NOTE: You may ask, why we don't move that file to flake. If you move that and accidentally push it, you can get DMCA.
# NOTE: And, without --impure Nix flake can't read file outside from flake.
cp /etc/nixos/hardware-configuration.nix ./hosts/nixmac-btw/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#nixmac-btw --impure

# for nixpc-btw
cp /etc/nixos/hardware-configuration.nix ./hosts/nixpc-btw/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#nixpc-btw

# then commit hardware-configuration.nix file
git add .
git commit -m "feat: update hardware-configuration.nix file for newly installed system"

# then you can push it when you want
git push
```

## Contributing

It's my own personal repo but I'm welcome for pull requests, issues etc. If you want to merge code, please ensure it's formatted. To format file, you can use alejandra.

```bash
nix shell nixpkgs#alejandra -c alejandra .
```

**Why Alejandra?** Because I like how it formats the code.
