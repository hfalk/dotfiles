# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update="brew update; brew upgrade; brew cleanup; brew cask upgrade; brew cask cleanup; npm update -g; apm update; apm upgrade; apm clean; omf update; fisher up"

# git shortcuts
alias ga="git add"
alias gap="git add --patch"
alias gl="git pull --prune"
alias gp="git push"
alias gd="git diff"
alias gdc="git diff --cached"
alias gc="git commit -m"
alias gcv="git commit -v"
alias gca="git commit -am"
alias gre="git revert"
alias gch="git checkout"
alias gb="git branch"
alias gs="git status --short --branch"
alias gsl="git status"
alias glp="git log -p"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
# Log, just more space efficient and with pretty colors

# Edit hosts file
alias hosts="sudo vim /etc/hosts"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Check free diskspace
alias diskspace_report="df -P -kHl"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false; killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Run previous command with sudo
function sudo!!
    eval sudo $history[1]
end

# Like 'cat', but with pretty colors
alias c="pygmentize -O style=monokai -f console256 -g"
