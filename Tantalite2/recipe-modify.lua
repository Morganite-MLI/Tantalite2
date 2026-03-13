local util = require("__bzlib__/data-util")

-- Main vanilla changes
util.replace_ingredient("laser-turret", "electronic-circuit", "electron-gun", 5)
util.remove_ingredient("laser-turret", mods["Krastorio2"] and "kr-glass" or "glass")

util.add_ingredient("rocket-control-unit", "crt", 1)
util.remove_ingredient("rocket-control-unit", mods["Krastorio2"] and "kr-glass" or "glass")

util.replace_ingredient("heat-exchanger", "copper-plate", "tantalum-plate",50)
util.replace_ingredient("heat-pipe", "copper-plate", "tantalum-plate",20)

util.add_ingredient("assembling-machine-2", "automation-core-2", 1)

util.add_unlock("processing-unit", "niobium-tin-cable")
util.add_unlock("automation-2","automation-core-2")
-- Mod changes
if mods["bismuth"] then
    util.remove_ingredient("laser-turret", "pcb-solder")
    util.remove_ingredient("rocket-control-unit", "pcb-solder")
end

if mods["bzcarbon2"] then
    util.remove_ingredient("rocket-control-unit", "graphene")
end

if mods["MDbobelectronics2"] then
    util.remove_ingredient("superior-circuit-board", "gold-ingot")
    util.remove_ingredient("superior-circuit-board", "tin-plate")
    util.remove_ingredient("superior-circuit-board", "advanced-circuit")
    util.add_ingredient("superior-circuit-board", "circuit-board", 10)
    util.add_ingredient("superior-circuit-board", "niobium-tin-cable", 20)

    util.replace_ingredient("multi-layer-circuit-board", "copper-plate", "superior-circuit-board", 2)
    util.replace_ingredient("multi-layer-circuit-board", "tin-plate", "intergrated-electronics", 2)
end

if mods["aai-industry"] then
    if mods["Krastorio2"] then
        util.remove_ingredient("kr-atmospheric-condenser", mods["IfNickel-Updated"] and "flow-controller")
        util.replace_ingredient("kr-atmospheric-condenser", "engine-unit", "advanced-multi-cylinder-engine")
    end
    if mods["aai-vehicles-miner"] then
        util.replace_ingredient("vehicle-miner-mk4", "electric-engine-unit", "advanced-multi-cylinder-engine", 10)
    end
    if mods["EndgameCombat"] then
        util.replace_ingredient("better-tank", "engine-unit", "advanced-multi-cylinder-engine", 12)
    end
    if mods["space-exploration"] then
        if mods["bzaluminum2"] then
            util.remove_ingredient("se-fluid-burner-generator", "spark-plug")
        end
        util.replace_ingredient("se-fluid-burner-generator", "electric-motor", "advanced-multi-cylinder-engine", 5)
    end
    if mods["248k-Redux"] then
        util.replace_ingredient("fi_refinery_recipe", "engine-unit", "advanced-multi-cylinder-engine", 10)
        util.remove_ingredient("fi_refinery_recipe",mods["IfNickel-Updated"] and "advanced-flow-controller")
    end
    if mods["FluidMustFlow"] then
        util.replace_ingredient("duct-end-point-intake", "engine-unit", "advanced-multi-cylinder-engine", 3)
        util.remove_ingredient("duct-end-point-intake",mods["IfNickel-Updated"] and "advanced-flow-controller")

        util.replace_ingredient("duct-end-point-outtake", "engine-unit", "advanced-multi-cylinder-engine", 3)
        util.remove_ingredient("duct-end-point-outtake",mods["IfNickel-Updated"] and "advanced-flow-controller")
    end
    if mods["angelsaddons-cab"] then
        util.replace_ingredient("angels-cab", "engine-unit", "advanced-multi-cylinder-engine", 10)
    end
end

if mods["248k-Redux"] then
    util.add_ingredient("fi_robo_port_recipe", "tantalum-titanium-beam", 10)
end

