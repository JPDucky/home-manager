{
    description = "home-manager flake for dotfiels";
    
    inputs = {
        nixpkgs.url = 'github:nixos/nixpkgs/nixpkgs-unstable';
        home-manager.url = 'github:nix-community/home-manager';
        home-manager.inputs.nixpkgs.follows = 'nixpkgs';
      };

    outputs = inputs: {
        defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

        homeConfigurations = {
            "palmerd" = inputs.home-manager.lib.homeManagerConfiguration {
                system = "x86_64-linux";
                homeDirectory = "/home/palmerd";
                username = "palmerd";
                configuration.imports = [ ./home.nix ];
              };
          };
      };
}
