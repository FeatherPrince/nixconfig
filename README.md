To install the configuration go into the directory and run
```bash
nix-shell -p git
```
```bash
sudo nixos-rebuild switch --flake --impure
```

```mermaid
flowchart TD
    n4(["mastermodule.nix"]) --> n3(["config.nix"])
    n2(["hardwareconfiguration.nix"]) --> n3
    n1(["drivers.nix"]) --> n3
    n5(["All the custom modules"]) --> n4
```

Todo
- Check if modules can be overriden
- Change the configuration structure to the one represetnted on the flowchart
