local max_play_points_guid = "4e6229"
local current_max_prop_name = "currentMax"
local current_available_prop_name = "currentAvailable"

function onLoad(script_state)
    local counter_state = JSON.decode(script_state)
    local play_points_value = 0

    if counter_state ~= nil and counter_state.play_points ~= nil then
        play_points_value = counter_state.play_points
    end

    params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(play_points_value),
        position       = {0, 0.2, 0},
        rotation       = {0, 0, 0},
        width          = 1000,
        height         = 1000,
        font_size      = 800,
        color          = {0.5, 0.0, 0.0, 0},
        font_color     = {1, 1, 1, 255},
        hover_color    = {0.8, 0.8, 0.8, 0.2},
        tooltip        = "Left click to increase your currently available play points. Right-click to reduce instead.",
    }

    self.setVar(current_available_prop_name, play_points_value)    
    self.createButton(params)
end

function onSave()
    local counter_state = {
        play_points = self.getVar(current_available_prop_name)
    }

    return JSON.encode(counter_state)
end

function on_button_click(obj, color, alt_click)
    local available_play_points_value = self.getVar(current_available_prop_name)
    
    if available_play_points_value == nil then
        available_play_points_value = 0
    end

    if alt_click then
        available_play_points_value = available_play_points_value - 1
    else
        available_play_points_value = available_play_points_value + 1
    end

    local max_counter = getObjectFromGUID(max_play_points_guid).getVar(current_max_prop_name)

    if available_play_points_value <= 0 then
        available_play_points_value = 0
    elseif available_play_points_value > max_counter then
        available_play_points_value = max_counter
    end

    self.setVar(current_available_prop_name, available_play_points_value)
    self.editButton({index=0, label=tostring(available_play_points_value)})
end

function on_turn_start(params)
    local available_play_points_value = self.getVar(current_available_prop_name)

    local max_counter = getObjectFromGUID(max_play_points_guid).getVar(current_max_prop_name)

    if max_counter == nil then
        max_counter = 0
    end

    if available_play_points_value <= 0 then
        available_play_points_value = 0
    elseif available_play_points_value > max_counter then
        available_play_points_value = max_counter
    end
    
    self.editButton({index=0, label=tostring(available_play_points_value)})
end