if status is-interactive
    set -g fish_greeting
    type -q starship; and starship init fish | source

    # ── Palette ─────────────────────────────────────
    set -l fg      f2f4f8
    set -l comment 525252
    set -l sage    9db89a
    set -l sage_hi b5cdb2
    set -l blue    78a9ff
    set -l pink    ee5396
    set -l purple  be95ff
    set -l cyan    08bdba
    set -l yellow  ffe97b
    set -l sel     3b4a3a

    # ── Syntax highlighting ─────────────────────────
    set -g fish_color_normal         $fg
    set -g fish_color_command        $sage
    set -g fish_color_keyword        $purple
    set -g fish_color_quote          $yellow
    set -g fish_color_redirection    $blue
    set -g fish_color_end            $purple
    set -g fish_color_error          $pink
    set -g fish_color_param          $fg
    set -g fish_color_option         $cyan
    set -g fish_color_comment        $comment
    set -g fish_color_operator       $blue
    set -g fish_color_escape         $cyan
    set -g fish_color_autosuggestion $comment
    set -g fish_color_valid_path     --underline
    set -g fish_color_selection      --background=$sel
    set -g fish_color_search_match   --background=$sel
    set -g fish_color_cancel         $pink
    set -g fish_color_cwd            $sage
    set -g fish_color_user           $sage
    set -g fish_color_host           $blue
    set -g fish_color_host_remote    $yellow
    set -g fish_color_status         $pink

    # ── Completion pager ────────────────────────────
    set -g fish_pager_color_progress               $comment
    set -g fish_pager_color_prefix                 $sage --bold
    set -g fish_pager_color_completion             $fg
    set -g fish_pager_color_description            $comment
    set -g fish_pager_color_selected_background    --background=$sel
    set -g fish_pager_color_selected_prefix        $sage_hi --bold
    set -g fish_pager_color_selected_completion    $fg
    set -g fish_pager_color_selected_description   $comment

    # ── Git prompt styling ──────────────────────────
    set -g __fish_git_prompt_showdirtystate yes
    set -g __fish_git_prompt_showuntrackedfiles yes
    set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_color_branch $purple
    set -g __fish_git_prompt_color_dirtystate $yellow
    set -g __fish_git_prompt_color_stagedstate $sage
    set -g __fish_git_prompt_color_untrackedfiles $pink
    set -g __fish_git_prompt_color_upstream $blue
    set -g __fish_git_prompt_char_dirtystate '●'
    set -g __fish_git_prompt_char_stagedstate '✚'
    set -g __fish_git_prompt_char_untrackedfiles '…'
    set -g __fish_git_prompt_char_upstream_ahead '↑'
    set -g __fish_git_prompt_char_upstream_behind '↓'

    # ── Environment ─────────────────────────────────
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    fish_add_path -m ~/.local/bin

    # ── Abbreviations ───────────────────────────────
    abbr -a g git
    abbr -a ga 'git add'
    abbr -a gc 'git commit'
    abbr -a gp 'git push'
    abbr -a gl 'git pull'
    abbr -a gs 'git status -sb'
    abbr -a gd 'git diff'
    abbr -a gco 'git checkout'
    abbr -a gb 'git branch'
    abbr -a glg 'git log --oneline --graph --decorate'
    abbr -a v nvim
    abbr -a .. 'cd ..'
    abbr -a ... 'cd ../..'

    # ── Aliases (only if the tool exists) ───────────
    if type -q eza
        alias ls 'eza --icons --group-directories-first'
        alias ll 'eza -l --icons --git --group-directories-first'
        alias la 'eza -la --icons --git --group-directories-first'
        alias lt 'eza --tree --level=2 --icons'
    end
    if type -q bat
        alias cat 'bat --paging=never'
    end

    set -gx FZF_DEFAULT_OPTS "\
    --height=40% --layout=reverse --border=rounded \
    --color=bg+:#3b4a3a,bg:-1,fg:#dde1e6,fg+:#f2f4f8 \
    --color=hl:#9db89a,hl+:#b5cdb2,pointer:#9db89a,prompt:#9db89a \
    --color=info:#525252,border:#393939,header:#78a9ff,spinner:#be95ff,marker:#ee5396"

    if type -q fd
        set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
        set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    end

    type -q fzf;    and fzf --fish | source
    type -q zoxide; and zoxide init fish | source
end
