if [ ! -d "${HOME}/.zsh" ]; then
    echo "Warning: .zsh appears not to exist"
else
    for config_file (${HOME}/.zsh/login/*.zsh) source $config_file
fi
