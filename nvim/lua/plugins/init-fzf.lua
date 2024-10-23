-- 重置部分Path: /Users/jasonchen/Documents/github/LazyVim/lua/lazyvim/plugins/extras/editor/fzf.lua 中的快捷键
-- 使用<leader>rr用于打开最近文件
-- **注意**： 需要安装fzf工具才可以，brew install fzf

return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader>rr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
	},
}
