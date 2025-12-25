local util = require("data-util")

data:extend({
  {
    type = "item",
    name = "tantalum-plate",
    icon = "__Tantalite2__/graphics/icons/tantalum-plate.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[tantalum-plate]",
    stack_size = 100
  }
})

local thoriated_filament_ingredients = { { type = "item", name = "uranium-238", amount = 1 }, { type = "item", name = "iron-plate", amount = 1 } }
if mods["space-exploration"] then
  thoriated_filament_ingredients = { { type = "item", name = "uranium-ore", amount = 1 }, { type = "item", name = "iron-plate", amount = 1 } }
end
if mods["248k-Redux"] then
  thoriated_filament_ingredients = { { type = "item", name = "thorium-ore", amount = 1 } }
  if mods["bztungsten2"] then
    table.insert(thoriated_filament_ingredients, { type = "item", name = "tungsten-plate", amount = 1 })
  end
  data:extend({
    {
      type = "recipe",
      name = "thorium-processing",
      category = "centrifuging",
      order = "t",
      enabled = false,
      energy_required = 14,
      ingredients = { { type = "item", name = "thorium-ore", amount = 10 } },
      results = { { type = "item", name = "fi_thorium232_item", amount = 1 } },
    }
  })
  util.add_unlock("uranium-processing", "thorium-processing") --maybe add its own tech later
end
data:extend({
  {
    type = "item",
    name = "thoriated-filament",
    icon = "__Tantalite2__/graphics/icons/thoriated-filament.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[thoriated-filament]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "thoriated-filament",
    category = "advanced-crafting",
    order = "d[thoriated-filament]",
    enabled = false,
    energy_required = 2,
    ingredients = thoriated_filament_ingredients,
    results = { { type = "item", name = "thoriated-filament", amount = 1 } },
  }
})

local glass_name = mods["Krastorio2"] and "kr-glass" or "glass"

local electron_gun_ingredients = { { type = "item", name = "tantalum-plate", amount = 1 }, { type = "item", name = "thoriated-filament", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 2 } }
if mods["bismuth"] then
  table.insert(electron_gun_ingredients, { type = "item", name = "pcb-solder", amount = 2 })
end
if data.raw.item[glass_name] then
  table.insert(electron_gun_ingredients, { type = "item", name = glass_name, amount = 2 })
end
if mods["LasingAround-Updated"] then
  electron_gun_ingredients = { { type = "item", name = "tantalum-plate", amount = 1 }, { type = "item", name = "thoriated-filament", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 2 }, { type = "item", name = "empty-amplifier-tube", amount = 1 } }
  if mods["bismuth"] then
    table.insert(electron_gun_ingredients, { type = "item", name = "pcb-solder", amount = 2 })
  end
end
local electron_gun_subgroup = "intermediate-product"
if mods["space-exploration"] then
  electron_gun_subgroup = "electronic"
end
data:extend({
  {
    type = "item",
    name = "electron-gun",
    icon = "__Tantalite2__/graphics/icons/electron-gun.png",
    icon_size = 128,
    category = "intermediate-product",
    subgroup = electron_gun_subgroup,
    order = "e[electron-gun]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "electron-gun",
    category = "advanced-crafting",
    order = "e[electron-gun]",
    enabled = false,
    energy_required = 8,
    ingredients = electron_gun_ingredients,
    results = { { type = "item", name = "electron-gun", amount = 1 } },
  }
})

local crt_ingredients = { { type = "item", name = "electron-gun", amount = 1 }, { type = "item", name = "coal", amount = 1 }, { type = "item", name = "advanced-circuit", amount = 3 } }
if data.raw.item[glass_name] then
  table.insert(crt_ingredients, { type = "item", name = glass_name, amount = 3 })
end
local crt_subgroup = "intermediate-product"
if mods["bzcarbon2"] then
  crt_ingredients = { { type = "item", name = "electron-gun", amount = 1 }, { type = "item", name = "graphene", amount = 1 }, { type = "item", name = "advanced-circuit", amount = 3 } }
  if data.raw.item[glass_name] then
    table.insert(crt_ingredients, { type = "item", name = glass_name, amount = 3 })
  end
