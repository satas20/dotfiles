if status is-interactive
    # Commands to run in interactive sessions can go here
    # Go Path Setup
    set -gx GOPATH $HOME/go
    set -gx PATH $PATH $GOPATH/bin
    starship init fish | source
end
function apr
    # Runs the script and passes whatever you type/paste after it
    ~/bash/approve.pr $argv
end
abbr -a crpr '~/Projects/bash/create-pr.sh'
abbr -a appr '~/Projects/bash/approvePR.sh'
abbr -a mgpr '~/Projects/bash/mergePR.sh'
