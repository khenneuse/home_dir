# Load colors so we can access $fg and more.
autoload -U colors && colors

# Disable CTRL-s from freezing your terminal's output.
stty stop undef

# Enable comments when working in an interactive shell.
setopt interactive_comments

# Prompt. Using single quotes around the PROMPT is very important, otherwise
# the git branch will always be empty. Using single quotes delays the
# evaluation of the prompt. Also PROMPT is an alias to PS1.
git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    [ -n "${branch}" ] && echo " (${branch})"
}
setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}%n %{$fg[blue]%}%~%{$fg[yellow]%}$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b '

# Setup NVM
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add homebrew and the man pages to the path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Add my own scripts to the path
export PATH="$HOME/bin:$PATH:$HOME/google-cloud-sdk/bin:/opt/homebrew/opt/libpq/bin"

export PGPASSFILE='$HOME/.pgpass'
export GH_REGISTRY_TOKEN='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'

# Personal aliases and functions
[ -f $HOME/.personal_aliases ] && . $HOME/.personal_aliases
[ -f $HOME/.personal_functions ] && . $HOME/.personal_functions

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kent/Downloads/safe/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kent/Downloads/safe/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kent/Downloads/safe/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kent/Downloads/safe/google-cloud-sdk/completion.zsh.inc'; fi
