local function __decrypt(b64_str, key)
    local url = "data:application/octet-stream;base64," .. b64_str
    local decoded = game:HttpGet(url, true)
    local result = ""
    for i = 1, #decoded do
        local byte = string.byte(decoded, i)
        result = result .. string.char(bit32.bxor(byte, key))
    end
    return result
end

print(__decrypt("bWZnYG8=", 46))
