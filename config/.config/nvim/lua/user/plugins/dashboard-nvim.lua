local headerLocal = {
  "                                                                                                    ",
  "                                                                                                    ",
  "                                                                                                    ",
  "                         .^!^                                           .!~:                        ",
  "                    ^!JPB&B7.                                            !&&BPJ!:                   ",
  "                ^?P#@@@@@G.                   :       :                   ~@@@@@&B5!:               ",
  "             ^JB@@@@@@@@@7                   .#~     ?G                   .&@@@@@@@@&G?:            ",
  "          .7G@@@@@@@@@@@@#!                  7@&^   ~@@^                 .5@@@@@@@@@@@@@G7.         ",
  "        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y#@@@@@@@@@@@@@@@@#?.       ",
  "       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  ~@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@#!      ",
  "     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ",
  "    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ",
  "   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@J   ",
  "   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGP555PPGBB#&#:  ",
  "   ^:.            .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ",
  "                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5:                      ",
  "                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ",
  "                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ",
  "                                         :?G@@@@@@@@@@@@P!.                                         ",
  "                                            ~5@@@@@@@@5^                                            ",
  "                                              ^P@@@@G^                                              ",
  "                                                !#@?                                                ",
  "                                                 :^                                                 ",
  "                                                                                                    ",
  "                                                                                                    ",
  "                                                                                                    ",
}

return {
  'nvimdev/dashboard-nvim',
  enabled = true,
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = headerLocal, --your header
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'FzfLua files'
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'File Tree           ',
            desc_hl = 'String',
            key = 't',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'NvimTreeOpen'
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Oil           ',
            desc_hl = 'String',
            key = 'o',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Oil'
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Quit            ',
            desc_hl = 'String',
            key = 'q',
            keymap = '',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'quit'
          }
        },
        footer = {
          "I am vengeance, I am justice, I am the night!",
          "I AM BATMAN"
        }  --your footer
      }
    }
  end
}
