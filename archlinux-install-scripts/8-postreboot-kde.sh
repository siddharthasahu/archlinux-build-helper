echo "Installing kde..." && \
pacman -S --noconfirm --needed alsa-utils alsa-plugins pulseaudio pulseaudio-alsa lib32-alsa-plugins lib32-libpulse gstreamer0.10-plugins \
                    kde-meta-kdebase kde-meta-kdemultimedia kdeedu-ktouch kde-meta-kdeadmin kde-meta-kdeartwork kde-meta-kdegraphics \
                    kcm-touchpad kde-meta-kdeplasma-addons kde-meta-kdesdk kde-meta-kdeutils \
                    appmenu-qt oxygen-gtk3 oxygen-gtk2 kde-gtk-config ktorrent konversation ksshaskpass \
                    networkmanager dnsmasq kdeplasma-applets-plasma-nm usb_modeswitch wvdial mobile-broadband-provider-info \
                    bluez bluez-utils bluez-hid2hci bluedevil \
                    cups libcups hplip gutenprint cups-pdf kdeutils-print-manager && \
systemctl enable kdm && \
systemctl enable NetworkManager && \
systemctl enable ModemManager && \
systemctl enable bluetooth && \
systemctl enable cups && \
groupadd printadmin && \
gpasswd -a sdh printadmin && \
gpasswd -a sdh lp && \
sed -i "s|^SystemGroup.*|SystemGroup printadmin|" /etc/cups/cups-files.conf && \
sed -i \
    -e "s|^Listen.*631$|Listen 127.0.0.1:631|" \
    -e "\|</Location>| s,^,Allow from 127.0.0.1\n," /etc/cups/cupsd.conf && \
sed -i '/Option "TapButton3" "3"/aOption "VertEdgeScroll" "on"\nOption "VertTwoFingerScroll" "on"\nOption "HorizEdgeScroll" "on"' /etc/X11/xorg.conf.d/10-synaptics.conf && \
echo "Done."
