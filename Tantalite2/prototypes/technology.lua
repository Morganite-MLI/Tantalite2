local util = require("data-util")

local electron_emitter_prerequisites = {"laser"}
if mods["248k-Redux"] then
  electron_emitter_prerequisites = {"fi_purifier_2_tech", "laser"}
end

data:extend(
{
  {
    type = "technology",
    name = "electron-emitter",
    icons = {
        { icon = "__Tantalite2__/graphics/icons/electron-gun.png", icon_size = 128}
      },
    prerequisites = electron_emitter_prerequisites,
    effects = {
        {
          type = "unlock-recipe",
          recipe = "electron-gun",
        },
        {
          type = "unlock-recipe",
          recipe = "thoriated-filament",
        },
    },
    unit =
  	{
      count = 200,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 30
    }
  },
})
util.add_prerequisite("laser-turret", "electron-emitter")

local crt_prerequisites = {"electron-emitter"}
if mods["bzcarbon"] then
  crt_prerequisites = {"graphene", "electron-emitter"}
end
data:extend(
{
  {
    type = "technology",
    name = "cathode-ray-tube",
    icons = {
        { icon = "__Tantalite2__/graphics/icons/crt.png", icon_size = 64}
      },
    prerequisites = crt_prerequisites,
    effects = {
        {
          type = "unlock-recipe",
          recipe = "crt",
        }
    },
    unit =
  	{
      count = 300,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 30
    }
  },
})
util.add_prerequisite("rocket-control-unit", "cathode-ray-tube")

local advanced_multi_cylinder_engine_tech = {"chemical-science-pack"}
local advanced_tantalum_processing_pre = {"chemical-science-pack"}
if mods["IfNickel-Updated"] and data.raw.item["advanced-flow-controller"] then
  advanced_multi_cylinder_engine_tech = {"advanced-flow-controller"}
end
if mods["bztitanium"] then
  advanced_tantalum_processing_pre = {"titanium-processing"}
end
data:extend(
    {
      {
        type = "technology",
        name = "advanced-multi-cylinder-engine",
        icons = {
            { icon = "__Tantalite2__/graphics/icons/advanced-multi-cylinder-engine.png", icon_size = 64}
          },
        prerequisites = advanced_multi_cylinder_engine_tech,
        effects = {
            {
              type = "unlock-recipe",
              recipe = "advanced-multi-cylinder-engine",
            },
            {
              type = "unlock-recipe",
              recipe = "heatsink",
            }
        },
        unit =
        {
          count = 250,
          ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 }
          },
          time = 30
        }
      },
      {
        type = "technology",
        name = "advanced-tantalum-processing",
        icons = {
            { icon = "__Tantalite2__/graphics/icons/tantalum-titanium-beam.png", icon_size = 64}
          },
        prerequisites = advanced_tantalum_processing_pre,
        effects = {
            {
              type = "unlock-recipe",
              recipe = "tantalum-titanium-beam",
            }
        },
        unit =
        {
          count = 200,
          ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 }
          },
          time = 30
        }
      }
    })
    if mods["248k-Redux"] and mods["space-exploration"] then
      data:extend(
      {
        {
          type = "technology",
          name = "energy-pyroflux",
          icons = {
            { icon = "__space-exploration-graphics__/graphics/icons/fluid/pyroflux.png", icon_size = 64},
            { icon = "__248k-Redux__/ressources/fusion/fu_materials/fu_materials_energy_crystal.png", icon_size = 64, scale=0.3, shift= {-8, -8}},
          },
          prerequisites = {"se-energy-science-pack-1"},
          effects = {
              {
                type = "unlock-recipe",
                recipe = "energy-pyroflux",
              }
          },
          unit =
          {
            count = 100,
            ingredients =
            {
              { "automation-science-pack", 1 },
              { "logistic-science-pack", 1 },
              { "chemical-science-pack", 1 },
              {"se-rocket-science-pack", 1},
              {"space-science-pack", 1},
              {"production-science-pack", 1},
              {"utility-science-pack", 1},
              {"se-energy-science-pack-1", 1}
            },
            time = 60
          }
        },
      })
    end

    if mods["space-exploration"] then
      data:extend(
      {
        {
          type = "technology",
          name = "targeted-tantalite-refining",
          icons = {
            { icon = "__Tantalite2__/graphics/icons/tantalite-ore.png", icon_size = 64},
            { icon = "__Tantalite2__/graphics/icons/niobium-plate.png", icon_size = 64, scale=0.3, shift= {-8, -8}},
            { icon = "__Tantalite2__/graphics/icons/tantalum-plate.png", icon_size = 64, scale=0.3, shift= {8, -8}},
          },
          prerequisites = {"se-material-science-pack-1"},
          effects = {
              {
                type = "unlock-recipe",
                recipe = "tantalum-refining",
              },
              {
                type = "unlock-recipe",
                recipe = "niobium-refining",
              }
          },
          unit =
          {
            count = 100,
            ingredients =
            {
              {"automation-science-pack", 1 },
              {"logistic-science-pack", 1 },
              {"chemical-science-pack", 1 },
              {"se-rocket-science-pack", 1},
              {"space-science-pack", 1},
              {"production-science-pack", 1},
              {"utility-science-pack", 1},
              {"se-material-science-pack-1", 1}
            },
            time = 60
          }
        },
      })
    end