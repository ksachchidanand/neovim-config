local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')

-- packer.init({
--     git = {
--         cmd = 'git',
--         subcommands = {
--             update         = 'pull --ff --progress',
--             install        = 'clone --depth %i --progress',
--             fetch          = 'fetch --progress',
--             checkout       = 'checkout %s --',
--             update_branch  = 'merge --ff @{u}',
--             current_branch = 'branch',
--             diff           = 'log --color=never --pretty=format:FMT HEAD@{1}...HEAD',
--             diff_fmt       = '%%h %%s (%%cr)',
--             get_rev        = 'rev-parse --short HEAD',
--             get_msg        = 'log --color=never --pretty=format:FMT HEAD -n 1',
--             submodules     = 'submodule update --init --recursive'
--         },
--     },
-- })

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here

    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'echasnovski/mini.comment', branch = 'stable' }
    use { 'echasnovski/mini.pairs', branch = 'stable' }
    use { 'echasnovski/mini.indentscope', branch = 'stable' }
    use { 'echasnovski/mini.align', branch = 'stable' }
    use { 'folke/noice.nvim' }
    use { 'MunifTanjim/nui.nvim' }
    use { 'akinsho/toggleterm.nvim', tag = '*', config = true }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
