-- @description Testing Update function
-- @reaScript Name update Test Script
-- @author mittim88
-- @version 5.0.0
-- @provides 
--      /dev/*.lua
--   /dev/pdf/*.pdf
--   /dev/keyMap/*.ReaperKeyMap
--   /dev/images/*.png
--   /dev/logo/*.png
--   /dev/projectTemplate/*.RPP






function refreshAndBrowseTCHelper()
    reaper.ReaPack_BrowsePackages('updateTest')
    reaper.ReaPack_ProcessQueue(true)

end
refreshAndBrowseTCHelper()
