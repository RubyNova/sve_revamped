
function onLoad()
    --local params_atk = {
    --    click_function = "on_atk_button_click",
    --    function_owner = self,
    --    label          = tostring(10),
    --    position       = {-0.85, 0.3, 1.23},
    --    rotation       = {0, 0, 0},
    --    width          = 260,
    --    height         = 260,
    --    font_size      = 150,
    --    color          = {0, 0, 1},
    --    font_color     = {1, 1, 1},
    --    hover_color    = {0, 0, 1},
    --    tooltip        = "",
    --}

    --local params_def = {
    --    click_function = "on_def_button_click",
    --    function_owner = self,
    --    label          = tostring(10),
    --    position       = {0.85, 0.3, 1.23},
    --    rotation       = {0, 0, 0},
    --    width          = 260,
    --    height         = 260,
    --    font_size      = 150,
    --    color          = {1, 0, 0},
    --    font_color     = {1, 1, 1},
    --    hover_color    = {1, 0, 0},
    --    tooltip        = "",
    --}

    --local params_remove = {
    --    click_function = "on_remove_button_click",
    --    function_owner = self,
    --    label          = "X",
    --    position       = {0, 0.3, 1.3},
    --    rotation       = {0, 0, 0},
    --    width          = 100,
    --    height         = 100,
    --    font_size      = 100,
    --    color          = {0, 0, 0},
    --    font_color     = {1, 1, 1},
    --    hover_color    = {0.3, 0, 0},
    --    tooltip        = "",
    --}

    --self.createButton(params_atk)
    --self.createButton(params_def)
    --self.createButton(params_remove)

    self.UI.setXml(self.UI.getXml())

end

function onCollisionEnter(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector
    
    if collision_info.collision_object.type ~= "Card" then
        return
    end

    --<Image image="atk" position="85 120 -30" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1"/>
    --<Image image="def" position="-85 120 -30" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1"/>

    --<Button position="85 120 -40" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1" color="clear" textColor="white" fontSize="30">10</Button>
    --<Button position="-85 120 -40" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1" color="clear" textColor="white" fontSize="30">10</Button>
    
    local xmlToApply = {
        {
            tag = "Image",
            attributes = {
                image = "atk",
                position = "85 120 -30",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.5 0.5 1"
            }
        },
        {
            tag = "Image",
            attributes = {
                image = "def",
                position = "-85 120 -30",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.5 0.5 1"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "attackButton",
                position = "85 120 -40",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.5 0.5 1",
                color = "clear",
                textColor = "white",
                fontSize = 30,
                onClick = "on_dynamic_button_click"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "defenceButton",
                position = "-85 120 -40",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.5 0.5 1",
                color = "clear",
                textColor = "white",
                fontSize = 30,
                onClick = "on_dynamic_button_click"
            }
        }
    }
end