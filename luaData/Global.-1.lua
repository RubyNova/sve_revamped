--[[ Lua code. See documentation: https://api.tabletopsimulator.com/ --]]

--[[ The onLoad event is called after the game save finishes loading. --]]
function onLoad()
    --Tables.setTable("Table_Custom")
    Tables.getTableObject().scale({0.7, 1, 1.24})
end

--[[ The onUpdate event is called once per frame. --]]
function onUpdate()
    --[[ print('onUpdate loop!') --]]
end

function onPlayerConnect(player)
    player.promote()
end

function onPlayerTurn(player, previous_player)

    if player == nil then
        print("Player is nil! Please reset turn functionality.")
        Turns.enable = false
        return
    end

    local red_player_current = "7f0840"
    local red_player_max = "b3a2f1"
    local blue_player_current = "bba386"
    local blue_player_max = "4e6229"

    if player.color == "Red" then
        local current_object = getObjectFromGUID(red_player_current)
        local max_object = getObjectFromGUID(red_player_max)
        local new_max = max_object.getVar("currentMax") + 1
        current_object.setVar("currentAvailable", new_max)
        current_object.call("on_turn_start", {})
        max_object.setVar("currentMax", new_max)
        max_object.call("on_turn_start", {})
        getObjectFromGUID("c51012").call("on_turn_start", {})
    elseif player.color == "Blue" then
        local current_object = getObjectFromGUID(blue_player_current)
        local max_object = getObjectFromGUID(blue_player_max)
        local new_max = max_object.getVar("currentMax") + 1
        current_object.setVar("currentAvailable", new_max)
        current_object.call("on_turn_start", {})
        max_object.setVar("currentMax", new_max)
        max_object.call("on_turn_start", {})
        getObjectFromGUID("31e453").call("on_turn_start", {})
    end
end

function onPlayerChangeColor(player_color)
    if player_color == "Grey" or player_color == "Black" then
        return
    end

    if Turns.enable == false then
        Turns.enable = true
    end
end