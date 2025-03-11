-- @description testing script
-- @reaScript Name TestScript
-- @author mittim88
-- @version 2.1.0
-- @provides 
--   /dev/*.lua
--   /dev/pdf/*.pdf
--   /dev/keyMap/*.ReaperKeyMap
--   /dev/logo/*.png
--   /dev/images/*.png
--   /dev/projectTemplate/*.RPP

-- LuaSocket HTTP implementation
local socket = {}
socket.http = {}
socket.http.request = function(params)
    local url = params.url
    local sink = params.sink

    local handle = io.popen("curl -s -L " .. url)
    local result = handle:read("*a")
    handle:close()

    sink(result)
    return 1, 200
end

-- Simplified xml2lua implementation
local xml2lua = {}
xml2lua.parser = function(handler)
    return {
        parse = function(self, xmlContent)
            handler.root = {}
            for version in xmlContent:gmatch('<version name="(.-)"') do
                table.insert(handler.root, version)
            end
        end
    }
end

local handler = {}

local function getVersions(url)
    local response = {}
    local _, code = socket.http.request{
        url = url,
        sink = function(chunk)
            table.insert(response, chunk)
        end
    }

    if code ~= 200 then
        reaper.ShowMessageBox("Fehler beim Abrufen der XML-Datei: " .. code, "Fehler", 0)
        return nil
    end

    local xmlContent = table.concat(response)
    local parser = xml2lua.parser(handler)
    parser:parse(xmlContent)

    return handler.root, xmlContent
end

local page = "https://raw.githubusercontent.com/mittim88/TestRepo/refs/heads/main/index.xml"
local versions, xmlContent = getVersions(page)
if versions then
    local versionList = table.concat(versions, "\n")
    reaper.ShowMessageBox("Gefundene Versionen:\n" .. versionList, "Info", 0)
    reaper.ShowConsoleMsg("XML-Inhalt:\n" .. xmlContent)
else
    reaper.ShowMessageBox("Keine Version gefunden.", "Info", 0)
end