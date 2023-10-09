local M = {}

M.general = {
    n = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
        ["<C-l>"] = { "<cmd> TmuxNavigateLeft<CR>", "window right"},
        ["<C-j>"] = { "<cmd> TmuxNavigateLeft<CR>", "window down"},
        ["<C-k>"] = { "<cmd> TmuxNavigateLeft<CR>", "window up"},

    }
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
        "<cmd> DapToggleBreakpoint <CR>",
        "Add breakpoint at line"
        },
        ["<leader>dus"] = {
            function ()
            local widgets = require("dap.ui.widgets");
            local sidebar = widgets.sidebar(widgets.scopes);
            sidebar.open();
        end,
        "Open debugging sidebar"
    }
  }
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
            require("dap-go").debug_test()
        end,
        "Debug go test"
        },
        ["<leader>dgl"] = {
        function ()
        require("dap-go").debug_last()
        end,
    }
  }
}

M.gopher = {
    plugin = true,
    n = {
        ["<leader>gsj"] = {
            "<cmd> GoTagAdd json <CR>",
            "Add json struct tags"
        },
        ["<leader>gsy"] = {
            "<cmd> GoTagAdd yaml <CR>",
            "Add yaml struct tags"
        }
    }
}

return M
