" Settings for coc-python / python-syntax / pyenv
"  python format settings found in ../after/ftplugin
" let g:python_highlight_all = 1
" let g:python_highlight_builtin_types = 1



"  ### TODO move pyenv variables to another file?
"  ## These are variables for pyenv not coc-python
" ##### THIS MIGHT NEED TO BE CHANGED IF PYENV IS NOT INSTALLED/CONFIGURED PROPERLY ####
" default set from pyenv (if no manual venv activated)
"let g:python_host_prog = "/home/veyga/.pyenv/shims/python2"
"let g:python3_host_prog = "/home/veyga/.pyenv/shims/python"

" let g:python_host_prog = "/Users/andrew.stefanich/.pyenv/shims/python2"
let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/Users/andrew.stefanich/.pyenv/shims/python"
" let g:python3_host_prog = "/Users/andrew.stefanich/Library/Caches/pypoetry/virtualenvs/buoy-api-jx3G90qZ-py3.6/bin/python"


"let g:python_host_prog="/usr/bin/python"
"let g:python3_host_prog="/usr/local/bin/python3"
"
"au FileType python let b:coc_root_patterns = ['pyrightconfig.json']
