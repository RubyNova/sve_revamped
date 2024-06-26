--NONUKE
local xml_to_apply_local = {
        {
            tag = "Image",
            attributes = {
                image = "token",
                position = "0 0 -30",
                width = 1434,
                height = 2004,
                rotation = "0 0 180",
                scale = "0.15 0.155 1"
            }
        },
        {
            tag = "Image",
            attributes = {
                id = "atkImage",
                image = "atk",
                position = "85 120 -40",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.5 0.5 1"
            }
        },
        {
            tag = "Image",
            attributes = {
                id = "defImage",
                image = "def",
                position = "-85 120 -40",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.5 0.5 1"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "attackToggleButton",
                position = "85 120 -50",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.7 0.7 1",
                color = "clear",
                textColor = "white",
            },
            children = {
                tag = "Text",
                attributes = {
                    id = "attackButtonText",
                    font = "seagull/seagull",
                    fontSize = 30,
                },
                value = "1"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "defenceToggleButton",
                position = "-85 120 -50",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.7 0.7 1",
                color = "clear",
                textColor = "white",
            },
            children = {
                tag = "Text",
                attributes = {
                    id = "defenceButtonText",
                    font = "seagull/seagull",
                    fontSize = 30,
                },
                value = "1"
            }
        },
        {
            tag = "Image",
            attributes = {
                image = "token",
                position = "0 0 30",
                width = 1434,
                height = 2004,
                rotation = "0 0 180",
                scale = "0.15 0.155 1"
            }
        },
}

local xml_to_apply = {
        {
            tag = "Image",
            attributes = {
                id = "atkImage",
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
                id = "defImage",
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
                id = "attackToggleButton",
                position = "85 120 -40",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.7 0.7 1",
                color = "clear",
                textColor = "white",
                onClick = "on_dynamic_button_click",
            },
            children = {
                tag = "Text",
                attributes = {
                    id = "attackButtonText",
                    font = "seagull/seagull",
                    fontSize = 30,
                },
                value = "1"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "attackIncreaseButton",
                position = "130 95 -40",
                width = 50,
                height = 50,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0, 0, 0.75, 0.75)",
                onClick = "on_dynamic_button_click",
            },
            children = {
                tag = "Text",
                attributes = {
                color = "white",
                    --font = "seagull/seagull",
                    --alignment = "UpperCenter",
                    resizeTextForBestFit = "true"
                },
                value = "+"
            }

        },
        {
            tag = "Button",
            attributes = {
                id = "attackDecreaseButton",
                position = "130 145 -40",
                width = 50,
                height = 50,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0, 0, 0.75, 0.75)",
                onClick = "on_dynamic_button_click",
            },
            children = {
                tag = "Text",
                attributes = {
                color = "white",
                    --font = "seagull/seagull",
                    alignment = "UpperCenter",
                    resizeTextForBestFit = "true"
                },
                value = "-"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "defenceToggleButton",
                position = "-85 120 -40",
                width = 62,
                height = 77,
                rotation = "0 0 180",
                scale = "0.7 0.7 1",
                color = "clear",
                textColor = "white",
                onClick = "on_dynamic_button_click"
            },
            children = {
                tag = "Text",
                attributes = {
                    id = "defenceButtonText",
                    font = "seagull/seagull",
                    fontSize = 30,
                },
                value = "1"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "defenceIncreaseButton",
                position = "-130 95 -40",
                width = 50,
                height = 50,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.75, 0, 0, 0.75)",
                onClick = "on_dynamic_button_click",
            },
            children = {
                tag = "Text",
                attributes = {
                color = "white",
                    --font = "seagull/seagull",
                    --alignment = "UpperCenter",
                    resizeTextForBestFit = "true"
                },
                value = "+"
            }

        },
        {
            tag = "Button",
            attributes = {
                id = "defenceDecreaseButton",
                position = "-130 145 -40",
                width = 50,
                height = 50,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.75, 0, 0, 0.75)",
                onClick = "on_dynamic_button_click",
            },
            children = {
                tag = "Text",
                attributes = {
                color = "white",
                    --font = "seagull/seagull",
                    alignment = "UpperCenter",
                    resizeTextForBestFit = "true"
                },
                value = "-"
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "deleteAtkDefCounterButton",
                position = "0 170 -40",
                width = 30,
                height = 30,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0, 0, 0, 0.75)",
                textColor = "white",
                onClick = "on_dynamic_button_click",
            },
            children = {
                tag = "Text",
                attributes = {
                    --font = "seagull/seagull",
                    alignment = "UpperCenter",
                    resizeTextForBestFit = "true"
                },
                value = "X"
            }
        }
    }


function onLoad()
    --local assets = Global.UI.getCustomAssets()
    --self.UI.setCustomAssets(assets)
    self.UI.setXmlTable(xml_to_apply_local)
end

function onCollisionEnter(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector

    if collision_info.collision_object.type ~= "Card" then
        return
    end

    -- for the alpha, we don't need to overcomplicate the card support. Just overwrite the UI on collision.
    collision_info.collision_object.UI.setXmlTable(xml_to_apply)

    self.destruct()
end