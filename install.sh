# This script will install xkcd-manpage locally for the current user. To install
# for all users, run INSERT OTHER SCRIPT NAME HERE instead. (On second thoughts,
# I am probably not qualified to do this properly)
# man pages are installed to ~/.local/share/man

installpath="${HOME}/.local/share/man"
mkdir -p "${installpath}"

echo "Installing man pages to ${installpath}"

echo "[INFO]: Modification to \$MANPATH added to your .bashrc"
echo "# Added by install.sh from xkcd-manpage." >> "${HOME}/.bashrc"
echo "export MANPATH=${MANPATH}:${installpath}" >> "${HOME}/.bashrc"

for section in {1, 4, 6, 8, 51, 501c3};
do
    mkdir -p "${installpath}/man${section}"
    for file in *."${section}";
    do
        cp "${file}" "${installpath}/man${section}"
        echo "[${file}] --> [${installpath}/man${section}]"
    done
done

echo "Installation finished."
