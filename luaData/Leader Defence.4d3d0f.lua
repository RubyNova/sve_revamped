local leader_defence_value = 20

function onLoad()

    params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(leader_defence_value),
        position       = {0, 0.2, 0},
        rotation       = {0, 0, 0},
        width          = 1000,
        height         = 1000,
        font_size      = 500,
        color          = {0.5, 0.0, 0.0, 0},
        font_color     = {1, 1, 1, 255},
        hover_color    = {0.8, 0.8, 0.8, 0.2},
        tooltip        = "Left click to increase Leader Defence. Right-click to reduce Leader Defence. If you hit 0, you lose the game!",
    }

    self.createButton(params)
end

function on_button_click(obj, color, alt_click)
    if alt_click then
        leader_defence_value = leader_defence_value - 1
    else
        leader_defence_value = leader_defence_value + 1
    end

    if leader_defence_value <= 0 then
        leader_defence_value = 0
    end

    self.editButton({index=0, label=tostring(leader_defence_value)})
end