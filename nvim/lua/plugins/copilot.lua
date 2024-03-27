return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    copilot_node_command = 'node',
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
            }
        })

        vim.api.nvim_command("highlight link CopilotAnnotation LineNr")
        vim.api.nvim_command("highlight link CopilotSuggestion LineNr")
    end,
}