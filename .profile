#export PS1="\u@\h \W: $"				# Sets my leading shell line on login
TITLEBAR="\[\033]0;\u@\h :: \w\007\]"	# Sets the terms title bar to my CWD
#export PS1="${TITLEBAR}\u@\h:\ $"		# Sets my shell to show my user and host

export PS1="\u@\h \W $"
set horizontal-scroll-mode on

PROMPT_COMMAND='history -a'
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"

# Set these near the top, good for debugging other scripts, which should honestly all have these commabds hard coded                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            az 
#set -o nounset     # These  two options are useful for debugging.
#set -o xtrace
alias debug="set -o nounset; set -o xtrace"

# -- shopt options, see shopt -p for all options --
shopt -s cdspell						# Automatic spelling correction for `cd`
shopt -s cmdhist						# Save multi-line cmd's as single line
shopt -s histappend						# history list is appended to the file named by the value of the HISTFILE


# -- Color output --
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
# Do not want to export CLICOLOR_FORCE, so just do it this once
# Add in the -f to force sorting to be like the Finder
#function l () { command env CLICOLOR_FORCE=X ls -laf "$@"; }
export CLICOLOR=true
export CLICOLOR_FORCE=true
function l { ls -la $@ | grep -v .DS_Store; }


# -- Local application aliases --
alias traceroute='traceroute -I -q 1 -w 2'	# Speed up traceroute, and make compliant
alias locate='locate -i'
alias uldb='sudo /usr/libexec/locate.updatedb'


# -- Move around my home directory --
alias dt='cd ~/Desktop;       echo "moved to $(pwd)"'	# Take the shell to the Desktop dir
alias dl='cd ~/Downloads;     echo "moved to $(pwd)"'	# Take the shell to the Downloads dir
alias dm='cd ~/Documents;     echo "moved to $(pwd)"'	# Take the shell to the Documents dir
alias li='cd ~/Library;       echo "moved to $(pwd)"'	# Take the shell to the Library dir
alias ap='cd /Applications;   echo "moved to $(pwd)"'	# Take the shell to the Applications dir
alias vd='cd /Volumes/Videos; echo "moved to $(pwd)"'	# Take the shell to the Videos Volume dir

# -- Move to misc drectories I frequest --
alias gg='cd /Users/haneda/Documents/Haneda\,\ Scott/git-projects; echo "moved to $(pwd)"'	# gg for go-git to take me to the root level of my git projects

# -- Open direcories around my home directory --
alias odt='open ~/Desktop'	                            # Open my home Desktop directory
alias odl='open ~/Downloads'	                        # Open my home Downloads directory
alias odm='open ~/Documents'                            # Open my home Documents directory
alias oli='open ~/Library'                              # Open my home Library directory
alias oap='open /Applications'                          # Open the Applications directory
alias ovd='open /Volumes/Videos'	                    # Open my home Videos directory

# Nuke the S_Store file
alias ds='rm .DS_Store'

# -- Display free disk space
alias df='df -kh'

## Colorize the grep command output for ease of use ( good for log files ) ##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# -- Make a new directory, then cd into it
md() { mkdir -p "$@" && cd "$@"; pwd; }


# -- Ping test for internet connection
# -- Will ping google.com IP address
alias pink='ping `dig google.com A +short | head -n1`'


# Open a word in the local dictionary
dict() {
	echo "Looking up '$1' in the Mac OS X Dictionary";
	open dict://$1
}

# -- End of My Aliases --


# -- Change to the directory of the front most Finder window
#cdf() {
#	eval cd "`osascript -e 'tell application "Finder" to \
#	set return to quoted form of POSIX path of (target of window 1 as alias)' 2>/dev/null`"
#	echo "Shell is now in: `pwd`"
#}


# -- PATH modifications --
export PATH=/Users/haneda/bin:$PATH
