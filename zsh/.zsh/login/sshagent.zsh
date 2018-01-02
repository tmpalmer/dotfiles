# Start up and share ssh-agent between the terminals
# http://mah.everybody.org/docs/ssh

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo -n "Initialising new SSH agent: "
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null

     case $(uname -s) in
         Darwin)
            PS="ps x"
            ;;
         *)
            PS="ps -ef"
            ;;
     esac

     eval ${PS} | grep ${SSH_AGENT_PID} | grep ssh-agent > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi 
