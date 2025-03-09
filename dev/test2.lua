-- @description testing script
-- @reaScript Name TestScript
-- @author mittim88
-- @version 8.0.0
-- @provides 
--   /dev/*.lua
--   /dev/pdf/*.pdf
--   /dev/keyMap/*.ReaperKeyMap
--   /dev/logo/*.png
--   /dev/images/*.png
--   /dev/projectTemplate/*.RPP






function refreshAndBrowseTCHelper()
    reaper.ReaPack_BrowsePackages('updateTest')
    reaper.ReaPack_ProcessQueue(true)

end
refreshAndBrowseTCHelper()
