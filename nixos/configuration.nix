# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pci-passthrough.nix
      ./virtualization.nix
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sdg"; # or "nodev" for efi only

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "myBox"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless
  networking.networkmanager.enable = true;

  hardware.enableRedistributableFirmware = true;

  # changes to /etc/hosts
  # networking.extraHosts =
  # ''
  # '';

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;

  virtualization = {
     enable = true;
     libvirtUsers = [ "eugen" ];
  };

  pciPassthrough = {
     enable = false;
     pciIDs = "10de:1402,10de:0fba";
     libvirtUsers = [ "eugen" ];
   };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "uk";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Select internationalisation properties.
  console.font = "lat9w-16";
  console.keyMap = "us";
  i18n.defaultLocale = "en_US.UTF-8";

  # Set your time zone.
   time.timeZone = "Europe/Berlin";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     wget lm_sensors nano htop tmux nload fish p7zip
     iperf caddy minio-client gptfdisk nnn nmon pciutils
     openssl gitAndTools.gitFull x11vnc btrfs-progs rclone
     hdparm ethtool killall ispell sshfs scrot x2goclient
     minio unetbootin nethogs

     gcc llvm_7 clang_7 clang-tools clang-manpages gnumake cmake python
     stack zlib sqlite gmock catch2

     vscode emacs emacs-all-the-icons-fonts iosevka
     cmakeCurses
     # for jetbrains
     jdk11

     qpdfview okular mupdf evince imagemagick

     firefox chromium rofi cryptsetup shotwell mpv vlc gstreamer
     gnome3.evolution thunderbird
     arandr keepassx2 redshift volumeicon catfish
     gparted networkmanagerapplet unetbootin

     gnome3.nautilus gnome3.gnome-disk-utility gnome3.gnome-system-monitor gnome3.file-roller
     gnome3.meld gnome3.gnome-terminal gnome3.gvfs gnome3.gedit gnome3.gnome-screenshot
     polkit_gnome gnome3.gnome-power-manager tigervnc gnome3.gnome-keyring gnome3.seahorse
     gnome3.gnome-keyring

     # remote tools
     x2goserver remmina protonvpn-cli

     ffmpeg libav nodejs youtube-dl
     usbutils

     # den
     gnome3.ghex dhex eureka-editor heme tweak wxhexeditor
   ];

   fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      inconsolata
      fira-mono
      ubuntu_font_family
      iosevka
      emacs-all-the-icons-fonts
    ];
   };

   programs.dconf.enable = true;
   services.dbus.packages = [ pkgs.gnome3.dconf ];

  # Auto upgrade
   system.autoUpgrade.enable = true;
   system.autoUpgrade.channel = https://nixos.org/channels/nixos-20.03;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 3389 5901 5902];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = false;

  # Enable CUPS to print documents.
   services.printing.enable = true;
  # services.printing.drivers = [ YOUR_DRIVER ];

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  services.fstrim.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.xfce4-14.xfce4-session}/bin/xfce4-session";
  # services.xrdp.defaultWindowManager = "${pkgs.icewm}/bin/icewm";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  # services.flatpak.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable Gnome gvfs
  #services.gnome3.gvfs.enable = true;
  services.gnome3.gnome-keyring.enable = true;
  #services.gnome3.seahorse.enable = true;

  services.gvfs.enable = true;
  programs.seahorse.enable = true;

  # Enable Fish Shell
  programs.fish.enable = true;

  users.users.eugen = {
    isNormalUser = true;
    home = "/home/eugen";
    description = "Eon";
    extraGroups = [ "wheel" "networkmanager" "libvirt" ];
    shell = "/run/current-system/sw/bin/fish";
  };

  #fileSystems."/mnt/donald" = {
  #  device = "/dev/disk/by-uuid/<the-uuid>";
  #  fsType = "btrfs";
  #  options = ["compress=lzo" ];
  #};

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
