case "$TERM" in
    xterm*|rxvt*)
        preexec () {
            # Assign this otherwise the word split won't function correctly
            CMD=$1
            case $CMD[(ws: :)1] in
                ls|cd)
                    # Do nothing as it's highly annoying to have the title flash as you move about
                    ;;
                *)
                    print -Pn "\e]0;%n@%m: $1\a"
                    ;;
            esac
        }

        precmd () {
            print -Pn "\e]0;%n@%m:%~ (%*)\a"
        }
        ;;
esac
