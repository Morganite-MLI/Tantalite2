-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util")

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tantalite-ore"] = {name= "tantalite-ore"}
  se_delivery_cannon_recipes["tantalum-plate"] = {name= "tantalum-plate"}
  se_delivery_cannon_recipes["niobium-plate"] = {name= "niobium-plate"}
  util.se_landfill({ore="tantalite-ore"})

  util.se_matter({ore="tantalite-ore", energy_required=1, quant_out=10, stream_out=600})
  data:extend({
  {
    type = "item-subgroup",
    name = "niobium",
    group = "resources",
    order = "a-h-z-a",
  },
  {
    type = "item-subgroup",
    name = "tantalum",
    group = "resources",
    order = "a-h-z-a",
  },
  {
    type = "item-subgroup",
    name = "tantalite",
    group = "resources",
    order = "a-h-z-a",
  }
  })
  util.set_item_subgroup("tantalum-plate", "tantalum")
  util.set_item_subgroup("niobium-plate", "niobium")
  data:extend({
  {
    type = "item",
    name = "tantalum-ingot",
    icons = {{icon = "__Tantalite2__/graphics/icons/tantalum-ingot.png", icon_size = 64}},
    order = "b-b",
    stack_size = 50,
    subgroup = "tantalum",
  },
  {
    type = "item",
    name = "niobium-ingot",
    icons = {{icon = "__Tantalite2__/graphics/icons/niobium-ingot.png", icon_size = 64}},
    order = "b-b",
    stack_size = 50,
    subgroup = "niobium",
  },
  {
    type = "fluid",
    name = "molten-tantalite",
    default_temperature = 232,
    max_temperature = 232,
    base_color = {r=191, g=219, b=233},
    flow_color = {r=191, g=219, b=233},
    icons = {{icon = "__Tantalite2__/graphics/icons/molten-tantalite.png", icon_size = 64}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    categories = {"smelting"},
    name = "molten-tantalite",
    subgroup = "tantalite",
    results = {
      {type = "fluid", name = "molten-tantalite", amount = mods["Krastorio2"] and 750 or 900},
    },
    energy_required = 45,
    ingredients = {
      {type = "item", name = mods["Krastorio2"] and "enriched-tantalite" or "tantalite-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "tantalite-ingot",
    subgroup = "tantalite",
    icons = {{icon = "__Tantalite2__/graphics/icons/tantalum-ingot.png", icon_size = 64}},
    categories = {"casting"},
    main_porduct = "tantalum-ingot",
    results = {{type="item", name="tantalum-ingot", amount=1}, {type="item", name="niobium-ingot", amount=1}},
    energy_required = 20,
    ingredients = {
      {type = "fluid", name = "molten-tantalite", amount = 500},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    categories = {"crafting"},
    name = "tantalum-ingot-to-plate",
    icons = {
      {icon = "__Tantalite2__/graphics/icons/tantalum-plate.png", icon_size = 64},
      {icon = "__Tantalite2__/graphics/icons/tantalum-ingot.png", icon_size = 32, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {type="item", name = "tantalum-plate", amount = 10},
    },
    energy_required = 3.75,
    ingredients = {
      {type="item", name = "tantalum-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b",
    },
    {
      type = "recipe",
      categories = {"crafting"},
      name = "niobium-ingot-to-plate",
      icons = {
        {icon = "__Tantalite2__/graphics/icons/niobium-plate.png", icon_size = 64},
        {icon = "__Tantalite2__/graphics/icons/niobium-ingot.png", icon_size = 32, scale = 0.125, shift = {-8, -8}},
      },
      results = {
        {type="item", name = "niobium-plate", amount = 10},
      },
      energy_required = 3.75,
      ingredients = {
        {type="item", name = "niobium-ingot", amount = 1}
      },
      enabled = false,
      always_show_made_in = true,
      allow_decomposition = false,
      order = "a-c-b"
    }
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-tantalite"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tantalite-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tantalum-ingot-to-plate"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "niobium-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-tantalite"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tantalite-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tantalum-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "niobium-ingot-to-plate"})
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-tantalite", "tantalite")
    data.raw.recipe["enriched-tantalite-smelting"].order= "d[tantalum-plate]"
    se_delivery_cannon_recipes["enriched-tantalite"] = {name= "enriched-tantalite"}
  end
  se_delivery_cannon_recipes["tantalum-ingot"] = {name= "tantalum-ingot"}
  se_delivery_cannon_recipes["niobium-ingot"] = {name= "niobium-ingot"}

end