--[[ Lua code. See documentation: https://api.tabletopsimulator.com/ --]]

function split(inputstr, sep)
    if sep == nil then
        sep = "%s" -- Default to whitespace
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local has_loaded = false
local card_state_data = {}

local load_handler_cache = {}
local pre_load_card_cache = {}

function onChat(message, sender)
    if string.find(message, "-import") then
        local arr = split(message, " ")
        load_cards(arr[2])
    end

    return true
end

--[[ The onLoad event is called after the game save finishes loading. --]]
function onLoad(script_state)
    --Tables.setTable("Table_Custom")
    --Tables.setCustomURL("https://steamusercontent-a.akamaihd.net/ugc/2457357698616741578/7BBF631AAED3CD2655503C61051350C69E6B415F/")
    Tables.getTableObject().scale({ 0.33, 1, 0.529 })
 
    local state_table = JSON.decode(script_state)

    if state_table == nil then
        
        for _, binding in ipairs(load_handler_cache) do
            getObjectFromGUID(binding.binding_object).call(binding.func_name, context)
        end

        has_loaded = true
        return
    end

    card_state_data = state_table.card_state_data_cached
    
    for _, binding in ipairs(load_handler_cache) do
        getObjectFromGUID(binding.binding_object).call(binding.func_name, context)
    end
    
    has_loaded = true
end

function onSave()
    return JSON.encode({card_state_data_cached = card_state_data})
end

function update_card_state(data)
    card_state_data[data.guid] = data.state
end

function get_card_state(data)
    return card_state_data[data.guid] or {}
end

local ui_handler_cache = {}

function register_ui_handler(params)
    if ui_handler_cache[params.id] ~= nil then
        error("Attempt to re-register UI handler with the same ID.")
        return
    end

    ui_handler_cache[params.id] = params.binding
end

function invoke_ui_handler(params)
    if ui_handler_cache[params.id] == nil then
        error("Attempt to invoke nonexistent UI handler function.")
    end

    local binding = ui_handler_cache[params.id]
    getObjectFromGUID(binding.binding_object).call(binding.func_name, params.args)
end

--[[ The onUpdate event is called once per frame. --]]
function onUpdate()

end

function onPlayerConnect(player)
    player.promote()
end

function onPlayerTurn(player, previous_player)
    if player == nil then
        print("Player is nil! Please reset turn functionality.")
        Turns.enable = false
        return
    end
end

function onPlayerChangeColor(player_color)
    if player_color == "Grey" or player_color == "Black" then
        return
    end

    --if Turns.enable == false then
    --    Turns.enable = true
    --end
end

function tprint (tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2 
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "   
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end

function onObjectEnterContainer(container, card)
    if container.getData().Name ~= "Deck" then
        return
    end

    local context_data = card.getTable("contextualTableData")

    if context_data == nil then
        context_data = {}
    end

    update_card_state({guid = card.guid, state = context_data})
end

function onObjectLeaveContainer(container, card)
    if container.getData().Name ~= "Deck" then
        return
    end

    local state = get_card_state({ guid = card.getGUID() })
    card.setTable("contextualTableData", state)
    
    if state.xml_ui ~= nil and next(state.xml_ui) ~= nil then
        Wait.time(function() card.UI.setXmlTable(state.xml_ui) end, 0.2)
    end
end
    
function onObjectSpawn(object)
    if object.type ~= "Card" then
        return
    end
    
    local existing_script = object.getLuaScript()

    if string.find(existing_script, "--NONUKE") then
        return
    end
    
    --if existing_script ~= nil or existing_script ~= "" then
    --    print(existing_script)
    --    return
    --end

    
    local functions_to_add = [[
--function onSave()
--    local xml_ui_str = self.UI.getXmlTable()
--
--    local return_table = { xml_ui = xml_ui, context_table = self.getTable("contextualTableData") }
--
--    if return_table.context_table == nil then
--        return_table.context_table = {}
--    end
--
--    Global.call("update_card_state", {guid = self.getGUID(), state = return_table})
--    return JSON.encode(return_table)
--end
--
--
--function onLoad(script_state)
--    local state_table = JSON.decode(script_state)
--
--    if state_table == nil then
--        Global.call("ready_for_card_load", {context_object = self.getGUID()})
--        return
--    end
--
--    local assets = UI.getCustomAssets()
--    self.UI.setCustomAssets(assets)
--
--    if state_table.xml_ui ~= nil then
--        self.UI.setXml(state_table.xml_ui)
--    end
--
--    local contextual_data = state_table.context_table
--
--    if contextual_data == nil then
--        contextual_data = {}
--    end
--
--    self.setTable("contextualTableData", contextual_data)
--
--    Global.call("ready_for_card_load", {context_object = self.getGUID()})
--end

function on_dynamic_button_click(player, _, id)
    Global.call("invoke_ui_handler", {id = id, args = {context_object = self.getGUID()}})
end

function on_card_flip(player, _, id)
    local face_data = self.getCustomObject()
    local context_table = Global.call("get_card_state", { guid = self.getGUID() })
    local back_of_card = "https://steamusercontent-a.akamaihd.net/ugc/2462986661277403686/F7DECF05616CD3296AB56BC3D51096286805962F/"
    
    if context_table.is_using_second_face then
        self.setCustomObject({face = context_table.first_face.face_image, back = back_of_card })
        self.setName(context_table.first_face.face_name)
        self.setDescription(context_table.first_face.face_desc)
    else
        self.setCustomObject({face = context_table.second_face.face_image, back = back_of_card })
        self.setName(context_table.second_face.face_name)
        self.setDescription(context_table.second_face.face_desc)
    end

    context_table.is_using_second_face = not context_table.is_using_second_face
    self.setTable("contextualTableData", context_table)
    Global.call("update_card_state", { guid = self.getGUID(), state = context_table })
end
    ]]

    object.setLuaScript(functions_to_add)


    object.UI.setCustomAssets(self.UI.getCustomAssets())
end

function register_load_function_handler(params)
    table.insert(load_handler_cache, params.binding)
end

function ready_for_card_load(context)
    if not has_loaded then
        table.insert(pre_load_card_cache, context)
    else
        for _, binding in ipairs(load_handler_cache) do
            getObjectFromGUID(binding.binding_object).call(binding.func_name, context)
        end
    end
end

function load_cards(deck_code)

    --local new_loaded_cards = {
    --}

    WebRequest.get("https://evolvecdb.org/api/deck/" .. deck_code, function(requestData)
        if requestData.is_error then
            error("Unable to import target deck.")
        else
            local back_of_card = "https://steamusercontent-a.akamaihd.net/ugc/2462986661277403686/F7DECF05616CD3296AB56BC3D51096286805962F/"
            local data = JSON.decode(requestData.text)
            local offset = 0
            local new_loaded_cards = {}

            print("Deck data received. Parsing main deck...")
            
            for card_number, card_data in ipairs(data.mainCards) do
                local new_card = spawnObject({type = "Card", position = { 0, 3 + offset, 0 }, rotation = {0, 0, 180}, sound = false})
                new_card.setCustomObject({face = card_data.imgUrl, back = back_of_card})
                new_card.setName(card_data.name)
                new_card.setDescription(card_data.description)
                update_card_state({guid = new_card.getGUID(), data = {}})
                table.insert(new_loaded_cards, new_card)
                offset = offset + 0.3
            end
            
            print("grouping " .. tostring(#new_loaded_cards) .. " cards")
            group(new_loaded_cards)
            print("Parsing evolve deck...")

            new_loaded_cards = {}

            for card_number, card_data in ipairs(data.evolveCards) do
                local new_card = spawnObject({type = "Card", position = { 3, 3 + offset, 0 }, rotation = {0, 0, 180}, sound = false})
                new_card.setCustomObject({face = card_data.imgUrl, back = back_of_card})
                new_card.setName(card_data.name)
                new_card.setDescription(card_data.description)
                
                if card_data.alternateDetails ~= nil then
                   local context_data = {first_face = { face_name = card_data.name, face_image = card_data.imgUrl, face_desc = card_data.description }, second_face = { face_name = card_data.alternateDetails.name, face_image = card_data.alternateDetails.imgUrl, face_desc = card_data.alternateDetails.description }, is_using_second_face = false} 
                   context_data.xml_ui = {{
                       tag = "Button",
                       attributes = {
                           id = "flipCardSide",
                           position = "120 -170 -50",
                           width = 30,
                           height = 30,
                           rotation = "0 0 180",
                           scale = "1 1 1",
                           color = "rgba(0, 0, 0, 1)",
                           textColor = "white",
                           onClick = "on_card_flip",
                       },
                       children = {
                           tag = "Text",
                           attributes = {
                               --font = "seagull/seagull",
                               --alignment = "LowerCenter",
                               resizeTextForBestFit = "true"
                           },
                           value = "F"
                       }
                   }}
                   
                   new_card.setTable("contextualTableData", context_data)
                   new_card.UI.setXmlTable(context_data.xml_ui)                   
                   update_card_state({guid = new_card.getGUID(), data = context_data })
                    
                    --collision_info.collision_object.UI.setXmlTable(xml_table)
                else
                    update_card_state({guid = new_card.getGUID(), data = {}})
                end

                --new_card.UI.setXmlTable(undefined, undefined)

                table.insert(new_loaded_cards, new_card)
                offset = offset + 0.3
            end

            print("grouping " .. tostring(#new_loaded_cards) .. " cards")
            group(new_loaded_cards)

            print("Spawning leader...")

            local leader_data = data.leaderCard
 
            local new_card = spawnObject({type = "Card", position = { 0, 3 + offset, -4 }, sound = false})
            new_card.setCustomObject({face = leader_data.imgUrl, back = back_of_card})
            new_card.setName(leader_data.name)

            print("done!")
        end
    end)
end