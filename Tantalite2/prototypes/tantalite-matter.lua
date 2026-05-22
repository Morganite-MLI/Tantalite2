-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("data-util")

local icon = {
    icon = "__Tantalite2__/graphics/icons/tantalum-ore.png",
    icon_size = 64,
    scale = 1,
    }

  util.k2matter({k2matter = {
  material = { type = "item", name = "tantalite-ore", amount = 10 },
  matter_count = 5,
  energy_required = 1,
  needs_stabilizer = false,
  unlocked_by = "tantalite-matter-processing"
}, icon = icon})

  util.k2matter({k2matter = {
  material = { type = "item", name = "tantalum-plate", amount = 10 },
  matter_count = 10,
  energy_required = 3,
  only_deconversion = true,
  needs_stabilizer = true,
  unlocked_by = "tantalite-matter-processing"
}})

  util.k2matter({k2matter = {
  material = { type = "item", name = "niobium-plate", amount = 10 },
  matter_count = 10,
  energy_required = 3,
  only_deconversion = true,
  needs_stabilizer = true,
  unlocked_by = "tantalite-matter-processing"
}})

end