package = "string-format-all"
version = "dev-1"
source = {
    url = "git+https://github.com/mah0x211/lua-string-format-all.git",
}
description = {
    summary = "A submodule of the lua-string-format module.",
    homepage = "https://github.com/mah0x211/lua-string-format-all",
    license = "MIT/X11",
    maintainer = "Masatoshi Fukunaga",
}
dependencies = {
    "lua >= 5.1",
    "string-format >= 0.1.0",
}
build = {
    type = "builtin",
    modules = {
        ["string.format.all"] = "all.lua",
    },
}