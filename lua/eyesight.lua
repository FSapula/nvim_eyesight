local augroup = vim.api.nvim_create_augroup("eyesight", { clear = true })

local function remind()
	vim.notify("Look at something 6m away for 20 seconds", "error", {
		title = "Eyesight",
	})
end

Eyesight_Time = 0

local function set_time()
	Eyesight_Time = os.time()
	vim.notify("Starting the eysight timer", "message", {
		title = "Eyesight",
	})
end

local function check_time()
	local currentime = os.time()
	if currentime - Eyesight_Time > 20 * 60 then
		remind()
		Eyesight_Time = currentime
	end
end

local function setup()
	vim.api.nvim_create_autocmd("VimEnter", { group = augroup, callback = set_time, once = true })
	vim.api.nvim_create_autocmd("CursorMoved", { group = augroup, callback = check_time })
end

return { setup = setup }
