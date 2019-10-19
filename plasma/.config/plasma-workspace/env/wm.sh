# Disable KWin and use i3gaps as WM
export KDEWM=/usr/bin/i3
export SSH_ASKPASS="/usr/bin/ksshaskpass"

# Compositor (Animations, Shadows, Transparency)
# xcompmgr -C
compton -cCfb --backend glx
