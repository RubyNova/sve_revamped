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

local context_table_prop_name = "contextualTableData"

function on_toggle_edit_keyword_ability_tracker(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end

    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if context_table.is_assail_enabled == nil then
        context_table.is_assail_enabled = false
    end
    
    if context_table.is_aura_enabled == nil then
        context_table.is_aura_enabled = false
    end

    if context_table.is_bane_enabled == nil then
        context_table.is_bane_enabled = false
    end

    if context_table.is_drain_enabled == nil then
        context_table.is_drain_enabled = false
    end

    if context_table.is_intimidate_enabled == nil then
        context_table.is_intimidate_enabled = false
    end

    if context_table.is_rush_enabled == nil then
        context_table.is_rush_enabled = false
    end

    if context_table.is_storm_enabled == nil then
        context_table.is_storm_enabled = false
    end

    if context_table.is_ward_enabled == nil then
        context_table.is_ward_enabled = false
    end

    context_table.is_edit_toggle_enabled = not context_table.is_edit_toggle_enabled

    if context_table.is_edit_toggle_enabled then
        binding_object.UI.setAttribute("assailToggleButton", "active", "true")
        binding_object.UI.setAttribute("auraToggleButton", "active",  "true")
        binding_object.UI.setAttribute("baneToggleButton", "active",  "true")
        binding_object.UI.setAttribute("drainToggleButton", "active",  "true")
        binding_object.UI.setAttribute("intimidateToggleButton", "active", "true")
        binding_object.UI.setAttribute("rushToggleButton", "active",  "true")
        binding_object.UI.setAttribute("stormToggleButton", "active",  "true")
        binding_object.UI.setAttribute("wardToggleButton", "active", "true")
    else
        binding_object.UI.setAttribute("assailToggleButton", "active", tostring(context_table.is_assail_enabled))
        binding_object.UI.setAttribute("auraToggleButton", "active",  tostring(context_table.is_aura_enabled))
        binding_object.UI.setAttribute("baneToggleButton", "active",  tostring(context_table.is_bane_enabled))
        binding_object.UI.setAttribute("drainToggleButton", "active",  tostring(context_table.is_drain_enabled))
        binding_object.UI.setAttribute("intimidateToggleButton", "active", tostring(context_table.is_intimidate_enabled))
        binding_object.UI.setAttribute("rushToggleButton", "active",  tostring(context_table.is_rush_enabled))
        binding_object.UI.setAttribute("stormToggleButton", "active",  tostring(context_table.is_storm_enabled))
        binding_object.UI.setAttribute("wardToggleButton", "active", tostring(context_table.is_ward_enabled))
    end
    
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_delete_keyword_ability_tracker(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local xml_table = binding_object.UI.getXmlTable()

    if xml_table == nil then
        xml_table = {}
    end

    delete_ui_element(xml_table, "editStatusAbilitiesToggleButton")
    delete_ui_element(xml_table, "deleteStatusAbilitiesButton")
    delete_ui_element(xml_table, "assailToggleButton")
    delete_ui_element(xml_table, "auraToggleButton")
    delete_ui_element(xml_table, "baneToggleButton")
    delete_ui_element(xml_table, "drainToggleButton")
    delete_ui_element(xml_table, "intimidateToggleButton")
    delete_ui_element(xml_table, "rushToggleButton")
    delete_ui_element(xml_table, "stormToggleButton")
    delete_ui_element(xml_table, "wardToggleButton")

    -- TTS does not accept an empty table for the UI XML, so we put a table into a table to get around it.
    -- Yes, this is stupid and insane, but it works. Too bad. Smile.png
    if #xml_table == 0 then
        xml_table = {{}}
    end
    
    binding_object.UI.setXmlTable(xml_table)
end

function on_toggle_assail_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_assail_enabled = context_table.is_assail_enabled

    if is_assail_enabled == nil then
        is_assail_enabled = false 
    end

    is_assail_enabled = not is_assail_enabled

    if is_assail_enabled then
        binding_object.UI.setAttribute("assailToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("assailImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("assailToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("assailImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_assail_enabled = is_assail_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_aura_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_aura_enabled = context_table.is_aura_enabled

    if is_aura_enabled == nil then
        is_aura_enabled = false 
    end

    is_aura_enabled = not is_aura_enabled

    if is_aura_enabled then
        binding_object.UI.setAttribute("auraToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("auraImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("auraToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("auraImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_aura_enabled = is_aura_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_bane_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_bane_enabled = context_table.is_bane_enabled

    if is_bane_enabled == nil then
        is_bane_enabled = false 
    end

    is_bane_enabled = not is_bane_enabled

    if is_bane_enabled then
        binding_object.UI.setAttribute("baneToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("baneImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("baneToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("baneImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_bane_enabled = is_bane_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_drain_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_drain_enabled = context_table.is_drain_enabled

    if is_drain_enabled == nil then
        is_drain_enabled = false 
    end

    is_drain_enabled = not is_drain_enabled

    if is_drain_enabled then
        binding_object.UI.setAttribute("drainToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("drainImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("drainToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("drainImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_drain_enabled = is_drain_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_intimidate_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_intimidate_enabled = context_table.is_intimidate_enabled

    if is_intimidate_enabled == nil then
        is_intimidate_enabled = false 
    end

    is_intimidate_enabled = not is_intimidate_enabled

    if is_intimidate_enabled then
        binding_object.UI.setAttribute("intimidateToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("intimidateImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("intimidateToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("intimidateImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_intimidate_enabled = is_intimidate_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_rush_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_rush_enabled = context_table.is_rush_enabled

    if is_rush_enabled == nil then
        is_rush_enabled = false 
    end

    is_rush_enabled = not is_rush_enabled

    if is_rush_enabled then
        binding_object.UI.setAttribute("rushToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("rushImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("rushToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("rushImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_rush_enabled = is_rush_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_storm_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_storm_enabled = context_table.is_storm_enabled

    if is_storm_enabled == nil then
        is_storm_enabled = false 
    end

    is_storm_enabled = not is_storm_enabled

    if is_storm_enabled then
        binding_object.UI.setAttribute("stormToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("stormImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("stormToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("stormImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_storm_enabled = is_storm_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_toggle_ward_ability_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end
    
    if context_table.is_edit_toggle_enabled == nil then
        context_table.is_edit_toggle_enabled = true
    end

    if not context_table.is_edit_toggle_enabled then
        return
    end

    local is_ward_enabled = context_table.is_ward_enabled

    if is_ward_enabled == nil then
        is_ward_enabled = false 
    end

    is_ward_enabled = not is_ward_enabled

    if is_ward_enabled then
        binding_object.UI.setAttribute("wardToggleButton", "color", "rgba(0.4, 0.4, 0.4, 1)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("wardImage", "color", "rgba(1, 1, 1, 1)") --TODO: Set the transparency here
    else
        binding_object.UI.setAttribute("wardToggleButton", "color", "rgba(0.4, 0.4, 0.4, 0.4)") --TODO: Set the transparency here
        binding_object.UI.setAttribute("wardImage", "color", "rgba(1, 1, 1, 0.4)") --TODO: Set the transparency here
    end

    context_table.is_ward_enabled = is_ward_enabled
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_keyword_ability_tracker_card_load(context)
    local context_object = getObjectFromGUID(context.context_object)
    local context_table = context_object.getTable("contextualTableData")

    local old_edit_toggle_value = context_table.is_edit_toggle_enabled

    if old_edit_toggle_value == nil then
        return
    end


end

local register_ui_handler_function_name = "register_ui_handler"
local register_load_handler_function_name = "register_load_function_handler"

function onLoad()
    Global.call(register_ui_handler_function_name, {
        id = "editStatusAbilitiesToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_edit_keyword_ability_tracker"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "deleteStatusAbilitiesButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_delete_keyword_ability_tracker"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "assailToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_assail_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "auraToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_aura_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "baneToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_bane_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "drainToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_drain_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "intimidateToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_intimidate_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "rushToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_rush_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "stormToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_storm_ability_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "wardToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_toggle_ward_ability_button_clicked"}}
    )

    Global.call(register_load_handler_function_name, {
        binding = {binding_object = self.getGUID(),
        func_name = "on_keyword_ability_tracker_card_load"}})
end