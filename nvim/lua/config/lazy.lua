-- Bootstrap lazy.nvim
-- 将lazy.vim下载到数据目录下~/.local/share/nvim
-- vim.fn.stdpath获取参数中的标准路径，比如配置路径、数据路径等
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
-- 将lazypath添加到runtimepath的前面，用于优先加载插件
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
-- 基本参考lazyvim中starter参考的内容：https://github.com/LazyVim/starter/blob/main/lua/config/lazy.lua
require("lazy").setup({
	spec = {
		-- 从本地引入lazyvim，这个lazyvim单独从github下载
		{ dir = "~/Documents/github/LazyVim", import = "lazyvim/plugins" },
		-- import your plugins
		-- 将lua/plugins目录作用自定义配置的路径
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "tokyonight", "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
