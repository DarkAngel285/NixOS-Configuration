{
  boot = {
    loader = {
      efi = {
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;

        efiSupport = true;
        efiInstallAsRemovable = true;
        devices = [ "nodev" ];
        extraEntries = ''
          menuentry "Reboot" --class restart {
            reboot
          }
          menuentry "Poweroff" --class shutdown {
            halt
          }
        '';
      };
    };

    initrd.kernelModules = [ "amdgpu" ];
    kernelParams = [ "psmouse.synaptics_intertouch=0" ];
  };
}
