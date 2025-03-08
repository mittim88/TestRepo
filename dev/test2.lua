-- @description testing script
-- @reaScript Name TestScript
-- @author mittim88
-- @version 7.0.0
-- @provides 
--      /dev/*.lua
--   /dev/*.pdf
--   /dev/*.ReaperKeyMap
--   /dev/*.png
--   /dev/*.png
--   /dev/*.RPP






function refreshAndBrowseTCHelper()
    reaper.ReaPack_BrowsePackages('updateTest')
    reaper.ReaPack_ProcessQueue(true)

end
refreshAndBrowseTCHelper()
