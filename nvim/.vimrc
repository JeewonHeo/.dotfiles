call plug#begin('~/.config/nvim/plugged')

Plug 'sainnhe/sonokai'
Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'slowmoyang/vim-combine'

" Plug 'tpope/vim-fugitive'  " need higher git version
Plug 'jreybert/vimagit'
Plug 'psliwka/vim-smoothie'
" Plug 'jeffreytse/zsh-vi-mode'  " zsh higher than 5.1.0

" Plug 'preservim/tagbar'
" Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set clipboard=unnamedplus
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

set nu
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=4
set colorcolumn=80
set showmatch
set hlsearch
set mouse=

if has('nvim')
	set inccommand=nosplit	" nvim live %s substitute (실시간 강조)
endif

if has("syntax")
    syntax enable
endif

" set t_Co=256
" set background=dark
" colorscheme rigel

" Important!!
if has('termguicolors')
  set termguicolors
endif
  " The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'atlantis'
let g:sonokai_better_performance = 1
colorscheme sonokai

au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "norm g`\"" |
            \ endif

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" nerdtree
" nmap <C-c> :NERDTree<CR><Paste>
nnoremap <silent><C-c> :NERDTreeToggle<CR><bar>:TagbarToggle <CR>
nnoremap <silent><C-h> :bp<CR>
nnoremap <silent><C-l> :bn<CR>

" vim-airline
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1


" python-mode
let g:python3_host_prog = '/usr/bin/python3'
" let g:pymode_lint_ignore=['E501', 'E266', 'E124', 'E0100', 'E701', 'E261', 'C901', 'W']

" White Space Highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" vim-org
let maplocalleader = "\\"

" coc
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

        " disable = { "python" },  -- list of language that will be disabled
" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_install = {"c", "cpp", "python"},
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = { "" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
  },
}
EOF
