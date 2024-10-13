-- ~/.config/yazi/init.lua

-- https://github.com/yazi-rs/plugins/tree/main/full-border.yazi
require("full-border"):setup()

-- https://github.com/dedukun/relative-motions.yazi
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })

-- https://github.com/yazi-rs/plugins:git
require("git"):setup()
