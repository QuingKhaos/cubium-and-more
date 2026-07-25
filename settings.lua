local khaoslib_setting = require("__khaoslib__.settings.setting")

khaoslib_setting:load{
  type = "bool-setting",
  name = "cubium-and-more-science-pack-reorganization",
  setting_type = "startup",
  default_value = true,
  order = "a[tweaks]-a[science-pack-reorganization]",
} :commit()
