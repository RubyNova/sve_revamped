local leader_defence_prop_name = "leaderDefence"

function onLoad(script_state)
    local leader_defence_state = JSON.decode(script_state)
    local leader_defence_value = 20

    if leader_defence_state ~= nil and leader_defence_state.leader_defence ~= nil then
        leader_defence_value = leader_defence_state.leader_defence
    end

    params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(leader_defence_value),
        position       = {0, 0.2, 0},
        rotation       = {0, 0, 0},
        width          = 1000,
        height         = 1000,
        font_size      = 800,
        color          = {0.5, 0.0, 0.0, 0},
        font_color     = {1, 1, 1, 255},
        hover_color    = {0.8, 0.8, 0.8, 0.2},
        tooltip        = "Left click to increase Leader Defence. Right-click to reduce Leader Defence. If you hit 0, you lose the game!",
    }

    self.setVar(leader_defence_prop_name, leader_defence_value)
    self.createButton(params)
end

function onSave()
    local leader_defence_state = {
        leader_defence = self.getVar(leader_defence_prop_name)
    }

    return JSON.encode(leader_defence_state)
end

function on_button_click(obj, color, alt_click)
    local leader_defence_value = self.getVar(leader_defence_prop_name)

    if alt_click then
        leader_defence_value = leader_defence_value - 1
    else
        leader_defence_value = leader_defence_value + 1
    end

    if leader_defence_value <= 0 then
        leader_defence_value = 0
    end
    
    self.setVar(leader_defence_prop_name, leader_defence_value)
    self.editButton({index=0, label=tostring(leader_defence_value)})
end