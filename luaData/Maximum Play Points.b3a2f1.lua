local maximum_play_points_value = 0

function onLoad()

    params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(maximum_play_points_value),
        position       = {0, 0.2, 0},
        rotation       = {0, 0, 0},
        width          = 1000,
        height         = 1000,
        font_size      = 800,
        color          = {0.5, 0.0, 0.0, 0},
        font_color     = {1, 1, 1, 255},
        hover_color    = {0.8, 0.8, 0.8, 0.2},
        tooltip        = "Left click to increase your maximum play points. Right-click to reduce instead.",
    }

    self.setVar("currentMax", maximum_play_points_value)    
    self.createButton(params)
end

function on_button_click(obj, color, alt_click)
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

    self.setVar("currentMax", maximum_play_points_value)    
    self.editButton({index=0, label=tostring(maximum_play_points_value)})
end

function on_turn_start(params)
    maximum_play_points_value = self.getVar("currentMax")

    if maximum_play_points_value > 10 then
        maximum_play_points_value = 10
    end

    self.editButton({index=0, label=tostring(maximum_play_points_value)})
end