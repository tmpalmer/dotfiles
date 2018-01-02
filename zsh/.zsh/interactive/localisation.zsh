# Run any OS-specific commands
OS=$(uname -s | tr "[:upper:]" "[:lower:]")

case "${OS}" in
    cygwin*)
        OS=windows
        ;;
esac

if [ -d "${HOME}/.zsh/${OS}" ]; then
    for config_file (${HOME}/.zsh/${OS}/*.zsh) source $config_file
fi

# Run any machine-specific customisations
HOSTNAME=

if [ "${OS}" = "windows" ]; then
    HOSTNAME=$(hostname | tr "[:upper:]" "[:lower:]")
else
    HOSTNAME=$(hostname -s)
fi

if [ -d "${HOME}/.zsh/${HOSTNAME}" ]; then
    for config_file (${HOME}/.zsh/${HOSTNAME}/*.zsh) source $config_file
fi
