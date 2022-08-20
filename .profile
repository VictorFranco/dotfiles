#    __  ___         ____             _____ __
#   /  |/  /_  __   / __ \_________  / __(_) /__
#  / /|_/ / / / /  / /_/ / ___/ __ \/ /_/ / / _ \
# / /  / / /_/ /  / ____/ /  / /_/ / __/ / /  __/
#/_/  /_/\__, /  /_/   /_/   \____/_/ /_/_/\___/
#       /____/

alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
. "$HOME/.cargo/env"

alias lynx='lynx -cfg=$HOME/.config/lynx/lynx.cfg -lss=$HOME/.config/lynx/lynx.lss'

LIBGL_ALWAYS_SOFTWARE=1
export LIBGL_ALWAYS_SOFTWARE
setxkbmap latam
LANG="en_US.UTF-8"
export LANG
export PATH=$HOME/.local/bin:$PATH
