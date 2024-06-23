local evolution_points_prop_name = "evolutionPoints"

function onLoad(script_state)
    local leader_defence_state = JSON.decode(script_state)
    local evolution_points_value = 0

    if leader_defence_state ~= nil and leader_defence_state.evolution_points ~= nil then
        evolution_points_value = leader_defence_state.evolution_points
    end

    params = {
        click_function = "on_button_click",
        function_owner = self,
        label          = tostring(evolution_points_value),
        position       = {0, 0.2, 0},
        rotation       = {0, 0, 0},
        width          = 1000,
        height         = 1000,
        font_size      = 800,
        color          = {0.5, 0.0, 0.0, 0},
        font_color     = {1, 1, 1, 100},
        hover_color    = {0.8, 0.8, 0.8, 0.2},
        tooltip        = "Left click to increase Evolution Points. Right click to decrease Evolution Points. You can use one a turn to assist in paying for the evolution of a follower.",
    }

    self.setVar(evolution_points_prop_name, evolution_points_value)
    self.createButton(params)
end

function onSave()
    local leader_defence_state = {
        leade = self.getVar(evolution_points_prop_name)
    }

    return JSON.encode(leader_defence_state)
end

function on_button_click(obj, color, alt_click)
    local evolution_points_value = self.getVar(evolution_points_prop_name)

    if alt_click then
        evolution_points_value = evolution_points_value - 1
    else
        evolution_points_value = evolution_points_value + 1
    end

    if evolution_points_value <= 0 then
        evolution_points_value = 0
    end
    
    self.setVar(evolution_points_prop_name, evolution_points_value)
    self.editButton({index=0, label=tostring(evolution_points_value)})
end