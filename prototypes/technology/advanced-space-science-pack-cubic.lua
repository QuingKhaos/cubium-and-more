
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

if mods["planet-muluna"] and settings.startup["cubium-and-more-compat-muluna"].value then
  local muluna_pack_icons = khaoslib_technology.get_icons("advanced-space-science-pack")

  local icons = util.combine_icons(
    {{icon = "__cubium__/graphics/technology/ultradense-technology.png", icon_size = 256}},
    {muluna_pack_icons[1]},
    {scale = 3.2, shift = {3, -10}},
    256
  )

  icons = util.combine_icons(icons, {muluna_pack_icons[2]}, {scale = 0.8, shift = {3, -10}}, 64)

  khaoslib_technology.copy("advanced-space-science-pack", "advanced-space-science-pack-cubic")
    :set {localised_description = {"technology-description.advanced-space-science-pack"}}
    :set_icons(icons)
    :clear_prerequisites()
    :add_prerequisite("cube-mastery-4")
    :add_prerequisite("advanced-space-science-pack")
    :merge_unit {time = 15, count = 1}
    :clear_effects()
    :add_unlock_recipe("space-science-pack-cubic")
    :commit()
end
