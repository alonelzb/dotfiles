return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
        require("indent_blankline").setup({
            space_char_blankline = " ",
            show_first_indent_level = true,
            use_treesitter = true,
            show_current_context = true,
            -- show_current_context_start = true,
        })
    end
}
