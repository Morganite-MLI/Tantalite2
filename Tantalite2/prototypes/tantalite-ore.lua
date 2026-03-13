local resource_autoplace = require('resource-autoplace');
local item_sounds = require('__base__.prototypes.item_sounds')
local util = require("__bzlib__/data-util")

data.raw.planet.nauvis.map_gen_settings.autoplace_controls["tantalite-ore"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["tantalite-ore"] = {}
resource_autoplace.initialize_patch_set("tantalite-ore", true)

local subgroup = "raw-resource"
if mods["space-exploration"] then
  subgroup = "tantalite"
end

data:extend({
  {
    type = "autoplace-control",
    category = "resource",
    name = "tantalite-ore",
    richness = true,
    order = "b-e"
  },
  {
    type = "resource",
    icon_size = 64,
    icon_mipmaps = 3,
    name = "tantalite-ore",
    icon = "__Tantalite2__/graphics/icons/tantalum-ore.png",
    flags = { "placeable-neutral" },
    order = "a-b-a",
    map_color = { r = 0.30, g = 0.30, b = 0.60 },
    minable =
    {
      hardness = 1,
      mining_particle = "copper-ore-particle",
      mining_time = 1,
      fluid_amount = 3,
      required_fluid = "sulfuric-acid",
      result = "tantalite-ore"
    },
    collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },

    autoplace = resource_autoplace.resource_autoplace_settings {
      name = "tantalite-ore",
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
        filename = "__Tantalite2__/graphics/entity/ores/hr-tantalite-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
  },
  {
    type = "item",
    name = "tantalite-ore",
    icon_size = 64,
    icon_mipmaps = 3,
    icon = "__Tantalite2__/graphics/icons/tantalite-ore.png",
    subgroup = "raw-resource",
    order = "t-c-a",
    stack_size = 50,
    weight = 20 * kg,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move
  },
  {
    type = "recipe",
    name = "tantalite-smelting",
    category = "smelting",
    subgroup = subgroup,
    order = "d[tantalum-plate]",
    icons = (mods["Krastorio2"] and
      {
        { icon = "__Tantalite2__/graphics/icons/tantalum-plate.png", icon_size = 64 },
        { icon = "__Tantalite2__/graphics/icons/tantalite-ore.png",  icon_size = 64, scale = 0.2, shift = { -8, -8 } },
      } or {
        { icon = "__Tantalite2__/graphics/icons/tantalum-plate.png", icon_size = 64 },
      }),
    main_product = "tantalum-plate",
    enabled = true,
    energy_required = 12,
    ingredients = { { type = "item", name = "tantalite-ore", amount = 20 } },
    results = {
      { type = "item", name = "tantalum-plate", amount = 5 },
      { type = "item", name = "niobium-plate", amount = 5 }
    }
  }
})

util.add_productivity("tantalite-smelting")
