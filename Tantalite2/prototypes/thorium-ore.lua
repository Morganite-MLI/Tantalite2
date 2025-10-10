local resource_autoplace = require('resource-autoplace');
local item_sounds = require('__base__.prototypes.item_sounds')

if mods["248k-Redux"] then
    data.raw.planet.nauvis.map_gen_settings.autoplace_controls["thorium-ore"] = {}
    data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["thorium-ore"] = {}
    resource_autoplace.initialize_patch_set("thorium-ore", true)

    local fluid_type = "sulfuric-acid"
    if mods["Krastorio2"] then
        fluid_type = "kr-hydrogen-chloride"
    end

    data:extend({
        {
            type = "autoplace-control",
            category = "resource",
            name = "thorium-ore",
            richness = true,
            order = "b-e"
        },
        {
            type = "item",
            name = "thorium-ore",
            icon_size = 64,
            icon_mipmaps = 3,
            icon = "__Tantalite2__/graphics/icons/thorium-ore.png",
            subgroup = "raw-resource",
            order = "t-c-a",
            stack_size = 50,
            weight = 20 * kg,
            inventory_move_sound = item_sounds.resource_inventory_move,
            pick_sound = item_sounds.resource_inventory_pickup,
            drop_sound = item_sounds.resource_inventory_move
        },
        {
            type = "resource",
            icon_size = 64,
            icon_mipmaps = 3,
            name = "thorium-ore",
            icon = "__Tantalite2__/graphics/icons/thorium-ore.png",
            flags = { "placeable-neutral" },
            order = "a-b-a",
            map_color = { r = 0.50, g = 0.50, b = 0.90 },
            minable =
            {
                hardness = 1,
                mining_particle = "copper-ore-particle",
                mining_time = 1,
                fluid_amount = 3,
                required_fluid = fluid_type,
                result = "thorium-ore"
            },
            collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
            selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },

            autoplace = resource_autoplace.resource_autoplace_settings {
                name = "thorium-ore",
                order = "b-z",
                base_density = 2,
                base_spots_per_km2 = 1,
                has_starting_area_placement = false,
                regular_rq_factor_multiplier = 1.0,
                starting_rq_factor_multiplier = 1.0,
            },

            stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
            stages =
            {
                sheet =
                {
                    filename = "__Tantalite2__/graphics/entity/ores/hr-thorium-ore.png",
                    priority = "extra-high",
                    size = 128,
                    frame_count = 8,
                    variation_count = 8,
                    scale = 0.5
                }
            },
        }
    })
end
