# NVIM Development Setup
This is NVIM and Wezterm setup for my development workflow

## Features
1. Theme - [Cyberdream](https://github.com/scottmckendry/cyberdream.nvim/)
2. Auto save - [Auto Save](https://github.com/pocco81/auto-save.nvim) 
3. Dashboard - [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
4. LSPs for JavaScript and Python - [Mason](https://github.com/williamboman/mason.nvim), [MasonLSPConfig](https://github.com/williamboman/mason-lspconfig.nvim) 
5. Code Suggestions and Snippets - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  
6. Linting and Formatting - [none-ls](https://github.com/nvimtools/none-ls.nvim/)
6. Directory Setup - [Neo Tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
7. Fuzzy Finder - [Telescope](https://github.com/nvim-telescope/telescope.nvim), [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 
8. Markdown Preview - [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
9. Git Setup - [Gitsigns](https://github.com/lewis6991/gitsigns.nvim), [Fugitive](https://github.com/tpope/vim-fugitive)
10. NVIM status line - [lualine](https://github.com/nvim-lualine/lualine.nvim)

## Terminal Setup
1. Wezterm Terminal Emulator - [wezterm](https://wezfurlong.org/wezterm/index.html)
2. Fuzzy Finder - [fzf](https://github.com/junegunn/fzf)
3. File previews - [bat](https://github.com/sharkdp/bat)
4. Command line tools help - [tldr](https://github.com/tldr-pages/tldr) 
5. `ls` alias - [eza](https://github.com/eza-community/eza/)

### Bash File Modifications
```
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else batcat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview '--preview "eza --tree --color=always {} | head -200"'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
alias ls="eza --color=always --icons=always --long --no-filesize --no-time --no-user --git --no-permissions"
```
