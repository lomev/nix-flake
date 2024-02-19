{ stdenv };
stdenv.mkDerivation {
   name="nvm-0.33.0"
   builder = ./install.sh;
   fileurl{
      url: NVM_GIT_MASTER.zip;
   };
}
