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
local register_ui_handler_function_name = "register_ui_handler"
local attack_button_text_ui_name = "attackButtonText"
local attack_increase_button_ui_name = "attackIncreaseButton"
local attack_decrease_button_ui_name = "attackDecreaseButton"
local defence_button_text_ui_name = "defenceButtonText"
local defence_increase_button_ui_name = "defenceIncreaseButton"
local defence_decrease_button_ui_name = "defenceDecreaseButton"


function on_attack_toggle_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end

    local is_attack_enabled = context_table.is_attack_enabled

    if is_attack_enabled == nil then
        is_attack_enabled = true 
    end
    is_attack_enabled = not is_attack_enabled

    if is_attack_enabled then
        binding_object.UI.show(attack_increase_button_ui_name)
        binding_object.UI.show(attack_decrease_button_ui_name)
    else
        binding_object.UI.hide(attack_increase_button_ui_name)
        binding_object.UI.hide(attack_decrease_button_ui_name)
    end

    context_table.is_attack_enabled = is_attack_enabled    
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_attack_increase_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)
    
    if context_table == nil then
        context_table = {}
    end
    
    local attack_points = context_table.attack_points

    if attack_points == nil then
        attack_points = 1
    end

    attack_points = attack_points + 1
    binding_object.UI.setValue(attack_button_text_ui_name, attack_points)
    context_table.attack_points = attack_points

    binding_object.setTable(context_table_prop_name, context_table)
end

function on_attack_decrease_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)
    
    if context_table == nil then
        context_table = {}
    end
    
    local attack_points = context_table.attack_points

    if attack_points == nil then
        attack_points = 1
    end

    attack_points = attack_points - 1
    binding_object.UI.setValue(attack_button_text_ui_name, attack_points)
    context_table.attack_points = attack_points

    binding_object.setTable(context_table_prop_name, context_table)
end

function on_defence_toggle_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)

    if context_table == nil then
        context_table = {}
    end

    local is_defence_enabled = context_table.is_defence_enabled

    if is_defence_enabled == nil then
        is_defence_enabled = true 
    end

    is_defence_enabled = not is_defence_enabled

    if is_defence_enabled then
        binding_object.UI.show(defence_increase_button_ui_name)
        binding_object.UI.show(defence_decrease_button_ui_name)
    else
        binding_object.UI.hide(defence_increase_button_ui_name)
        binding_object.UI.hide(defence_decrease_button_ui_name)
    end

    context_table.is_defence_enabled = is_defence_enabled    
    binding_object.setTable(context_table_prop_name, context_table)
end

function on_defence_increase_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)
    
    if context_table == nil then
        context_table = {}
    end
    
    local defence_points = context_table.defence_points

    if defence_points == nil then
        defence_points = 1
    end

    defence_points = defence_points + 1
    binding_object.UI.setValue(defence_button_text_ui_name, defence_points)
    context_table.defence_points = defence_points

    binding_object.setTable(context_table_prop_name, context_table)
end

function on_defence_decrease_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local context_table = binding_object.getTable(context_table_prop_name)
    
    if context_table == nil then
        context_table = {}
    end
    
    local defence_points = context_table.defence_points

    if defence_points == nil then
        defence_points = 1
    end

    defence_points = defence_points - 1

    if defence_points < 0 then
        defence_points = 0
    end

    binding_object.UI.setValue(defence_button_text_ui_name, defence_points)
    context_table.defence_points = defence_points

    binding_object.setTable(context_table_prop_name, context_table)
end

function on_delete_atk_def_counter_button_clicked(context)
    local binding_object = getObjectFromGUID(context.context_object)
    local xml_table = binding_object.UI.getXmlTable()

    if xml_table == nil then
        xml_table = {}
    end

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
    
    binding_object.UI.setXmlTable(xml_table)
end


function onLoad()
    Global.call(register_ui_handler_function_name, {
        id = "attackToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_attack_toggle_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "attackIncreaseButton",
        binding =  {binding_object = self.getGUID(),
        func_name = "on_attack_increase_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "attackDecreaseButton",
        binding =  {binding_object = self.getGUID(),
        func_name = "on_attack_decrease_button_clicked"}}
    )
    
    Global.call(register_ui_handler_function_name, {
        id = "defenceToggleButton",
        binding = {binding_object = self.getGUID(),
        func_name = "on_defence_toggle_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "defenceIncreaseButton",
        binding =  {binding_object = self.getGUID(),
        func_name = "on_defence_increase_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "defenceDecreaseButton",
        binding =  {binding_object = self.getGUID(),
        func_name = "on_defence_decrease_button_clicked"}}
    )

    Global.call(register_ui_handler_function_name, {
        id = "deleteAtkDefCounterButton",
        binding =  {binding_object = self.getGUID(),
        func_name = "on_delete_atk_def_counter_button_clicked"}}
    )
end