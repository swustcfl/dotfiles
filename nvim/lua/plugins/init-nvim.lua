-- 用于配置nvim本身相关，而非插件

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

--用于切换buffer的文件读写模式
-- 它避免了模式切换，提高了执行效率，并且使映射更加清晰和易读。在配置 Neovim 键映射时，推荐使用 <cmd> 来替代传统的 : 命令模式。
-- vim.keymap.set({ "n", "v" }, "<leader>ro", ":set readonly<CR>", { noremap = true, silent = true })
vim.keymap.set(
	{ "n", "v" },
	"<leader>ro",
	"<cmd>set readonly<CR>",
	{ noremap = true, silent = true, desc = "file readonly" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>rw",
	"<cmd>set noreadonly<CR>",
	{ noremap = true, silent = true, desc = "file writeable" }
)

-- 文件相关操作
-- 打开最近文件
--[[
vim.keymap.set(
	{ "n", "v" },
	"<leader>rr",
	"<cmd>FzfLua oldfiles<CR>",
	{ noremap = true, silent = true, desc = "find recent files" }
)
--]]
-- 为了符合lazy要求，需要返回
if true then
	return {}
end
