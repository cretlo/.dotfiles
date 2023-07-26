#
# ~/.bash_profile
# Note:
#   Only sourced by bash when started in login mode (ctrl+alt+F1...F6)
#   Isn't sources when logged in graphically.
# 
[[ -f ~/.bashrc ]] && . ~/.bashrc

export TERM='alacritty'
export SHELL='bash'
export COLORTERM='truecolor'
export PS1='[\u@\h \W]\$ '
export EDITOR='nvim'
export WM='i3'
export PAGER='less'

# Use color in less
export LESS='-R --use-color -Dd+r$Du+b$'
