return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',    -- LSP completions
        'hrsh7th/cmp-buffer',      -- Buffer words
        'hrsh7th/cmp-path',        -- File paths
        'hrsh7th/cmp-cmdline',     -- Cmdline completions
        'L3MON4D3/LuaSnip',        -- Snippet engine
        'saadparwaiz1/cmp_luasnip' -- Snippet completions for cmp
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        
        cmp.setup({
            -- Completion sources
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },  -- Language server completions
                { name = 'luasnip' },   -- Snippets
                { name = 'buffer' },    -- Words in the current buffer
                { name = 'path' }       -- Filesystem paths
            }),
            -- Key mappings for completion
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion manually
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                ['<C-e>'] = cmp.mapping.abort(),        -- Abort completion
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            -- Window appearance
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            -- Snippet expansion
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            -- Experimental ghost text
            experimental = {
                ghost_text = false -- Disable ghost text
            }
        })

        -- Cmdline completion setup (for : and /)
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            })
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
    end
}

