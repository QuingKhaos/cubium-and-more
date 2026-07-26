local khaoslib_setting = require("__khaoslib__.settings.setting")

khaoslib_setting:load{
  type = "bool-setting",
  name = "cubium-and-more-cubic-space-science-pack",
  setting_type = "startup",
  default_value = true,
  order = "a[tweaks]-a[cubic-space-science-pack]",
} :commit()

khaoslib_setting:load{
  type = "bool-setting",
  name = "cubium-and-more-planet-discovery-prerequisites",
  setting_type = "startup",
  default_value = false,
  order = "a[tweaks]-a[planet-discovery-prerequisites]",
} :commit()

khaoslib_setting:load{
  type = "bool-setting",
  name = "cubium-and-more-science-pack-reorganization",
  setting_type = "startup",
  default_value = true,
  order = "a[tweaks]-a[science-pack-reorganization]",
} :commit()
