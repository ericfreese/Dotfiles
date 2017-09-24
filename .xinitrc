# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap # Mapping caps lock to control seems to be buggy, sometimes leaving caps lock on

xrandr --dpi 144

xbindkeys

# Set key delay and repeat rate
xset r rate 150 45

systemctl --user start redshift
systemctl --user start dunst
exec i3
