local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

local tech = khaoslib_technology:load("cubic-science-pack-productivity-infinite")

local packs = {
  -- Muluna
  "space-science-pack-muluna-cubic",
}

for _, pack in pairs(packs) do
  if khaoslib_recipe.exists(pack) then
    tech:add_effect {
      type = "change-recipe-productivity",
      recipe = pack,
      change = 0.03
    }
  end
end

tech:commit()
