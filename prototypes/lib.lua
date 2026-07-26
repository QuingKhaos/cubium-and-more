local flib_locale = require("__flib__.locale")
local khaoslib_recipe = require("__khaoslib__.prototypes.recipe")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")
local khaoslib_tool = require("__khaoslib__.prototypes.tool")

--- @class CubiumAndMore.lib
local lib = {}

--- @class CubiumAndMore.CubicSciencePackDefinition
--- @field name string The name of the original science pack item.
--- @field cubic string The name of the cubic version of the science pack item.
--- @field recipe string The name of the recipe for the original science pack.
--- @field preq string The name of the prerequisite technology for the cubic science pack.
--- @field copy_tech string The name of the technology to copy for the cubic science pack.
--- @field subgroup string The subgroup for the cubic science pack item.
--- @field fluidbox_index? integer The index of the fluidbox to use for the dream concentrate ingredient. Defaults to automatic if not specified.

--- @param def CubiumAndMore.CubicSciencePackDefinition
function lib.create_cubic_science_pack(def)
  if khaoslib_recipe.exists(def.recipe) and khaoslib_tool.exists(def.name) then
    local order = khaoslib_tool.get(def.name).order or "ab"
    order = khaoslib_recipe.get(def.recipe).order or order

    local recipe_icons = {{icon = "__cubium__/graphics/icons/matter-cube.png", scale = 0.9}}
    local recipe_icons_to_merge = khaoslib_recipe.get_icons(def.recipe)
    recipe_icons_to_merge = #recipe_icons_to_merge == 0 and khaoslib_tool.get_icons(def.name) or recipe_icons_to_merge

    recipe_icons = util.combine_icons(recipe_icons, recipe_icons_to_merge, {scale = 1.2}, 64)

    khaoslib_recipe.copy(def.recipe, def.cubic)
      :set_icons(recipe_icons)
      :set {
        subgroup = settings.startup["cubium-and-more-science-pack-reorganization"].value and (mods["science-tab"] and def.subgroup or "cubic-science") or "cubic",
        localised_name = flib_locale.of("recipe", def.recipe),
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        result_is_always_fresh = true,
        order = settings.startup["cubium-and-more-science-pack-reorganization"].value and order or "ab",
      }
      :add_ingredient {type = "item", name = "energized-microcube", amount = 1}
      :add_ingredient {type = "fluid", name = "dream-concentrate", amount = 200, fluidbox_index = def.fluidbox_index}
      :replace_result(function(result)
          return result.name == def.name
        end, function(result)
          result.amount = result.amount and result.amount * 4 or nil
          return result
        end)
      :add_result {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false}
      :commit()

    local tech_icons = {{icon = "__cubium__/graphics/technology/ultradense-technology.png", icon_size = 256}}
    tech_icons = util.combine_icons(tech_icons, khaoslib_technology.get_icons(def.name), {scale = 3.2, shift = {1, -10}}, 256)

    local tech = khaoslib_technology.copy(def.copy_tech, def.cubic)
      :set_icons(tech_icons)
      :unset("localised_name")
      :unset("localised_description")
      :clear_prerequisites()
      :add_prerequisite("cube-mastery-4")
      :add_prerequisite(def.preq)
      :merge_unit {time = 15, count = 1}
      :add_science_pack {def.name, 1}
      :clear_effects()
      :add_unlock_recipe(def.cubic)

      tech:commit()
  end
end

return lib
