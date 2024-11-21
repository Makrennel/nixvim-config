{ lib, pkgs, ... }: {

  globals = {
    mapleader = " ";
  };

  opts = {
    # Indentation
    expandtab = true;
    smartindent = true;
    smarttab = true;
    shiftwidth = 2;
    softtabstop = 2;
    tabstop = 2;

    # Numbering
    number = true;
    relativenumber = true;

    fillchars = {
      eob = " ";
    };
    ignorecase = true;
    smartcase = true;
    mouse = "a";

    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
    termguicolors = true;
    timeoutlen = 400;
    undofile = true;
    cursorline = true;
  };

}
