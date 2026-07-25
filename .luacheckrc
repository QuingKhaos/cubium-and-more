--- @diagnostic disable: undefined-global

include_files = {
  "**/*.lua",
  ".luacheckrc",
}

exclude_files = {
  ".git/**",
  ".lua/**",
  ".luarocks/**",
}

files["**/*.lua"] = {
  std = "lua52",
  globals = {
    "commands",
    "data",
    "defines",
    "feature_flags",
    "game",
    "helpers",
    "log",
    "mods",
    "prototypes",
    "rcon",
    "rendering",
    "remote",
    "script",
    "serpent",
    "settings",
    "storage",
    "util",
  },
}

-- Code quality settings
max_line_length = false
