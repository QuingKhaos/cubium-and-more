local khaoslib_list = require("__khaoslib__.common.list")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local khaoslib_tool = require("__khaoslib__.prototypes.tool")

if settings.startup["cubium-and-more-cubic-space-science-pack"].value then
  local cubic_ingredients = khaoslib_recipe.get_ingredients("space-science-pack")
  khaoslib_list.add(cubic_ingredients, {type = "item", name = "energized-microcube", amount = 1}, function(ingredient)
    return ingredient.name == "energized-microcube"
  end)
  khaoslib_list.add(cubic_ingredients, {type = "fluid", name = "dream-concentrate", amount = 200}, function(ingredient)
    return ingredient.name == "dream-concentrate"
  end)

  local cubic_space_science_pack = {
    category = "advanced-crafting",
    subgroup = settings.startup["cubium-and-more-science-pack-reorganization"].value and (mods["science-tab"] and "cubic-basic-science-pack" or "cubic-science") or "cubic",
    icons = util.combine_icons({{icon = "__cubium__/graphics/icons/matter-cube.png", scale = 0.9}}, khaoslib_tool.get_icons("space-science-pack"), {scale = 1.2}, 64),
    localised_name = {"item-name.space-science-pack"},
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    result_is_always_fresh = true,
    order = settings.startup["cubium-and-more-science-pack-reorganization"].value and khaoslib_recipe.get("space-science-pack").order or "aa",
    ingredients = cubic_ingredients,
    results = {
      -- Merges with the original space science pack results and overwrites the amount of space science packs to 10, adds an energized microcube, while adding the dormant microcube as additional result.
      {type = "item", name = "space-science-pack", amount = 10},
      {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false},
    },
  }

  khaoslib_recipe.copy("space-science-pack", "space-science-pack-cubic")
    :set(cubic_space_science_pack)
    :add_unlock("cube-mastery-4")
    :commit()
end
