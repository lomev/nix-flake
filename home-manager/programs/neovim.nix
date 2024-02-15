{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ goyo-vim ctrlp-vim syntastic nerdtree vimwiki vimagit vim-surround gruvbox vim-airline ];
    extraConfig = ''
      set nocompatible
      syntax on
      filetype plugin on
      filetype indent on
      
      set wildmode=longest,list,full

      set title
      set nobackup
      set number
      set incsearch
      
      set shiftwidth=4
      set tabstop=4
      set expandtab
      set autoindent

      " minimal colemak changes from hjkl to hnei

      imap <c-n> <cr>
      cmap <c-n> <cr>
      inoremap <c-j> <c-n>
      cnoremap <c-j> <c-n>

      map n <down>
      map e <up>
      map i <right>

      noremap n j
      noremap N J
      noremap k n
      noremap K K
      noremap e k
      noremap E K
      noremap j e
      noremap J E
      noremap i l
      noremap I L
      noremap l u
      noremap L U
      noremap u i
      noremap U I
      
      " window movement
      nnoremap <c-w>n <c-w>j
      nnoremap <c-w>i <c-w>l
      nnoremap <c-w>e <c-w>k

      " Basic colemak shortcuts
      map <C-n> <C-w>n
      map <C-e> <C-W>e
      map <C-i> <C-W>i
      map <C-o> <C-W>o
      map <C-g> :Goyo<CR>
      map <C-q> :qa<CR>
      map <C-s> :wa<CR>

      nnoremap <c-w>k <c-w>n
      nnoremap <c-w>l <c-w>i

      let g:NERDTreeMapOpenExpl = "j"
    '';
  };
}
