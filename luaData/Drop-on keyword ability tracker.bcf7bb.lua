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
            tag = "Button",
            attributes = {
                id = "assailToggleButton",
                position = "-125 -136 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "assail"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "auraToggleButton",
                position = "-125 -96 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "aura"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "baneToggleButton",
                position = "-125 -56 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "bane"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "drainToggleButton",
                position = "-125 -16 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "drain"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "intimidateToggleButton",
                position = "-125 24 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "intimidate"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "rushToggleButton",
                position = "-125 64 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "rush"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "stormToggleButton",
                position = "-125 104 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "storm"
                }
            }
        },
        {
            tag = "Button",
            attributes = {
                id = "wardToggleButton",
                position = "-125 144 -50",
                width = 40,
                height = 40,
                rotation = "0 0 180",
                scale = "1 1 1",
                color = "rgba(0.4, 0.4, 0.4, 1)",
                textColor = "white",
            },
            children = {
                tag = "Image",
                attributes = {
                    image = "ward"
                }
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
        }
}

local xml_to_apply = {
    {
        tag = "Button",
        attributes = {
            id = "editStatusAbilitiesToggleButton",
            position = "-120 -170 -50",
            width = 30,
            height = 30,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0, 0, 0, 1)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Text",
            attributes = {
                --font = "seagull/seagull",
                --alignment = "LowerCenter",
                resizeTextForBestFit = "true"
            },
            value = "V"
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "deleteStatusAbilitiesButton",
            position = "-90 -170 -50",
            width = 30,
            height = 30,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0, 0, 0, 1)",
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
    },
    {
        tag = "Button",
        attributes = {
            id = "assailToggleButton",
            position = "-125 -136 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "assailImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "assail"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "auraToggleButton",
            position = "-125 -96 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "auraImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "aura"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "baneToggleButton",
            position = "-125 -56 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "baneImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "bane"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "drainToggleButton",
            position = "-125 -16 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "drainImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "drain"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "intimidateToggleButton",
            position = "-125 24 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "intimidateImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "intimidate"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "rushToggleButton",
            position = "-125 64 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "rushImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "rush"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "stormToggleButton",
            position = "-125 104 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "stormImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "storm"
            }
        }
    },
    {
        tag = "Button",
        attributes = {
            id = "wardToggleButton",
            position = "-125 144 -50",
            width = 40,
            height = 40,
            rotation = "0 0 180",
            scale = "1 1 1",
            color = "rgba(0.4, 0.4, 0.4, 0.4)",
            textColor = "white",
            onClick = "on_dynamic_button_click",
        },
        children = {
            tag = "Image",
            attributes = {
                id = "wardImage",
                color = "rgba(1, 1, 1, 0.4)",
                image = "ward"
            }
        }
    },
}

function onLoad()
    --self.UI.setCustomAssets(Global.UI.getCustomAssets())
    self.UI.setXmlTable(xml_to_apply_local)
end

function onCollisionEnter(collision_info)
    if collision_info.collision_object.type ~= "Card" then
        return
    end

    local xml_table = collision_info.collision_object.UI.getXmlTable()
    for k,v in ipairs(xml_to_apply) do
        table.insert(xml_table, v)
    end

    collision_info.collision_object.UI.setXmlTable(xml_table)

    self.destruct()
end--