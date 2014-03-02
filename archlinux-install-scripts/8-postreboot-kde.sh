echo "Installing kde..." && \
pacman -S --needed alsa-utils alsa-plugins pulseaudio pulseaudio-alsa lib32-alsa-plugins lib32-libpulse gstreamer0.10-plugins \
                    kde-meta-kdebase kde-meta-kdemultimedia kdeedu-ktouch kde-meta-kdeadmin kde-meta-kdeartwork kde-meta-kdegraphics \
                    kcm-touchpad kde-meta-kdeplasma-addons kde-meta-kdesdk kde-meta-kdeutils \
                    appmenu-qt oxygen-gtk3 oxygen-gtk2 kde-gtk-config ktorrent konversation ksshaskpass \
                    networkmanager dnsmasq kdeplasma-applets-plasma-nm usb_modeswitch wvdial mobile-broadband-provider-info \
                    bluez bluez-utils bluedevil \
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
sed -i "s|^Listen.*631$|Listen 127.0.0.1:631|" /etc/cups/cupsd.conf && \
echo "Done."
