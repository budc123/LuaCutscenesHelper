local vector2 = require("#microsoft.xna.framework.vector2")
local engine = require("#monocle.engine")
local celeste = require("#celeste")
local luaHelper = require("#Celeste.Mod.LuaCutscenes.LuaHelper")

local node = arguments

local level = helpers.getRoom()

function onTalk()
    local target = celeste.CutsceneNode.Find(node).position
    local mapData = engine.Scene.Session.MapData
    local roomName = mapData:getAt(vector2(target.X, target.Y)).Name
    local levelX, levelY = player.Position.X - level.Camera.Position.X, player.Position.Y - level.Camera.Position.Y
    log(tostring(levelY))
    helpers.disableMovement()
    helpers.makeUnskippable()
    celeste.SpotlightWipe.FocusPoint = vector2(levelX, levelY - 8)
    celeste.SpotlightWipe(engine.Scene, false, nil)
    wait(1.8)
    helpers.teleportTo(target.X, target.Y, roomName, "None")
end

function onEnd(room, wasSkipped)
    helpers.enableMovement()
end

