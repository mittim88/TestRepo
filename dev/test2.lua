-- @description testing script
-- @reaScript Name TestScript
-- @author mittim88
-- @version 1.0.0
-- @provides 
--   /dev/*.lua
--   /dev/pdf/*.pdf
--   /dev/keyMap/*.ReaperKeyMap
--   /dev/logo/*.png
--   /dev/images/*.png
--   /dev/projectTemplate/*.RPP



function isCurrentScriptInstalledViaReaPack()
    local script_path = ({reaper.get_action_context()})[2]

    local owner = reaper.ReaPack_GetOwner(script_path)
    if owner then
        reaper.ShowConsoleMsg('Script is installed via ReaPack\n')
        return true

    else
        reaper.ShowConsoleMsg('Script is not installed via ReaPack\n')
        return false
    end
end



function refreshAndBrowseTCHelper()
    reaper.ReaPack_BrowsePackages('updateTest')
    reaper.ReaPack_ProcessQueue(true)

end
isCurrentScriptInstalledViaReaPack()
--refreshAndBrowseTCHelper()
