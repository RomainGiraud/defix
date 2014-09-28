"" My vimrc !
" déctive la compatibilitévec VI
set nocompatible
 
" déctive les clignotements ou les bips systès
set noerrorbells
 
" active la souris
if has('mouse')
  set mouse=a
endif
 
" active la numétation des lignes
set nu
 
" rée les touches <backspace> et <del>
" valeurs possibles (vous pouvez les combiner avec des virgules) :
"   - indent : permet d'effacer ou non les indentations
"   - eol : permet d'effacer le saut de ligne avec <del>
"   - start : permet d'effacer le saut de ligne avec <backspace>
" raccourcis :
"   - 0 => none
"   - 1 => indent,eol
"   - 2 => indent,eol,start
set bs=2
 
" active l'indentation 'intelligente'
set si
 
" charge les plugins et l'indentation suivant le type du fichier
filetype plugin indent on
 
" active la coloration syntaxique
syntax on
 
" affiche une ligne en bas de l'éan avec diverses informations
" (ligne, colonne, mode, ...)
" peut-êe customiser avec 'set rulerformat=[...]'
set ruler
 
" affiche les commandes incomplès
set showcmd
 
" remplace les tabulations par des espaces
set expandtab
 
" nombre d'espaces pour l'indentation automatique
" et les commandes >> et <<
set shiftwidth=4
 
" nombre d'espaces pour <tab> et <backspace>
set softtabstop=4
 
" nombre d'espaces pour <tab> sans 'expandtab'
" (utile pour les makefiles)
set tabstop=4
 
" recherche en boucle
set wrapscan
 
" commence la recherche tandis que l'on éit le pattern
set incsearch
 
" déctive la coloration de la recherche
set nohlsearch
 
" déctive les backups (fichiers ~)
set nobackup
 
" lorsque la console a un fond noir
"set background=dark
 
 
" Paramèes de tabulation suivant le type du fichier
au FileType html set softtabstop=2
au FileType html set shiftwidth=2
au FileType html set tabstop=2
 
au FileType xml set softtabstop=2
au FileType xml set shiftwidth=2
au FileType xml set tabstop=2
 
au FileType ant set softtabstop=2
au FileType ant set shiftwidth=2
au FileType ant set tabstop=2
 
au FileType php set softtabstop=2
au FileType php set shiftwidth=2
au FileType php set tabstop=2
 
au FileType yaml set softtabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set tabstop=2
 
au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2
au FileType javascript set tabstop=2
 
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set tabstop=2
 
au FileType eruby set softtabstop=2
au FileType eruby set shiftwidth=2
au FileType eruby set tabstop=2
 
" utilise des templates de fichier
"autocmd BufNewFile main.cpp 0r $HOME/.vim/templates/main.cpp.tpl
"autocmd BufNewFile Makefile 0r $HOME/.vim/templates/Makefile.tpl
