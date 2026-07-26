local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if mods["planet-muluna"] and settings.startup["cubium-and-more-compat-muluna"].value then
  khaoslib_technology:load {
    type = "technology",
    name = "muluna-greenhouses-cubium",
    localised_name = {"recipe-name.muluna-tree-growth-greenhouse-cubium"},
    icons = {
      {icon = "__muluna-graphics__/graphics/greenhouse/sprites/greenhouse-icon-big.png", icon_size = 640},
      {icon = "__cubium__/graphics/icons/fluid/liquid-hope.png", icon_size = 64, scale = 0.75, shift = {45, 45}},
    },
    prerequisites = {
      "muluna-greenhouses",
      "production-science-pack",
      "utility-science-pack",
      "space-science-pack",
      "interstellar-science-pack",
      "cube-mastery-3",
    },
    effects = {
      {type = "unlock-recipe", recipe = "carbon-dioxide"},
      {type = "unlock-recipe", recipe = "muluna-tree-growth-greenhouse-cubium"},
      {type = "unlock-recipe", recipe = "muluna-tree-growth-greenhouse-water-saving-cubium"},
    },
    unit = {
      time = 60,
      count = 5000,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"interstellar-science-pack", 1},
      },
    },
  } :commit()
end
