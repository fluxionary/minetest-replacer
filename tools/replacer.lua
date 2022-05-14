local S = replacer.S
local api = replacer.api.replacer

minetest.register_tool("replacer:replacer", {
    description = S("Replacer"),
    short_description = S("Replacer"),
    inventory_image = "replacer_replacer.png",
    liquids_pointable = true,

    on_use = function(toolstack, player, pointed_thing)
        -- left click
        if not minetest.is_player(player) then
            return
        end

        local keys = player:get_player_control()
        if keys.sneak then
            -- TODO: some sort of formspec for setting
        else
            return api.replace(toolstack, player, pointed_thing)
        end
    end,

    on_place = function(toolstack, player, pointed_thing)
        -- rightclick
        if not minetest.is_player(player) then
            return
        end

        local keys = player:get_player_control()
        if keys.sneak then
            return api.copy(toolstack, player, pointed_thing)
        else
            return api.place(toolstack, player, pointed_thing)
        end
    end,
})
