------------------------------------------ 时间戳处理 ------------------------------------------

-- 解析当前时间戳
function rz_parse_timestamp()
    local line = vim.api.nvim_get_current_line()
    local timestamp = tonumber(line)
    if timestamp == nil then
        print("# Not Number")
        return
    end

    timestamp = math.floor(timestamp)
    local date_time

    local offset = 8 * 3600

    -- 检测时间戳长度，以确定是秒还是毫秒
    if #line == 13 then -- 毫秒时间戳
        date_time = os.date("!%Y-%m-%d %H:%M:%S", timestamp / 1000 + offset)
    elseif #line == 10 then -- 秒时间戳
        date_time = os.date("!%Y-%m-%d %H:%M:%S", timestamp + offset)
    else
        print("# Invalid timestamp number")
        return
    end

    date_time = '# ' .. date_time

    -- 输出格式化的时间到下一行
    -- vim.api.nvim_win_get_cursor(0) 是 Neovim Lua API 的一个函数，它返回一个包含两个元素的表（table），其中第一个元素是当前窗口光标的行号（基于 1），第二个元素是当前窗口光标的列号（基于 0）
    -- vim.api.nvim_win_get_cursor(0)[1] 中 0 表示当前窗口，[1] 表示我们只取返回表的第一个元素，即光标所在的行号
    -- 由于 Neovim 的 API 行号是基于 1 的，而 vim.api.nvim_buf_set_lines 函数中的行号是基于 0 的，所以在使用这个行号时通常不需要做任何调整
    vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1], vim.api.nvim_win_get_cursor(0)[1], false, {date_time})
end


-- 获取毫秒时间戳（默认 now）
-- 当前行为 yyyy-MM-dd hh:mm:ss 则解析为该时刻时间戳
function rz_get_timestamp()
    local current_line = vim.api.nvim_get_current_line()
    local pattern = "^%d%d%d%d%-%d%d%-%d%d %d%d?:%d%d?:%d%d?$"
    local match = string.match(current_line, pattern)
    local timestamp = ""

    if match then
        -- 将日期字符串转换为时间戳
        local year, month, day, hour, min, sec = current_line:match("^(%d%d%d%d)%-(%d%d?)%-(%d%d?) (%d%d?):(%d%d?):(%d%d?)$")
        local time = os.time({year=tonumber(year), month=tonumber(month), day=tonumber(day), hour=tonumber(hour), min=tonumber(min), sec=tonumber(sec)})
        timestamp = tostring(time) .. "000" -- 假设日期字符串没有毫秒部分
    else
        -- 获取当前的毫秒时间戳
        timestamp = tostring(math.floor(os.time() * 1000 + (os.clock() % 1) * 1000))
    end

    -- 检查当前行是否为空或只包含空格
    if current_line:match("^%s*$") then
        -- 如果是，将当前行清空并输出新的内容
        vim.api.nvim_set_current_line(timestamp)
    else
        -- 如果不是，将新的内容输出到下一行
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.api.nvim_buf_set_lines(0, cursor_pos[1], cursor_pos[1], false, {timestamp})
    end
end
