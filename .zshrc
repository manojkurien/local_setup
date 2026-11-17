# Aliases
alias tf="terraform"
alias ll="ls -lah"
alias c="~/.local/bin/claude"
alias gaa="git add -u"
# Local/private aliases (gitignored)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Git
gprom() {
  local main_branch
  if git show-ref --verify --quiet refs/heads/main; then
    main_branch=main
  else
    main_branch=master
  fi
  git pull --rebase origin "$main_branch"
}
alias gpf="git push --force-with-lease"
alias gc="git commit --verbose"
alias gcc="gc --no-verify"
alias gca="gcc --amend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gst="git status"
alias ga="git add"
alias glo="git log --oneline --decorate"
alias greset="git reset --hard origin/master"
gri() {
  git rebase -i HEAD~"$1"
}

alias n="nvim"

# Pull Requests
alias pr="git push && gh pr create --draft --fill-first"
alias prv="gh pr view --web"

export GOROOT=/opt/homebrew/opt/go/libexec
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Lazy load pyenv - only initialize when first used
pyenv() {
  unfunction pyenv
  eval "$(command pyenv init -)"
  pyenv "$@"
}

# Set default Python version without full pyenv init
export PYENV_VERSION=3.13.7

export NVM_DIR="$HOME/.nvm"
# Lazy-load nvm — defers ~500ms of startup time
_nvm_load() {
  unfunction nvm node npm npx 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm()  { _nvm_load; nvm  "$@" }
node() { _nvm_load; node "$@" }
npm()  { _nvm_load; npm  "$@" }
npx()  { _nvm_load; npx  "$@" }

# Invoke tab-completion
_complete_invoke() {
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    reply=( $(invoke ${=collection_arg} --complete -- ${words}) )
}
compctl -K _complete_invoke + -f invoke inv

export PATH="$HOME/bin/:$PATH"
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:/$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.local/bin"

# Completions — only regenerate dump once per day
autoload -Uz compinit
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
fpath+=~/.zfunc
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

function gci() {
  local diff=$(git diff --cached)
  [[ -z $diff ]] && { echo "No changes staged — nothing to commit."; return 1 }

  local tpl_path=${GIT_COMMIT_TEMPLATE:-$(git config --path commit.template)}
  local template
  if [[ -n $tpl_path && -f $tpl_path ]]; then
    template=$(<"$tpl_path")
  else
    template=$'# If applied, this commit will...\n\n# Why is this change needed?\nPrior to this change,\n\n# How does it address the issue?\nThis change'
  fi
  local clean_template=${template//$'# '/}

  local prompt
  prompt=$(printf '%s\n\n%s\n\n%s\n' \
    "Write a succinct conventional commit message by using the following template, based on the staged diff. The subject should be < 72 chars. Each line should be less than 90 chars. Do NOT include the diff itself." \
    "$clean_template" \
    "$diff")

  local tmp=$(mktemp -t gci-msg.XXXXXX)
  ollama run llama3 "$prompt" >| "$tmp" || {
    echo "Ollama failed — aborting commit."
    rm -f "$tmp"; return 1
  }

  gcc -e -F "$tmp" "$@"
  rm -f "$tmp"
}

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Prompt
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"
