hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

export git_concise_log_format='--pretty=format:%Cblue%h%d%Creset %ar %Cgreen%an%Creset %s'

git_current_branch() {
  command git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

# add and remove new/deleted files from git index automatically
alias ar="git ls-files -d -m -o -z --exclude-standard | xargs -0 git update-index --add --remove"

alias gb="git branch"
alias gc-undo="git reset --soft HEAD^"

# Checkout master and smart pull
alias master='gco master && gup'

# Clean up repo.
alias git-clean='gco master && gup && git-delete-local-merged'

# Commit message. I.e. cm "derp"`
alias cm='git commit -am'

# Commit. A combination of add and remove all files and commit.
alias c="ar && gc"

git_current_branch() {
  cat "$(git rev-parse --git-dir 2>/dev/null)/HEAD" | sed -e 's/^.*refs\/heads\///'
}
alias gpthis='gp origin $(git_current_branch)'
alias gpthis!='gp --set-upstream origin $(git_current_branch)'

alias a='atom .'
alias ga='git add'
alias gap='ga -p'
alias gau='git add -u'
alias gbr='git branch -v'
alias gc='git commit -v'
alias gca='gc -a'
alias gcam='gca --amend'
alias gcf='git config -l'
alias gch='git cherry-pick'
# alias gcm='gc --amend'
alias gcm='gc -am'
alias gco='git checkout'
alias gcop='gco -p'
alias gd='git diff -M'
alias gd.='git diff -M --color-words="."'
alias gdw='git diff $color_ruby_words'
alias gdc='git diff --cached -M'
alias gdc.='git diff --cached -M --color-words="."'
alias gdcw='git diff --cached $color_ruby_words'
alias gds='gitd --stat'

# Filters down to only conflicting files.
alias gdn='git diff --name-only --diff-filter=U'
alias gf='git fetch'
alias glog='git log $git_concise_log_format'
alias gl='glog --graph'
alias gla='gl --all'
alias gl_absolute='git log --graph --pretty=format:"%Cblue%h%d%Creset %ad %Cgreen%an%Creset %s"'
alias gm='git merge --no-ff'
alias gp='git push'
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias gpb='git push banana'
alias gpd='gp deploy deploy'
alias gpt='gp --tags'
alias gr='git reset'
alias grb='git rebase -p'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grh='git reset --hard'
alias grp='gr --patch'
alias grs='git reset --soft'
alias grsh='git reset --soft HEAD~'
alias grv='git remote -v'
alias gs='git show'
alias gss='gs --stat'
alias gst='git stash'
alias gstp='git stash pop'
alias gstwc='gst save --keep-index'
alias gup='git smart-pull'
alias gab='gm $argv && gbr -d $argv'
alias gmd='gm $argv && gbr -d $argv $argv && glcg'
alias graf='git remote add $argv[1] $argv[2] && gf $argv[1]'
