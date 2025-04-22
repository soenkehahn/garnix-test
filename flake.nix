{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  outputs = { nixpkgs, ... }: {
    packages.x86_64-linux.large-file-public =
      (import nixpkgs { system = "x86_64-linux"; }).runCommand
        "large-file-public"
        {}
        "head -c ${toString (4 * 1024 * 1024 * 1024)} /dev/random > $out";
  };
}
