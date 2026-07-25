local khaoslib_item_subgroup = require("__khaoslib__.prototypes.item-subgroup")

if mods["science-tab"] then
  khaoslib_item_subgroup:load {
    type = "item-subgroup",
    name = "cubic-basic-science-pack",
    group = "science",
    order = "p[cubic-science]",
  } :commit()
end