if mods["bobassembly"] then
    --chemical plant 2
    util.add_ingredient("chemical-plant-2", "advanced-multi-cylinder-engine", 2)
    util.add_prerequisite("chemical-plant-2", "advanced-multi-cylinder-engine")
    --oil refinery 2
    util.add_ingredient("oil-refinery-2", "advanced-multi-cylinder-engine", 4)
    util.add_prerequisite("oil-processing-2", "advanced-multi-cylinder-engine")

    util.remove_ingredient("chemical-plant-4", "steel-plate")
    util.add_ingredient("chemical-plant-4", "tantalum-titanium-beam", 10)

    util.add_ingredient("bob-area-mining-drill-4", "tantalum-titanium-beam", 8)
    util.add_ingredient("bob-mining-drill-4", "tantalum-titanium-beam", 8)

    util.remove_ingredient("electronics-machine-3", "tungsten-carbide")
    util.add_ingredient("electronics-machine-3", "cobalt-carbide", 1)

    util.remove_ingredient("centrifuge-3", "steel-plate")
    util.add_ingredient("centrifuge-3", "tantalum-titanium-beam", 50)

    util.remove_ingredient("oil-refinery-4", "titanium-plate")
    util.add_ingredient("oil-refinery-4", "tantalum-titanium-beam", 15)

    util.remove_ingredient("bob-pumpjack-4", "steel-plate")
    util.add_ingredient("bob-pumpjack-4", "tantalum-titanium-beam", 20)
end


if mods["Krastorio2"] then
    util.replace_ingredient("kr-portable-generator-equipment", "engine-unit", "advanced-multi-cylinder-engine",1)

    if mods["BrassTacks-Updated"] then
        util.remove_ingredient("assembling-machine-2", mods["BrassTacks-Updated"] and "gearbox")
        util.remove_ingredient("assembling-machine-2", mods["BrassTacks-Updated"] and "motorized-articulator")
    end

    if mods["IfNickel-Updated"] then
        util.remove_ingredient("assembling-machine-2", mods["IfNickel-Updated"] and "machining-tool")
        util.remove_ingredient("assembling-machine-2", mods["IfNickel-Updated"] and "flow-controller")
    end
end

if mods["space-exploration"] then
    util.add_product(mods["space-exploration"] and "se-scrap-recycling", { type = "item", name = "tantalite-ore", amount=1, probability=0.05})
    util.remove_ingredient("se-superconductive-cable", "tin-plate")
    util.add_ingredient("se-superconductive-cable", "niobium-tin-cable", 2)

    util.add_ingredient("se-conductivity-data","tantalum-plate", 1)
    util.set_ingredient("se-conductivity-data", "se-empty-data", 2)
    util.set_product_amount("se-conductivity-data", "se-conductivity-data", 2)

    util.add_ingredient("se-hot-thermodynamics-data","tantalum-plate", 1)
    util.set_ingredient("se-hot-thermodynamics-data", "se-empty-data", 4)
    util.set_product_amount("se-hot-thermodynamics-data", "se-hot-thermodynamics-data", 4)

    util.remove_ingredient("se-space-rail", "titanium-plate-plate")
    util.add_ingredient("se-space-rail","tantalum-titanium-beam", 50)

    util.remove_ingredient("se-space-platform-scaffold", "steel-plate")
    util.remove_ingredient("se-space-platform-scaffold", "titanium-plate")
    util.add_ingredient("se-space-platform-scaffold", "tantalum-titanium-beam", 1)

    util.set_ingredient("se-heavy-girder", "se-iridium-plate", 3)
    util.add_ingredient("se-heavy-girder", "tantalum-plate", 1)

    util.remove_ingredient("se-energy-beam-defence", "steel-plate")
    util.add_ingredient("se-energy-beam-defence", "tantalum-titanium-beam", 200)

    util.set_ingredient("se-material-science-pack-1","se-iridium-plate", 10)
    util.add_ingredient("se-material-science-pack-1", "niobium-plate", 10)

    util.set_ingredient("se-material-science-pack-2","se-heavy-girder", 5)
    util.add_ingredient("se-material-science-pack-2", "tantalum-titanium-beam", 10)

    util.add_ingredient("se-heavy-bearing", "niobium-plate", 10)
    util.add_time("se-heavy-bearing", 10)
    util.set_product_amount("se-heavy-bearing", "se-heavy-bearing", 10)

    util.set_ingredient("se-energy-science-pack-1","se-holmium-plate", 10)
    util.add_ingredient("se-energy-science-pack-1", "niobium-tin-cable", 10)

    if mods["Krastorio2"] then
        util.remove_ingredient("kr-advanced-solar-panel", "solar-panel")
        util.add_ingredient("kr-advanced-solar-panel", "niobium-tin-cable", 4)
        util.add_ingredient("bio-advanced-solar-panel", "niobium-tin-cable", 4)
    end
end