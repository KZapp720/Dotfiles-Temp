alias cat="bat"
alias cdi="zi && eza --group-directories-first --sort extension"
alias gtc="cd $CLOUD"
alias gti="zi && clear && eza --group-directories-first --sort extension && fzf --height 20 --border | xargs $EDITOR"
alias lg="lazygit"
alias ls="eza --group-directories-first --sort extension"
alias lf="eza --tree --group-directories-first --sort extension --level=1"
alias ls1="eza --tree --group-directories-first --sort extension --level=1"
alias ls2="eza --tree --group-directories-first --sort extension --level=2"
alias ls3="eza --tree --group-directories-first --sort extension --level=3"
alias ls4="eza --tree --group-directories-first --sort extension --level=4"
alias ls5="eza --tree --group-directories-first --sort extension --level=5"
alias ls6="eza --tree --group-directories-first --sort extension --level=6"
alias ls7="eza --tree --group-directories-first --sort extension --level=7"
alias ls8="eza --tree --group-directories-first --sort extension --level=8"
alias ls9="eza --tree --group-directories-first --sort extension --level=9"
alias pip="pip3"
alias py="python3"
alias python="python3"
alias tcb="pbcopy"
alias vi="hx ."
alias vim="hx"


function cd() {
  z "$@" && command eza --group-directories-first --all --sort extension
}


function gt() {
    z "$@" && clear && command eza --group-directories-first --all --sort extension && fzf --height 20 --border | xargs -r $EDITOR
}


function mkdir() {
  if [ $# -eq 0 ]; then
    echo "Usage: mkdir <directory-name> [project-type]"
    return 1
  fi

  command mkdir -p "$1"

  if [ $# -ge 2 ]; then
    cd "$1" || return 1

    case "$2" in
      "git")
        git init
        touch .gitignore
        git add .gitignore
        git commit -m "Initial commit"
        ;;

      "markdown")
        mkdir assets
        touch main.md  && echo "# Hello World!\n" > main.md
        touch Makefile && echo -e 'run:\n\tfind  . -maxdepth 1 -name *.md | head -n 1 | xargs open              && \\\n\tsleep 0.5 && osascript -e "tell application \\"WezTerm\\" to activate" && \\\n\tfind  . -maxdepth 1 -name *.md | head -n 1 | xargs hx\n' > Makefile
        git init       && git  add . && git commit -m "Initialized markdown project"
        clear          && ls
        ;;

      "typst")
        mkdir assets         && mkdir templates
        touch main.typ       && echo  '// #import "templates/": \n' > main.typ
        find ~/Documents/Typst\ Templates -maxdepth 1 -name "*.typ" | fzf --border --multi --height=50% --style=full | xargs -I{} cp {} templates/
        touch Makefile       && echo -e 'run:\n\twezterm cli spawn --cwd . -- zsh -lc '\''temp=$(find . -maxdepth 1 -name "*.typ" | head -n 1) && echo "$temp" | entr sh -c "typst compile \\"$temp\\" && open \\"${temp%.typ}.pdf\\" && osascript -e \\"tell application \\\\\\"WezTerm\\\\\\" to activate\\""\''\n' > Makefile
        git init             && git   add . && git commit -m "Initialized typst project"
        clear                && ls
        ;;

      "cpp")
        echo tbi
        ;;

      "python")
        mkdir assets    && mkdir modules && mkdir tests
        touch main.py   && echo 'def main() -> None:\n    print("Hello World!")\n\n\nif __name__ == "__main__":\n    main()\n' > main.py
        touch test.py   && echo 'def test() -> None:\n    print("Test Needed!")\n\n\nif __name__ == "__main__":\n    test()\n' > test.py
        touch README.md && echo '# Documentation\n' > README.md
        touch Makefile  && echo  -e 'run:\n\tpython3 main.py\ntest:\n\tpython3 test.py\n' >  Makefile
        git   init      && git   add .   && git commit -m "Initialized python project"
        clear           && ls
        ;;

      "rust")
        cargo init
        touch README.md
        git   add .     && git commit -m "Initialized cargo project"
        clear           && ls
        ;;

      "haskell")
        cabal init        --non-interactive --package-name=$1 --exe
        touch app/Main.hs && echo 'module Main where\n\n\nmain :: IO()\nmain = putStrLn "Hello World!"\n' > app/Main.hs
        touch README.md   && echo '# Documentation\n' > README.md
        git   init        && git add . && git commit -m "Initialized cabal project"
        clear             && ls
        ;;

      "javascript")
        echo tbi
        ;;

      "react")
        echo tbi
        ;;
    esac
  fi
}


eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


source ~/.zprofile

