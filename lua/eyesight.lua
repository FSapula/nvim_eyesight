local augroup = vim.api.nvim_create_augroup("eyesight", { clear = true })

local function remind()
	require("notify")("Loook at something 6m away for 20 seconds")
end

local time = 0

local function set_time()
	time = os.time()
end

local function setup()
	vim.api.nvim_create_autocmd("VimEnter", { augroup = augroup, callback = set_time, once = true })
end

return { setup = setup }
