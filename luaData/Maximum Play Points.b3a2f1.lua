local current_max_prop_name = "currentMax"
local player_current = "7f0840"

function onLoad(script_state)
    local counter_state = JSON.decode(script_state)
    local play_points_value = 0

    if counter_state ~= nil and counter_state.play_points ~= nil then
        play_points_value = counter_state.play_points
    end

    local params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(play_points_value),
        position       = {0, 0.2, 0},
        rotation       = {0, 0, 0},
        width          = 1000,
        height         = 1000,
        font_size      = 800,
        color          = {0.5, 0.0, 0.0, 0},
        font_color     = {1, 1, 1, 100},
        hover_color    = {0.8, 0.8, 0.8, 0.2},
        tooltip        = "Left click to increase your maximum play points. Right-click to reduce instead.",
    }

    self.setVar(current_max_prop_name, maximum_play_points_value)    
    self.createButton(params)
end

function onSave()
    local counter_state = {
        play_points = self.getVar(current_max_prop_name)
    }

    return JSON.encode(counter_state)
end

function on_button_click(obj, color, alt_click)
    local maximum_play_points_value = self.getVar(current_max_prop_name)

    if maximum_play_points_value == nil then
        maximum_play_points_value = 0
    end

    if alt_click then
        maximum_play_points_value = maximum_play_points_value - 1
    else
        maximum_play_points_value = maximum_play_points_value + 1
    end

    if maximum_play_points_value <= 0 then
        maximum_play_points_value = 0
    elseif maximum_play_points_value > 10 then
        maximum_play_points_value = 10
    end

    self.setVar(current_max_prop_name, maximum_play_points_value)    
    self.editButton({index=0, label=tostring(maximum_play_points_value)})
end

function on_turn_start(params)
    local maximum_play_points_value = params.value

    if maximum_play_points_value > 10 then
        maximum_play_points_value = 10
    end
    
    self.setVar(current_max_prop_name, maximum_play_points_value)
    self.editButton({index=0, label=tostring(maximum_play_points_value)})
end

function onPlayerTurn(player, previous_player)
    if player == nil or player.color ~= "Red" then
        return
    end

    local current_object = getObjectFromGUID(player_current)
    local new_max = self.getVar(current_max_prop_name)

    if new_max == nil then
        new_max = 0
    end

    new_max = new_max + 1

    on_turn_start({value = new_max})

    current_object.call("on_turn_start", {value = new_max})
    getObjectFromGUID("c51012").call("on_turn_start", {})
end