export CLOUD="$HOME/Library/Mobile Documents/"
export EDITOR="hx"
export FZF_DEFAULT_OPTS="--layout=reverse"
export PATH="/opt/homebrew/bin:$HOME/.cargo/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/.config/zshell"
export HELIX_RUNTIME="$HOME/.cargo/helix/runtime"


if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    
    autoload -Uz compinit
    compinit
  fi


source <(fzf --zsh)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY


bindkey "^[[1;3D" backward-word
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey '^[[Z'    reverse-menu-complete
bindkey "^[[1;3C" forward-word
bindkey "^[[3~"   kill-whole-line
bindkey "^R"      redo
bindkey "^U"      undo

