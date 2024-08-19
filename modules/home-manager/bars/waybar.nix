{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      minibar = {
        layer = "top";
        position = "bottom";
        modules-left = ["hyprland/workspaces" "hyprland/mode" "wlr/taskbar"];
        modules-right = ["battery" "pulseaudio" "tray"];
        modules-center = ["clock"];
        "pulseaudio" = {
          on-click = "pavucontrol";
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" ""];
            ignored-sinks = "Easy Effects Sink";
          };
        };
        "battery" = {
          # "bat" = "BAT2";
          # "interval" = 60;
          # "states" = {
          #   "warning" = 30;
          #   "critical" = 15;
          # };
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
          # "max-length" = 25;
        };
      };
    };
    style = ''
          * {
          border: none;
          border-radius: 0;
          font-family: "Ubuntu Nerd Font";
          font-size: 13px;
          min-height: 0;
      }

      window#waybar {
          background: transparent;
          color: white;
      }

      #window {
          font-weight: bold;
          font-family: "Ubuntu";
      }
      /*
      #workspaces {
          padding: 0 5px;
      }
      */

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: #458588;
          border-top: 2px solid transparent;
      }

      #workspaces button.focused {
          color: #c9545d;
          border-top: 2px solid #c9545d;
      }

      #mode {
          background: #64727D;
          border-bottom: 3px solid white;
      }

      #clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
          padding: 0 3px;
          margin: 0 2px;
          color: #458588
      }

      #clock {
          font-weight: bold;
      }

      #battery {
      }

      #battery icon {
          color: red;
      }

      #battery.charging {
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: black;
          }
      }

      #battery.warning:not(.charging) {
          color: white;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #cpu {
      }

      #memory {
      }

      #network {
      }

      #network.disconnected {
          background: #f53c3c;
      }

      #pulseaudio {
      }

      #pulseaudio.muted {
      }

      #custom-spotify {
          color: rgb(102, 220, 105);
      }

      #tray {
      }
    '';
  };
}
