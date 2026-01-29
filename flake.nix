{
  description = "";

  # inputs = {
  #   nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  # };

  outputs =
    { self }:
    let
      system = "x86_64-linux";

      # pkgs = nixpkgs.legacyPackages.${system};
      # lib = nixpkgs.lib;
      pkgs = (import <nixpkgs> { }).pkgs;
      lib = (import <nixpkgs> { }).lib;

      project-name = "digital-mercenaries";
    in
    {
      devShells.${system} = {
        /**
          ```nix
          nix develop
          ```
        */
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            docker
            docker-compose
            ungoogled-chromium
          ];
        };


        /**
          ```nix
          nix develop .#chromium
          ```
        */
        chromium = pkgs.mkShell {
          shellHook = ''
            ${lib.getExe pkgs.ungoogled-chromium} --incognito --password-store=basic "http://${project-name}.localhost:4000";
            exit;
          '';
        };

        docker-compose = {
          /**
            ```nix
            nix develop .#docker-compose.up
            ```
          */
          up = pkgs.mkShell {
            shellHook = ''
              ${lib.getExe pkgs.docker-compose} up --remove-orphans;
              exit;
            '';
          };

          restart = {
            /**
              ```nix
              nix develop .#docker-compose.restart.jekyll
              ```
            */
            jekyll = pkgs.mkShell {
              shellHook = ''
                ${lib.getExe pkgs.docker-compose} restart jekyll;
                exit;
              '';
            };
          };

          shell = {
            /**
              ```nix
              nix develop .#docker-compose.shell.jekyll
              ```
            */
            jekyll = pkgs.mkShell {
              shellHook = ''
                ${lib.getExe pkgs.docker-compose} run jekyll /bin/ash;
                exit;
              '';
            };
          };

          stop = {
            /**
              ```nix
              nix develop .#docker-compose.stop.jekyll
              ```
            */
            jekyll = pkgs.mkShell {
              shellHook = ''
                ${lib.getExe pkgs.docker-compose} stop jekyll;
                exit;
              '';
            };
          };
        };

      };
    };
}
