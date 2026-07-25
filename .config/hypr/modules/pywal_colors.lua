local function get_pywal_colors()
    local colors = {}
    local filepath = os.getenv("HOME") .. "/.cache/wal/colors"
    local file = io.open(filepath, "r")

    if file then
        for line in file:lines() do
            local hex = line:gsub("#", "")
            table.insert(colors, "rgba(" .. hex .. "ff)")
        end
        file:close()
    end
    return colors
end

local pywal = get_pywal_colors()

local debug_file = io.open("/tmp/pywal_debug.txt", "w")
if debug_file then
    debug_file:write("Color 1: " .. tostring(pywal[2]) .. "\n")
    debug_file:write("Color 2: " .. tostring(pywal[6]) .. "\n")
    debug_file:write("Inactive: " .. tostring(pywal[9]) .. "\n")
    debug_file:close()
end

return {
    active_col_1 = pywal[2] or "rgba(33ccffff)",
    active_col_2 = pywal[6] or "rgba(00ff99ff)",
    inactive_col = pywal[9] or "rgba(595959aa)"
}
