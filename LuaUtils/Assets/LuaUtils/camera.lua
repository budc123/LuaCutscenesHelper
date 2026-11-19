local vector2 = require("#microsoft.xna.framework.vector2")
local engine = require("#monocle.engine")
local celeste = require("#celeste")
local lua_helper = require("#Celeste.Mod.LuaCutscenes.LuaHelper")

local level = helpers.getRoom()

local camera = {}

---Zooms the camera smoothly to a point
---@param screenX integer The X position to zoom to in screen coordinates.
---@param screenY integer The Y position to zoom to in screen coordinates.
---@param factor integer How far to zoom in as a multiplier to the default zoom level.
---@param time integer The time that it should take to reach the specified zoom level, in seconds.
function camera.zoomTo(screenX, screenY, factor, time)
    coroutine.yield(level:ZoomTo(vector2(screenX, screenY), factor, time))
end

---Smoothly changes the zoom level and position while already zoomed
---@param screenX integer The X position to move to in screen coordinates.
---@param screenY integer The Y position to move to in screen coordinates.
---@param factor integer How far to zoom in as a multiplier to the default zoom level.
---@param time integer The time that it should take to reach the specified zoom level and position, in seconds.
function camera.zoomChange(screenX, screenY, factor, time)
    coroutine.yield(level:ZoomAcross(vector2(screenX, screenY), factor, time))
end

--Returns the zoom to default over a set time
---@param time integer The time that it should take to return the zoom
function camera.zoomReturn(time)
    coroutine.yield(level:ZoomBack(time))
end

---Snaps the zoom to the default level
function camera.zoomReset()
    level:ResetZoom()
end

return camera