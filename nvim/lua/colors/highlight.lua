vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.schedule(function()
			local path = vim.fn.expand("%:.")
			local icon = ""
			local msg = string.format(" %s  file written: ./%s", icon, path)

			-- Alternatively, if you prefer to keep using nvim_echo:
			vim.api.nvim_echo({ { msg, "Directory" } }, true, {}) -- Note the 'true' for history
		end)
	end,
})
--highlight when yanking

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 180 })
	end,
})

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#FF4500" })
--jumps to previous position of file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local last_pos = vim.fn.line([['"]])
		if last_pos > 0 and last_pos <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
})

--cursor line
vim.o.cursorline = true
--   vim.cmd("highlight CursorLine guibg=#1a1a1a")
vim.api.nvim_create_autocmd("CompleteChanged", {
	callback = function()
		local cmp = require("cmp")
		if cmp.visible() and cmp.get_selected_entry() == nil then
			cmp.select_next_item()
		end
	end,
})


-- Custom highlight for Winbar
vim.api.nvim_set_hl(0, "WinBar", {
	fg = "#4fc3f7",
	bg = "#0a0a0a",
	bold = true,
})
-- Current window
vim.api.nvim_set_hl(0, "WinBarNC", {
	fg = "#4fc3f7",
	bg = "#0a0a0a",
})

-- highlight for visual highlights (v /V/ctrl ov)

-- vim.api.nvim_set_hl(0, "Visual", {
--
-- 	bold = true, -- make text bold
-- })
