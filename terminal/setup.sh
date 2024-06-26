FILE_DIR=$(dirname `realpath $0`)

echo "Setup terminal emulator:"
# Get personal bins
echo "  + Get custom bin files"
for BIN_NAME in $(ls ${FILE_DIR}/bin); do
    BIN_FILE="${FILE_DIR}/bin/${BIN_NAME}"
    ln -sf "${BIN_FILE}" ~/.local/bin
done

# Get personal bashrc
echo "  + Add '~/.bashrc'"
### remove old personal bashrc
sed -i '/^# >>> PERSONAL PATH$/,/^# <<< PERSONAL PATH$/d' ~/.bashrc

### add new personal bashrc
echo "" >> ~/.bashrc
echo "# >>> PERSONAL PATH" >> ~/.bashrc
cat "${FILE_DIR}/utils/.bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# <<< PERSONAL PATH" >> ~/.bashrc

# Add configs
echo "  + Add '~/.config':"

for CONFIG_DIRNAME in $(ls ${FILE_DIR}/config); do
    echo "    * ${CONFIG_DIRNAME}"
    ln -sf "${FILE_DIR}/config/${CONFIG_DIRNAME}" ~/.config/${CONFIG_DIRNAME}
done