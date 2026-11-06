local vector2 = require("#microsoft.xna.framework.vector2")

local camera = {}

---Zooms the camera smoothly to a point
---@param screenX integer The X position to zoom to in screen coordinates.
---@param screenY integer The Y position to zoom to in screen coordinates.
---@param factor integer How far to zoom in as a multiplier to the default zoom level.
---@param time integer The time that it should take to reach the specified zoom level, in seconds.
function camera.zoomTo(screenX, screenY, factor, time)
    local level = getLevel()
    coroutine.yield(level:ZoomTo(vector2(screenX, screenY), factor, time))
end

---Smoothly changes the zoom level and position while already zoomed
---@param screenX integer The X position to move to in screen coordinates.
---@param screenY integer The Y position to move to in screen coordinates.
---@param factor integer How far to zoom in as a multiplier to the default zoom level.
---@param time integer The time that it should take to reach the specified zoom level and position, in seconds.
function camera.zoomChange(screenX, screenY, factor, time)
    local level = getLevel()
    coroutine.yield(level:ZoomAcross(vector2(screenX, screenY), factor, time))
end

---Resets the zoom to the default level
function camera.zoomReset()
    local level = getLevel()
    level:ResetZoom()
end

return camera