return {
    {
        "ggandor/leap.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    {
        "ggandor/flit.nvim",
        keys = { "f", "F", "t", "T" },
        dependencies = { "ggandor/leap.nvim" },
        config = function()
            require("flit").setup({
                keys = { f = "f", F = "F", t = "t", T = "T" },
                labeled_modes = "v",
                multiline = true,
                opts = {},
            })
        end,
    },
}
