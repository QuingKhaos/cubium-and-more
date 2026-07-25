local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

if settings.startup["cubium-and-more-science-pack-reorganization"].value then
  if mods["science-tab"] then
    local nauvis_science_packs = {
      "automation",
      "logistic",
      "military",
      "chemical",
      "production",
      "utility",
      --"space",
    }

    for _, pack in pairs(nauvis_science_packs) do
      local recipe = pack .. "-science-pack-cubic"

      if khaoslib_recipe.exists(recipe) then
        khaoslib_recipe:load(recipe)
          :set {subgroup = "cubic-basic-science-pack"}
          :commit()
      end
    end
  end
end
