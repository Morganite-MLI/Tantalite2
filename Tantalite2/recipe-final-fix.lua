local util = require("__bzlib__/data-util")

util.remove_ingredient("rocket-control-unit", mods["Krastorio2"] and "kr-glass" or "glass")
util.remove_ingredient("rocket-control-unit", "advanced-circuit")
util.add_ingredient("rocket-control-unit", "advanced-circuit", 2)

if mods["space-exploration"] then
    util.add_product("se-core-fragment-omni",{ type = "item", name = "tantalite-ore", amount = 1 })
end

if mods["bzaluminum2"] then
    --stop bz aluminum from replacing electronic circuit. Not sure why it does that
    util.replace_ingredient("electron-gun", "aluminum-cable", "electronic-circuit")
    util.remove_ingredient("rocket-control-unit", "aluminum-plate")
end