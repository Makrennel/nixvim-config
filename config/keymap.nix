{ lib, pkgs, ... }: {
  keymaps = [
    # General
    {
      action = "<cmd> w <CR>";
      key = "<C-s>";
      mode = "n";
    }
    {
      action = "<ESC>";
      key = "<jk>";
      mode = "i";
    }
    {
      action = "<cmd> %y+ <CR>";
      key = "<C-c>";
      mode = "n";
    }

    # NvimTree
    {
      action = "<cmd> NvimTreeToggle <CR>";
      key = "<C-n>";
      mode = "n";
    }
    {
      action = "<cmd> NvimTreeFocus <CR>";
      key = "<C-h>";
      mode = "n";
    }

    # Telescope
    {
      action = "<cmd> Telescope find_files <CR>";
      key = "<leader>ff";
      mode = "n";
    }
    {
      action = "<cmd> Telescope oldfiles <CR>";
      key = "<leader>fo";
      mode = "n";
    }
    {
      action = "<cmd> Telescope live_grep <CR>";
      key = "<leader>fw";
      mode = "n";
    }
    {
      action = "<cmd> Telescope git_status <CR>";
      key = "<gt>";
      mode = "n";
    }

    # Bufferline, cycle buffers
    {
      action = "<cmd> BufferLineCycleNext <CR>";
      key = "<Tab>";
      mode = "n";
    }
    {
      action = "<cmd> BufferLineCyclePrev <CR>";
      key = "<S-Tab>";
      mode = "n";
    }
    {
      action = "<cmd> bd <CR>";
      key = "<C-q>";
      mode = "n";
    }

    # comment.nvim
    {
      action = "gcc";
      key = "<leader>/";
      mode = "n";
      options.noremap = true;
    }
    {
      action = "gc";
      key = "<leader>/";
      mode = "v";
      options.noremap = true;
    }

    # Format
    {
      action = "function() require(\"conform\").format() end";
      key = "<leader>fm";
      mode = "n";
    }
  ];
}
