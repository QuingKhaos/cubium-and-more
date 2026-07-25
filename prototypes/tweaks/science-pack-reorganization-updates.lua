local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")

if settings.startup["cubium-and-more-science-pack-reorganization"].value then
  if not mods["science-tab"] then
    local cubic_science_packs = khaoslib_recipe.find(function(recipe)
      return recipe.name:match("science%-pack%-cubic") ~= nil
    end)

    for _, recipe in pairs(cubic_science_packs) do
      local orig_science_pack = recipe:gsub("%-cubic", "")

      khaoslib_recipe:load(recipe)
        :set {subgroup = "cubic-science"}
        :set {order = data.raw["tool"][orig_science_pack].order}
        :commit()
    end
  end
end
