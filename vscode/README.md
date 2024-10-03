#  `cj`
##  Cangjie-inspired script language
### OCaml prototype for native Linux

(c) Dmitry Ponyatov <<dponyatov@gmail.com>> 2024 MIT

github: https://github.com/ponyatov/cj

Cangjie(tm) is a trademark of Huawei Technologies Co. Ltd.

## VSCode extension

github: https://github.com/ponyatov/cj/tree/shadow/vscode

## Requirements

- VSCode >= 1.65.0
- OCaml
- Linux (Debian 12)

## Extension Settings

This extension contributes the following settings:

- `cj.Path`: The absolute path to toolchain root

## Report Issues

https://github.com/ponyatov/cj/issues

## OCaml-powered extension

This extension uses `js_of_ocaml` to produce its `./extension.js` code:

https://github.com/ocsigen/js_of_ocaml

```shell
cd ~/cj/vscode
make install
```

- Ctrl+Shift+P
- Developer: Install Extension From Location... `~/cj/vscode`

```shell
cd ~/cj/vscode
make extension
```

- Ctrl+Shift+P
- Developer: Reload Window
