-- general
vim.g.mapleader = " "

-- coc
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = true
})
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = true
})
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = true
})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {
    silent = true
})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {
    silent = true
})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {
    silent = true
})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {
    silent = true
})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {
    silent = true
})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {
    silent = true
})

-- apply the most preferred quickfix action on the current line
vim.keymap.set("n", "<leader>qf", "<plug>(coc-fix-current)", {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = true
})

-- copilot
vim.keymap.set("i", "<C-g>", 'copilot#Accept("<CR>")', {
    silent = true,
    expr = true,
    script = true,
    replace_keycodes = true
})

-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'f', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true
    })
end, {
    remap = true
})
vim.keymap.set('', 'F', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true
    })
end, {
    remap = true
})
vim.keymap.set('', 't', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1
    })
end, {
    remap = true
})
vim.keymap.set('', 'T', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1
    })
end, {
    remap = true
})

-- neo-tree
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')

-- toggleterm
-- for lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double"
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
            noremap = true,
            silent = true
        })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end
})

function _Lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", {
    noremap = true,
    silent = true
})
