function on_turn_start(params)
    local objects_list = self.getObjects()

    for k,v in pairs(objects_list) do
        if string.lower(v.type) ~= "dice" then
            v.setRotation({0, 180, 0})
        end
    end
end