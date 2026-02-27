#set fish_greeting ""

# set -gx TERM xterm-256color

set -g theme_nerd_fonts yes
# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "eza -l --icons"
alias lla "ll -A"
alias g git
alias vim nvim
#alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape" # needed for pycortex


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /bin /usr/bin $PATH
set -gx PATH /opt/local/bin /opt/local/sbin $PATH
set -gx PATH /Library/TeX/texbin $PATH
set -gx PATH /Applications/Inkscape.app/Contents/MacOS $PATH

# bobthefish 
set -g theme_display_date no
set -g theme_display_virtualenv yes
set -g theme_display_user no
set -g theme_display_cmd_duration yes

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
# starship UI


# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

if status is-interactive
  and not set -q TMUX
  exec tmux
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<


eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx TERMINFO "$HOME/.terminfo"
