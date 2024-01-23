# lua-string-format-all

[![test](https://github.com/mah0x211/lua-string-format-all/actions/workflows/test.yml/badge.svg)](https://github.com/mah0x211/lua-string-format-all/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/mah0x211/lua-string-format-all/branch/master/graph/badge.svg)](https://codecov.io/gh/mah0x211/lua-string-format-all)


A submodule of the https://github.com/mah0x211/lua-string-format module.

## Installation

```sh
luarocks install string-format-all
```


## s = format( fmt [, ... ] )

converts the specified arguments to formatted output using `lua-string-format` module, and unused arguments are converted to string using `tostring` function and concatenated to the end of the formatted output.

**Parameters**

- `fmt:string`: the format string that describes the format of the output.
- `...:any`: the arguments to be converted to formatted output according to the format string.

**Returns**

- `s:string`: the formatted output string.

## Usage

```lua
local format = require('string.format.all')

-- format all arguments to string
local s = format('hello %q', 'format', 'all')
print(s) --> hello "format" all
```


## License

The MIT License (MIT)
