# Enable command history
HISTSIZE=10000        # Set the history size
SAVEHIST=10000         # Set the number of history entries to save
HISTFILE=~/.zsh_history
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# Set history search behavior
setopt hist_ignore_all_dups  # Ignore duplicate history entries
setopt hist_find_no_dups    # Do not show duplicates in search
setopt SHARE_HISTORY          # Share history across 

# 将每个命令立即写入历史文件
setopt INC_APPEND_HISTORY


# Enable auto-correction for mistyped commands
# setopt correct

# Prompt function
autoload -Uz vcs_info

# Function to show Git branch in prompt
function git_prompt() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        # Get the current branch
        branch=$(git rev-parse --abbrev-ref HEAD)
        echo "($branch)"
    fi
}

# Prompt configuration
setopt prompt_subst  # Enable variable substitution in prompt
PROMPT='%F{green}%n@%m %F{cyan}%~ $(git_prompt) %F{yellow}%# %f'

# Enable command autocompletion
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-prompt '%S%p%%'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compinit


# Enable syntax highlighting (if installed)
if which zsh-syntax-highlighting &>/dev/null; then
  source $(which zsh-syntax-highlighting)
fi

# Enable auto-suggestions (if installed)
if which zsh-autosuggestions &>/dev/null; then
  source $(which zsh-autosuggestions)
fi

# 自动补全高亮显示
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/root/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/root/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

