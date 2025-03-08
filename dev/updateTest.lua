-- @description Testing Update function
-- @reaScript Name update Test Script
-- @author mittim88
-- @version 4.0.0
-- @provides 
--      /dev/*.lua
--   /TC_Helper/data/pdf/*.pdf
--   /TC_Helper/data/keyMap/*.ReaperKeyMap
--   /TC_Helper/data/images/*.png
--   /TC_Helper/data/logo/*.png
--   /TC_Helper/data/projectTemplate/*.RPP






function refreshAndBrowseTCHelper()
    reaper.ReaPack_BrowsePackages('updateTest')
    reaper.ReaPack_ProcessQueue(true)

end
refreshAndBrowseTCHelper()
