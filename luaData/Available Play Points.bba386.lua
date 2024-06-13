local available_play_points_value = 0
local max_play_points_guid = "4e6229"

function onLoad()

    params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(available_play_points_value),
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

    self.createButton(params)
end

function on_button_click(obj, color, alt_click)
    if alt_click then
        available_play_points_value = available_play_points_value - 1
    else
        available_play_points_value = available_play_points_value + 1
    end

    local max_counter = getObjectFromGUID(max_play_points_guid).getVar("currentMax")

    if available_play_points_value <= 0 then
        available_play_points_value = 0
    elseif available_play_points_value > max_counter then
        available_play_points_value = max_counter
    end

    self.editButton({index=0, label=tostring(available_play_points_value)})
end

function on_turn_start(params)
    available_play_points_value = self.getVar("currentAvailable")
    self.editButton({index=0, label=tostring(available_play_points_value)})
end