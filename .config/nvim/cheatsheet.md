# Neovim Cheatsheet

## Snacks Picker
| Key          | Action                        |
|--------------|-------------------------------|
| `<leader>ff` | Find files                    |
| `<leader>fa` | Find all files (incl. hidden) |
| `<leader>fw` | Live grep                     |
| `<leader>fb` | Find buffers                  |
| `<leader>fh` | Help tags                     |
| `<leader>fo` | Recent files                  |
| `<leader>fz` | Grep in current buffer        |
| `<leader>*`  | Grep word under cursor        |

---

## nvim-surround
Mnemonic: **y**ou **s**urround, **c**hange **s**urround, **d**elete **s**urround

| Key           | Action                              | Example                     |
|---------------|-------------------------------------|-----------------------------|
| `ysiw"`       | Wrap word in double quotes          | `hello` → `"hello"`        |
| `ysiw(`       | Wrap word in parens (with spaces)   | `hello` → `( hello )`      |
| `ysiw)`       | Wrap word in parens (no spaces)     | `hello` → `(hello)`        |
| `ysip"`       | Wrap paragraph in quotes            |                             |
| `yss"`        | Wrap entire line in quotes          |                             |
| `cs"'`        | Change `"double"` to `'single'`     | `"hi"` → `'hi'`            |
| `cs({`        | Change `(parens)` to `{ braces }`   | `(x)` → `{ x }`            |
| `cs<em>`      | Change tag to `<em>`                |                             |
| `ds"`         | Delete surrounding quotes           | `"hello"` → `hello`        |
| `dst`         | Delete surrounding HTML tag         | `<b>hi</b>` → `hi`         |

---

## mini.ai — Extended Text Objects
Works with any operator: `d`, `v`, `c`, `y`
- `i` = **inner** (no delimiters)
- `a` = **around** (includes delimiters / whitespace)

| Text Object | Selects                          | Example keys            |
|-------------|----------------------------------|-------------------------|
| `f`         | Function (body + signature)      | `daf`, `vif`, `cif`     |
| `c`         | Class                            | `dac`, `vic`            |
| `a`         | Argument / parameter             | `daa`, `via`, `cia`     |
| `,`         | Argument incl. comma             | `va,` (select arg+,)    |
| `q`         | Quote (any: `"` `'` `` ` ``)    | `viq`, `diq`, `ciq`     |
| `b`         | Block (if/loop/etc.)             | `dab`, `vib`            |
| `t`         | HTML/XML tag                     | `vit`, `dat`            |
| `)`  `(`    | Parens                           | `vi)`, `da(`            |
| `]`  `[`    | Brackets                         | `vi]`, `da[`            |
| `}`  `{`    | Braces                           | `vi}`, `da{`            |

**Jump between text objects**: `[f` / `]f` to jump to prev/next function, `[a` / `]a` for arguments.

---

## Git (vim-fugitive)
| Key           | Action                              |
|---------------|-------------------------------------|
| `:Git`        | Git status (interactive)            |
| `:Git diff`   | Diff                                |
| `:Git blame`  | Blame                               |
| `gb` (normal) | Open current line on GitHub         |
| `gb` (visual) | Open selected lines on GitHub       |

---

## Folding (nvim-ufo)
| Key    | Action                     |
|--------|----------------------------|
| `zR`   | Open all folds             |
| `zM`   | Close all folds            |
| `za`   | Toggle fold under cursor   |
| `zc`   | Close fold                 |
| `zo`   | Open fold                  |
| `K`    | Peek fold (or LSP hover)   |

---

## LSP
| Key            | Action              |
|----------------|---------------------|
| `gd`           | Go to definition    |
| `gr`           | References          |
| `K`            | Hover docs          |
| `<leader>rn`   | Rename symbol       |
| `<leader>ca`   | Code action         |
| `<leader>d`    | Show diagnostic     |
| `[d` / `]d`    | Prev/next diagnostic|

---

## Misc
| Key            | Action                        |
|----------------|-------------------------------|
| `<leader>n`    | Toggle line numbers           |
| `;`            | Enter command mode (like `:`) |
| `jk` (insert)  | Escape to normal mode         |
| `<leader>?`    | Open this cheatsheet          |

---

## Practice
- `:VimBeGood` — launch practice games (dodge, hjkl, relative jump, etc.)
