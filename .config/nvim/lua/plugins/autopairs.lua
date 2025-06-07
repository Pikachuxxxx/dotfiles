return {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup({
            -- enable fast wrap
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        })

        -- Integration with nvim-cmp
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}

