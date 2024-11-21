{ lib, pkgs, ... }: {
  plugins = {

    bufferline.enable = true;
    bufferline.settings.options = {
      themeable = true;
      offsets = [
        {
          filetype = "NvimTree";
          highlight = "NvimTreeNormal";
        }
      ];
    };

    cmp.enable = true;
    cmp.settings.mapping = {
      "<C-b>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.abort()";
      "<CR>" = "cmp.mapping.confirm { select = true }";

      # Luasnip
      "<Tab>" = ''
        cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        })
      '';
      "<S-Tab>" = ''
        cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        })
      '';
    };
    cmp.settings.sources = [
      { name = "nvim_lsp"; }
      { name = "luasnip"; }
      { name = "buffer"; }
      { name = "nvim_lua"; }
      { name = "path"; }
    ];

    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-path.enable = true;

    conform-nvim.enable = true;
    conform-nvim.settings.formatters_by_ft = {
      lua = [ "stylua" ];
      javascript = {
        __unkeyed-1 = "prettier";
      };
    };

    gitsigns.enable = true;

    indent-blankline.enable = true;
    indent-blankline.settings.indent.char = "|";
    indent-blankline.settings.scope = {
      char = "|";
      highlight = "Comment";
    };

    lsp = import ./lsp.nix;
    #lsp = {
    #  enable = true;
    #  servers = {
    #    clangd.enable = true;
    #    cssls.enable = true;
    #    html.enable = true;
    #    lua_ls.enable = true;
    #    ts_ls.enable = true;
    #  };
    #};

    mini.enable = true;
    mini.modules = {
      statusline = {
        set_vim_settings = false;
      };
      starter = {
        content_hooks = {
          "__unkeyed-1.adding_bullet" = {
            __raw = "require('mini.starter').gen_hook.adding_bullet()";
          };
          "__unkeyed-2.indexing" = {
            __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
          };
          "__unkeyed-3.padding" = {
            __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
          };
        };
        evaluate_single = true;
        header = ''
          ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
          ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
          ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
          ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
          ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
        '';
        items = {
          "__unkeyed-1.buildtin_actions" = {
            __raw = "require('mini.starter').sections.builtin_actions()";
          };
          "__unkeyed-2.recent_files_current_directory" = {
            __raw = "require('mini.starter').sections.recent_files(10, false)";
          };
          "__unkeyed-3.recent_files" = {
            __raw = "require('mini.starter').sections.recent_files(10, true)";
          };
          "__unkeyed-4.sessions" = {
            __raw = "require('mini.starter').sections.sessions(5, true)";
          };
        };
      };
    };

    #nightfox.enable = true;

    nvim-autopairs.enable = true;

    nvim-tree.enable = true;

    telescope.enable = true;
    telescope.settings.defaults = {
      sorting_strategy = "ascending";
      layout_config.horizontal.prompt_position = "top";
    };

    treesitter.enable = true;
    treesitter.settings = {
      ensure_installed = [
        "lua"
        "vim"
        "vimdoc"
        "html"
        "css"
        "typescript"
        "javascript"
      ];
      highlight = {
        enable = true;
        use_languagetree = true;
      };
      indent.enable = true;
    };

    web-devicons.enable = true;

  };
}
