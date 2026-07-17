{
  description = "AWS CDK ハンズオン 補助コンテンツ - dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.hugo
            pkgs.git
          ];

          shellHook = ''
            echo "AWS CDK ハンズオン 補助コンテンツ dev shell"
            echo "  hugo : $(hugo version | head -n1)"
            echo ""
            echo "ローカルプレビュー: hugo server --source workshop"
          '';
        };
      });
}
