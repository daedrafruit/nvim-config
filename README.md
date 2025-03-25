On initial setup just quit and reopen a couple times, also run :Mason then restart.  
  
Neovim config that fully supports C++ (lsp/autocomplete/debugging) and partially supports C and Python.

For better LSP support make sure your project has a compilecommands.json (C++) or a pyrightconfig.json (Python) at its root.

External Dependencies:  
> ripgrep (for live_grep in telescope) 

Linux:  
> unzip  

C/C++:  
> gcc  

Python:
> Python  
> nodejs (for pyright)

If mason fails to install debugpy:
```  
mkdir /Users/kn/.local/share/nvim/mason/packages/debugpy/venv/ -p  
python -m venv /Users/kn/.local/share/nvim/mason/packages/debugpy/venv  
/Users/kn/.local/share/nvim/mason/packages/debugpy/venv/bin/pip install debugpy  
```

