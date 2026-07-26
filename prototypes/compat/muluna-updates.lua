local lib = require("__cubium-and-more__.prototypes.lib")

if mods["planet-muluna"] and settings.startup["cubium-and-more-compat-muluna"].value then
  lib.create_cubic_science_pack {
    name = "interstellar-science-pack",
    cubic = "interstellar-science-pack-cubic",
    recipe = "interstellar-science-pack",
    preq = "interstellar-science-pack",
    copy_tech = "muluna-telescope",
    subgroup = "cubic-science-pack",
    fluidbox_index = 1,
  }
end
