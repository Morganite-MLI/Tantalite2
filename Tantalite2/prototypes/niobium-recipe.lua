local util = require("data-util")

data:extend({{
  type = "item-subgroup",
  name = "cable",
  group = "intermediate-products",
  order = "a"
}})

data:extend({
    {
      type = "item",
      name = "niobium-plate",
      icon = "__Tantalite2__/graphics/icons/niobium-plate.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "b[niobium-plate]",
      stack_size = 100
    },
  })
  data:extend({
    {
      type = "item",
      name = "heatsink",
      icon = "__Tantalite2__/graphics/icons/heatsink.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "h",
      stack_size = 100,
    },
    {
      type = "recipe",
      name = "heatsink",
      category = "crafting",
      order = "h",
      enabled = false,
      energy_required = 5,
      ingredients = {{type="item", name="tantalum-plate", amount=2}, {type="item", name="niobium-plate", amount=2}},
      results = {{type="item", name="heatsink", amount=1}},
    }
  })

  local niobium_tin_cable_ingredients = {{type="item", name="niobium-plate", amount=1}}
  if data.raw.item["tin-plate"] then
    table.insert(niobium_tin_cable_ingredients, {type="item", name="tin-plate", amount=1})
  end

  data:extend({
    {
      type = "item",
      name = "niobium-tin-cable",
      icon = "__Tantalite2__/graphics/icons/niobium-tin-cable.png",
      icon_size = 64,
      subgroup = "cable",
      order = "n",
      stack_size = 200,
    },
    {
      type = "recipe",
      name = "niobium-tin-cable",
      category = "crafting",
      order = "n",
      enabled = false,
      energy_required = 2,
      ingredients = niobium_tin_cable_ingredients,
      results = {{type="item", name="niobium-tin-cable", amount=2}},
    }
  })

  local advanced_multi_cylinder_engine_ingredients = {{type="item", name="engine-unit", amount=2}, {type="item", name="heatsink", amount=2}}
  if mods["IfNickel-Updated"] and data.raw.item["advanced-flow-controller"] then
    table.insert(advanced_multi_cylinder_engine_ingredients, {type="item", name="advanced-flow-controller", amount=1})
  end
  local advanced_multi_cylinder_engine_subgroup = "intermediate-product"
  if mods["IfNickel-Updated"] then
    advanced_multi_cylinder_engine_subgroup = "engine-components"
  end
  data:extend({
    {
      type = "item",
      name = "advanced-multi-cylinder-engine",
      icon = "__Tantalite2__/graphics/icons/advanced-multi-cylinder-engine.png",
      icon_size = 64,
      group = "intermediate-product",
      subgroup = advanced_multi_cylinder_engine_subgroup,
      order = "f",
      stack_size = 100,
    },
    {
      type = "recipe",
      name = "advanced-multi-cylinder-engine",
      category = "crafting",
      order = "f",
      enabled = false,
      energy_required = 10,
      ingredients = advanced_multi_cylinder_engine_ingredients,
      results = {{type="item", name="advanced-multi-cylinder-engine", amount=1}},
    }
  })

  local automation_core2_ingredients = {{type="item", name="copper-plate", amount=10}, {type="item", name="niobium-plate", amount=10}}
  local automation_core2_subgroup = "intermediate-product"
  if (mods["BrassTacks-Updated"] and data.raw.item["gearbox"]) and (mods["IfNickel-Updated"] and data.raw.item["flow-controller"]) then --check for hardmode
    automation_core2_ingredients = {{type="item", name="gearbox", amount=1}, {type="item", name="motorized-articulator", amount=2}, {type="item", name="machining-tool", amount=1}, {type="item", name="flow-controller", amount=1}, {type="item", name="niobium-plate", amount=4}}
    automation_core2_subgroup = "articulated-components"
  end
  data:extend({
    {
      type = "item",
      name = "automation-core-2",
      icon = "__Tantalite2__/graphics/icons/automation-core-2.png",
      icon_size = 64,
      group = "intermediate-product",
      subgroup = automation_core2_subgroup,
      order = "d",
      stack_size = 50,
    },
    {
      type = "recipe",
      name = "automation-core-2",
      category = "crafting",
      order = "d",
      enabled = false,
      energy_required = 5,
      ingredients = automation_core2_ingredients,
      results = {{type="item", name="automation-core-2", amount=1}},
    }
  })

if mods["248k-Redux"] and mods["space-exploration"] then
  data:extend({
    {
      type = "recipe",
      name = "energy-pyroflux",
      icons = {
        { icon = "__space-exploration-graphics__/graphics/icons/fluid/pyroflux.png", icon_size = 64},
        { icon = "__248k-Redux-graphics__/ressources/fusion/fu_materials/fu_materials_energy_crystal.png", icon_size = 64, scale=0.3, shift= {-8, -8}},
      },
      category = "chemistry",
      order = "h",
      enabled = false,
      energy_required = 8,
      ingredients = {{type="item", name="niobium-plate", amount = 1}, {type="item", name="fu_materials_energy_crystal", amount=1}, { type = "fluid", name = "se-liquid-rocket-fuel", amount = 10 }},
      results = {{ type = "fluid", name = "se-pyroflux", amount = 10 }},
    }
  })
end

if mods["space-exploration"] then
  data:extend({
    {
      type = "recipe",
      name = "niobium-refining",
      category = "smelting",
      order = "h",
      enabled = false,
      energy_required = 8,
      ingredients = {{type="item", name="tantalite-ore", amount=10}},
      results = {{type="item", name="niobium-plate", amount=7}},
    }
  })
  util.add_productivity("niobium-refining")
end

  util.add_productivity("automation-core-2")
  util.add_productivity("heatsink")
  util.add_productivity("advanced-multi-cylinder-engine")
  util.add_productivity("niobium-tin-cable")