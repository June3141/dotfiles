-- status line

-- full width
vim.o.laststatus = 3

-- ref: https://zenn.dev/glaucus03/articles/ff710d27de4e55
local function selectionCount()
    local mode = vim.fn.mode()
    local start_line, end_line, start_pos, end_pos

    -- 選択モードでない場合には無効
    if not (mode:find("[vV\22]") ~= nil) then return "" end
    start_line = vim.fn.line("v")
    end_line = vim.fn.line(".")

    if mode == 'V' then
        -- 行選択モードの場合は、各行全体をカウントする
        start_pos = 1
        end_pos = vim.fn.strlen(vim.fn.getline(end_line)) + 1
    else
        start_pos = vim.fn.col("v")
        end_pos = vim.fn.col(".")
    end

    local chars = 0
    for i = start_line, end_line do
        local line = vim.fn.getline(i)
        local line_len = vim.fn.strlen(line)
        local s_pos = (i == start_line) and start_pos or 1
        local e_pos = (i == end_line) and end_pos or line_len + 1
        chars = chars + vim.fn.strchars(line:sub(s_pos, e_pos - 1))
    end

    local lines = math.abs(end_line - start_line) + 1
    return tostring(lines) .. " lines, " .. tostring(chars) .. " characters"
end

return   {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'stevearc/aerial.nvim',
    },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                disabled_filetypes = {},
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        file_status = true,
                        shorting_target = 40,
                        symbols = {
                            modified = ' [+]',
                            readonly = ' [RO]',
                            unnamed = 'Untitled',
                        }
                    },
                    -- with aerial.nvim
                    
                        "aerial",
                    
                },
                lualine_x = {
                    { 'searchcount' },
                    { selectionCount },
                    {
                        'diagnostics',
                        sources = {
                            -- 'nvim_diagnostic',
                            'nvim_lsp',
                        },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        diagnostics_color = {
                            error = 'DiagnosticError',
                            warn  = 'DiagnosticWarn',
                            info  = 'DiagnosticInfo',
                            hint  = 'DiagnosticHint',
                        },
                        symbols = {
                            error = 'E',
                            warn = 'W',
                            info = 'I',
                            hint = 'H'
                        },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    },
                    "require'lsp-status'.status()"
                },
                lualine_y = {
                    'filetype',
                    'encoding'
                },
                lualine_z = {
                    'location',
                    'progress'
                }
            },
        })
    end
}