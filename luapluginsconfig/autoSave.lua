local autosave = require("auto-save")

autosave.setup{
        enabled = true,
        execution_message = {
            message = function()
                return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
            end,
            dim=0.18,
            cleaning_interval=1250,
        },
        trigger_events = {"InsertLeave", "TextChanged"},
        conditions = function(buf)
		    local fn = vim.fn
		    local utils = require("auto-save.utils.data")

		    if
			    fn.getbufvar(buf, "&modifiable") == 1 and
			    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) and
                utils.not_in(fn.getbufvar(buf, "&filename"), {}) then
			    return true -- met condition(s), can save
		    end
		    return false -- can't save
	    end,
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
