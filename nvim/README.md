# Mnemonic leader keymaps

> [!WARNING]
Work in progress :point_up:

Some rulles I follow:

- Most common actions use a lowercase letter
- The uppercase variant means a bigger operation for the entire buffer, or a
  less common action
- Easy to remember keymaps that try to follow vim mnemonics. I only use grouped
  keymaps when it makes sense

> [!NOTE]
> Not all keymaps not documented here. You can take a look in the
> `lua/config/keymaps.lua` file if you're curious. There are some
> interesting mappings I collected over the years from people like the
> @ThePrimeagen and reedit posts.

## Keybindings diagram

> [!INFO]
> The `<Leader>` key is the `<Space>` key.

### Quick daily life actions:

<Leader>
├──► q       # Quit neovim
├──► f       # Find file (native, opens cmd with '**/<cursor>')
├──► d       # Delete buffer
├──► D       # Delete all buffers
├──► o       # Delete other buffers but current
├──► c       # Close window
├──► w       # Write buffer
├──► W       # Write all buffers
├──► k       # Show keybindings
├──► @       # Show registers
├──► '       # Show marks
├──► u       # Show undo list
├──► i       # Find info help (mini.picker plugin)
├──► /       # Find grep (mini.picker plugin)
├──► space   # Find files (mini.picker plugin)
├──► ,       # Find within buffers
├──► e       # Open tree view (mini.picker plugin)
├──► -       # Open current parent folder (oil plugin)
└──► E       # Open neovim config file

### Grouped actions

#### Lsp/Git actions

<Leader>
├──► h       # Hunk group actions (gitsigns plugin):
│   ├──► r       # Reset current hunk in current line
│   ├──► R       # Reset all hunks for current buffer
│   ├──► p       # Preview hunk
│   ├──► i       # Preview hunk (inline)
│   ├──► q       # Set git quickfix list
│   ├──► Q       # Set quickfix list
│   ├──► s       # Stage hunk
│   ├──► b       # Blame
│   └──► S       # Status
└──► l       # Lsp group actions:
    ├──► r       # Replace symbol
    ├──► a       # Code action
    ├──► d       # Open diagnostic
    └──► i       # Show lsp info

#### Toggle options

<Leader>
└──► t       # Toggle group actions:
    ├──► n      # Relative Numbers
    ├──► h      # Inline Hints
    ├──► f      # Format on Save --- Not implemented yet
    ├──► c      # Conceal
    ├──► q      # Quickfix       --- Not implemented yet
    ├──► l      # Lazy Redraw
    ├──► t      # Inspect Tree
    ├──► b      # Show current blame line (gitsigns plugin)
    ├──► s      # Spelling
    ├──► m      # render markdown (rendermarkdown plugin)
    └──► d      # diff splits (You first need to open two different files in splits)
