{
  pkgs,
  inputs,
  ...
}: {
  # sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # environment.etc = {
  #   "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
  #     bluez_monitor.properties = {
  #     	["bluez5.enable-sbc-xq"] = true,
  #     	["bluez5.enable-msbc"] = true,
  #     	["bluez5.enable-hw-volume"] = true,
  #     	["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
  #     }
  #   '';
  #   "wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf".text = ''
  #     wireplumber.settings = {
  #       bluetooth.autoswitch-to-headset-profile = false
  #     }
  #   '';
  # };
  # services.pipewire.wireplumber.extraConfig = {
  #   "settings" = {
  #     "monitor.bluez.rules" = [
  #       {
  #         matches = [
  #           {
  #             "device.name" = "~bluez_card.*";
  #           }
  #         ];
  #         actions = {
  #           update-props = {
  #             "bluez5.autoswitch-profile" = false;
  #             "bluez5.reconnect-profiles" = ["a2dp_sink"];
  #             # mSBC is not expected to work on all headset + adapter combinations.
  #             "bluez5.msbc-support" = false;
  #             # SBC-XQ is not expected to work on all headset + adapter combinations.
  #             "bluez5.sbc-xq-support" = true;
  #           };
  #         };
  #       }
  #     ];
  #   };
  #   "monitor.bluez.properties" = {
  #     "bluez5.enable-sbc-xq" = true;
  #     "bluez5.enable-msbc" = true;
  #     "bluez5.enable-hw-volume" = true;
  #     "bluez5.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
  #   };
  # };
  #
  services.blueman.enable = true;
  environment.systemPackages = [pkgs.blueberry];
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
  };
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = ["network.target" "sound.target"];
    wantedBy = ["default.target"];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}
