mkdir -p ~/.cache/ae
wget -qO ~/.cache/ae/manifest.yaml https://raw.githubusercontent.com/vikdevelop/ae/main/manifest.yaml > /dev/null 2>&1
cd ~/.cache/ae
echo "Installing depency runtime & SDK"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install runtime/org.freedesktop.Platform/x86_64/21.08 runtime/org.freedesktop.Sdk/x86_64/21.08 org.freedesktop.Sdk.Extension.node16 app/org.electronjs.Electron2.BaseApp/x86_64/21.08 org.flatpak.Builder -y > /dev/null 2>&1
echo "Building app with flatpak builder"
flatpak run org.flatpak.Builder build manifest.yaml --install --user > /dev/null 2>&1
echo -e "Done! \nae was installed successfully! Run app with command 'flatpak run com.github.vikdevelop.ae'"