end
if mods["bzcarbon2"] and mods["bismuth"] and mods["bzaluminum2"] then
  crt_ingredients = { { type = "item", name = "electron-gun", amount = 1 }, { type = "item", name = "graphene", amount = 1 }, { type = "item", name = "advanced-circuit", amount = 3 }, { type = "item", name = "pcb-solder", amount = 3 }, { type = "item", name = "aluminum-plate", amount = 5 } }
  if data.raw.item[glass_name] then
    table.insert(crt_ingredients, { type = "item", name = glass_name, amount = 3 })
  end
end
if mods["space-exploration"] then
  crt_subgroup = "electronic"
end
data:extend({
  {
    type = "item",
    name = "crt",
    icon = "__Tantalite2__/graphics/icons/crt.png",
    icon_size = 64,
    category = "intermediate-product",
    subgroup = crt_subgroup,
    order = "c[crt]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "crt",
    category = "advanced-crafting",
    order = "c[crt]",
    enabled = false,
    energy_required = 12,
    ingredients = crt_ingredients,
    results = { { type = "item", name = "crt", amount = 1 } },
  }
})

local tantalum_capacitor_ingredients = { { type = "item", name = "tantalum-plate", amount = 1 }, { type = "item", name = "copper-cable", amount = 1 } }
local tantalum_capacitor_subgroup = "intermediate-product"
if mods["bzlead2"] or mods["manganese"] then
  tantalum_capacitor_ingredients = { { type = "item", name = "tantalum-plate", amount = 1 } }
  if mods["bzlead2"] then
    table.insert(tantalum_capacitor_ingredients, { type = "item", name = "lead-plate", amount = 1 })
  end
  if mods["manganese"] then
    table.insert(tantalum_capacitor_ingredients, { type = "item", name = "manganese-plate", amount = 1 })
  end
end
if mods["space-exploration"] then
  tantalum_capacitor_subgroup = "electronic"
end
data:extend({
  {
    type = "item",
    name = "tantalum-capacitor",
    icon = "__Tantalite2__/graphics/icons/tantalum-capacitor.png",
    icon_size = 64,
    subgroup = tantalum_capacitor_subgroup,
    order = "t",
    stack_size = 100,
  },
  {
    type = "item",
    name = "tantalum-titanium-beam",
    icon = "__Tantalite2__/graphics/icons/tantalum-titanium-beam.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "t",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "tantalum-capacitor",
    category = "advanced-crafting",
    order = "t",
    enabled = false,
    energy_required = 2,
    ingredients = tantalum_capacitor_ingredients,
    results = { { type = "item", name = "tantalum-capacitor", amount = 5 } },
  },
  {
    type = "recipe",
    name = "tantalum-titanium-beam",
    category = "crafting",
    order = "t",
    enabled = false,
    energy_required = 2,
    ingredients = { { type = "item", name = "tantalum-plate", amount = 2 }, (data.raw.item["titanium-plate"] and { type = "item", name = "titanium-plate", amount = 1 }) or { type = "item", name = "iron-plate", amount = 1 } },
    results = { { type = "item", name = "tantalum-titanium-beam", amount = 1 } },
  }
})
util.add_unlock("advanced-circuit", "tantalum-capacitor")
if mods["Krastorio2"] then
  util.add_ingredient("kr-electronic-components", "tantalum-capacitor", 2)
else
  util.add_ingredient("advanced-circuit", "tantalum-capacitor", 2)
end

if mods["space-exploration"] then
  data:extend({
    {
      type = "recipe",
      name = "tantalum-refining",
      category = "smelting",
      order = "h",
      enabled = false,
      energy_required = 8,
      ingredients = { { type = "item", name = "tantalite-ore", amount = 10 } },
      results = { { type = "item", name = "tantalum-plate", amount = 7 } },
    }
  })
  util.add_productivity("tantalum-refining")
end

util.add_productivity("thoriated-filament")
util.add_productivity("electron-gun")
util.add_productivity("crt")
util.add_productivity("tantalum-capacitor")