

-- TODO: DO NOT LEAVE THIS HERE, THIS IS FOR TESTING

local dynamic_button_bindings = {}    

local xmlToApply = {
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
                value = "10"
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
                value = "10"
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
        },
    }

function register_button(params, context_table)
    if dynamic_button_bindings[params.id] ~= nil then
        error("Attempt to add dynamic UI button binding when one already exists!")
        return
    end

    dynamic_button_bindings[params.id] = { binding = params.binding, context = context_table }
end

function unregister_button(params)
    if dynamic_button_bindings[params.id] == nil then
        return
    end

    dynamic_button_bindings[params.id] = nil
end

function on_dynamic_button_click(player, _, id)
    if dynamic_button_bindings[id] == nil then
       error("Dynamic button with no functionality was clicked!")
       return
    end

    dynamic_button_bindings[id].binding(dynamic_button_bindings[id].context)
end

function delete_ui_element(ui_table, element_id)
    for k, v in ipairs(ui_table) do
        if v.attributes ~= nil and v.attributes.id ~= nil and v.attributes.id == element_id then
            ui_table[k] = nil
            return true 
        end

        if v.children ~= nil then
            if delete_ui_element(v.children, element_id) then
                return true
            end
        end
    end

    return false
end

function onLoad()
    Global.call("shitpost", {})
    local assets = UI.getCustomAssets()
    self.UI.setCustomAssets(assets)
    


    self.UI.setXmlTable(xmlToApply)

    register_button({
        id = "attackButton", 
        binding = function(context)

            if context.active_str_value == "false" then
                context.active_str_value = "true"
            else
                context.active_str_value = "false"
            end

            self.UI.setAttribute("attackIncreaseButton", "active", context.active_str_value)
            self.UI.setAttribute("attackDecreaseButton", "active", context.active_str_value)
        end}, {active_str_value = "true"}
    )
    
    local attack_table = {attack_value = 1}

    register_button({
        id = "attackIncreaseButton", 
        binding = function(context)
            context.attack_ref.attack_value = context.attack_ref.attack_value + 1

            self.UI.setValue("attackButtonText", context.attack_ref.attack_value)
        end}, {attack_ref = attack_table}
    )
    
    register_button({
        id = "attackDecreaseButton", 
        binding = function(context)
            context.attack_ref.attack_value = context.attack_ref.attack_value - 1

            self.UI.setValue("attackButtonText", context.attack_ref.attack_value)
        end}, {attack_ref = attack_table}
    )
    
    register_button({
        id = "defenceButton", 
        binding = function(context)
            if context.active_str_value == "false" then
                context.active_str_value = "true"
            else
                context.active_str_value = "false"
            end

            self.UI.setAttribute("defenceIncreaseButton", "active", context.active_str_value)
            self.UI.setAttribute("defenceDecreaseButton", "active", context.active_str_value)
        end}, {active_str_value = "true"}
    )

    local defence_table = {defence_value = 1}

    register_button({
        id = "defenceIncreaseButton", 
        binding = function(context)
            context.defence_ref.defence_value = context.defence_ref.defence_value + 1

            if context.defence_ref.defence_value < 0 then
                context.defence_ref.defence_value = 0
            end

            self.UI.setValue("defenceButtonText", context.defence_ref.defence_value)
        end}, {defence_ref = defence_table}
    )
    
    register_button({
        id = "defenceDecreaseButton", 
        binding = function(context)
            context.defence_ref.defence_value = context.defence_ref.defence_value - 1

            if context.defence_ref.defence_value < 0 then
                context.defence_ref.defence_value = 0
            end

            self.UI.setValue("defenceButtonText", context.defence_ref.defence_value)
        end}, {defence_ref = defence_table}
    )
    
    register_button({
        id = "deleteAtkDefCounterButton", 
        binding = function(context)
            local xml_table = self.UI.getXmlTable()

            delete_ui_element(xml_table, "atkImage")
            delete_ui_element(xml_table, "defImage")
            delete_ui_element(xml_table, "attackButton")
            delete_ui_element(xml_table, "defenceButton")
            delete_ui_element(xml_table, "attackIncreaseButton")
            delete_ui_element(xml_table, "attackDecreaseButton")
            delete_ui_element(xml_table, "defenceIncreaseButton")
            delete_ui_element(xml_table, "defenceDecreaseButton")
            delete_ui_element(xml_table, "deleteAtkDefCounterButton")

            -- TTS does not accept an empty table for the UI XML, so we put a table into a table to get around it.
            -- Yes, this is stupid and insane, but it works. Too bad. Smile.png
            if #xml_table == 0 then
                xml_table = {{}}
            end
            
            self.UI.setXmlTable(xml_table)

        end}, {}
    )

end

function onCollisionEnter(collision_info)
    -- collision_info table:
    --   collision_object    Object
    --   contact_points      Table     {Vector, ...}
    --   relative_velocity   Vector

    if collision_info.collision_object.type ~= "Card" then
        return
    end

    -- for the alpha, we don't need to overcomplicate the card support.
    --if old_script ~= nil or old_script ~= "" then
    --    return
    --end

    collision_info.collision_object.UI.setXmlTable(xmlToApply)
    --Global.call("invoke_ui_handler", {id = "attackToggleButton", args = {context_object = collision_info.collision_object.getGUID()}})

    --<Image image="atk" position="85 120 -30" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1"/>
    --<Image image="def" position="-85 120 -30" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1"/>

    --<Button position="85 120 -40" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1" color="clear" textColor="white" fontSize="30">10</Button>
    --<Button position="-85 120 -40" width="62" height="77" rotation="0 0 180" scale="0.5 0.5 1" color="clear" textColor="white" fontSize="30">10</Button>

end