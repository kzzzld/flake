# flake

My own NixOS configuration.

<img width="2560" height="1664" alt="Image" src="https://github.com/user-attachments/assets/cae631cc-eb5b-4f44-8606-21970f920423" />

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
sudo nixos-rebuild switch --flake .#nixpc-btw
```

## Contributing

It's my own personal repo but I'm welcome for pull requests, issues etc. If you want to merge code, please ensure it's formatted. To format file, you can use alejandra.

```bash
nix-shell -p alejandra --run "alejandra ."
```

**Why Alejandra?** Because I like how it formats the code.
