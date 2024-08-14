return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  enabled = enable_plugins['treesitter-textobjects'],
  lazy = true,
  main = 'nvim-treesitter.configs',
  opts = {
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['a='] = {
            query = '@assignment.outer',
            desc = 'Select outer part of an assignment',
          },
          ['i='] = {
            query = '@assignment.inner',
            desc = 'Select inner part of an assignment',
          },
          ['l='] = {
            query = '@assignment.lhs',
            desc = 'Select left hand side of an assignment',
          },
          ['r='] = {
            query = '@assignment.rhs',
            desc = 'Select right hand side of an assignment',
          },

          ['aa'] = {
            query = '@parameter.outer',
            desc = 'Select outer part of a parameter/argument',
          },
          ['ia'] = {
            query = '@parameter.inner',
            desc = 'Select inner part of a parameter/argument',
          },

          ['ai'] = {
            query = '@conditional.outer',
            desc = 'Select outer part of a conditional',
          },
          ['ii'] = {
            query = '@conditional.inner',
            desc = 'Select inner part of a conditional',
          },

          ['al'] = {
            query = '@loop.outer',
            desc = 'Select outer part of a loop',
          },
          ['il'] = {
            query = '@loop.inner',
            desc = 'Select inner part of a loop',
          },

          ['af'] = {
            query = '@call.outer',
            desc = 'Select outer part of a function call',
          },
          ['if'] = {
            query = '@call.inner',
            desc = 'Select inner part of a function call',
          },

          ['am'] = {
            query = '@function.outer',
            desc = 'Select outer part of a method/function definition',
          },

          ['im'] = {
            query = '@function.inner',
            desc = 'Select inner part of a method/function definition',
          },

          ['ac'] = {
            query = '@class.outer',
            desc = 'Select outer part of a class',
          },
          ['ic'] = {
            query = '@class.inner',
            desc = 'Select inner part of a class',
          },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
          ['<leader>nm'] = '@function.outer', -- swap function with next
        },
        swap_previous = {
          ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
          ['<leader>pm'] = '@function.outer', -- swap function with previous
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = {
            query = '@call.outer',
            desc = 'Next function call start',
          },
          [']m'] = {
            query = '@function.outer',
            desc = 'Next method/function def start',
          },
          -- Using )c instead of ]c to avoid conflicting with got oc next change
          [')c'] = { query = '@class.outer', desc = 'Next class start' },
          [']i'] = {
            query = '@conditional.outer',
            desc = 'Next conditional start',
          },
          [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
          [']s'] = {
            query = '@scope',
            query_group = 'locals',
            desc = 'Next scope',
          },
          [']z'] = {
            query = '@fold',
            query_group = 'folds',
            desc = 'Next fold',
          },
        },
        goto_next_end = {
          [']F'] = { query = '@call.outer', desc = 'Next function call end' },
          [']M'] = {
            query = '@function.outer',
            desc = 'Next method/function def end',
          },
          [']C'] = { query = '@class.outer', desc = 'Next class end' },
          [']I'] = {
            query = '@conditional.outer',
            desc = 'Next conditional end',
          },
          [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
        },
        goto_previous_start = {
          ['[f'] = {
            query = '@call.outer',
            desc = 'Prev function call start',
          },
          ['[m'] = {
            query = '@function.outer',
            desc = 'Prev method/function def start',
          },
          -- Using (c instead of [c to avoid conflicting with got oc prev change
          ['(c'] = { query = '@class.outer', desc = 'Prev class start' },
          ['[i'] = {
            query = '@conditional.outer',
            desc = 'Prev conditional start',
          },
          ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
        },
        goto_previous_end = {
          ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
          ['[M'] = {
            query = '@function.outer',
            desc = 'Prev method/function def end',
          },
          ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
          ['[I'] = {
            query = '@conditional.outer',
            desc = 'Prev conditional end',
          },
          ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
        },
      },
    },
  },
  keys = function()
    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    return {
      {
        mode = { 'n', 'x', 'o' },
        ';',
        ts_repeat_move.repeat_last_move,
        desc = 'Next match',
      },
      {
        mode = { 'n', 'x', 'o' },
        ',',
        ts_repeat_move.repeat_last_move_opposite,
        desc = 'Previous match',
      },
      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      {
        mode = { 'n', 'x', 'o' },
        'f',
        ts_repeat_move.builtin_f_expr,
        expr = true,
      },
      {
        mode = { 'n', 'x', 'o' },
        'F',
        ts_repeat_move.builtin_F_expr,
        expr = true,
      },
      {
        mode = { 'n', 'x', 'o' },
        't',
        ts_repeat_move.builtin_t_expr,
        expr = true,
      },
      {
        mode = { 'n', 'x', 'o' },
        'T',
        ts_repeat_move.builtin_T_expr,
        expr = true,
      },
    }
  end,
}
