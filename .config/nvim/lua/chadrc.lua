-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

  -- -@type ChadrcConfig
  local M = {}

M.base46 = {
  theme = "everforest",    -- use NvChad’s default theme
  transparency = false,  -- keep as needed
  hl_add = {},           -- no extra highlights yet
}

  -- Defines the UI components
  M.ui = {
    --topbar
    tabufline = {
      lazyload = false,
      enabled = false,
    },

    -- don't want the status line
    statusline = {
      enabled = false,
    },
  }

  --Nv dash

  M. nvdash = {
    load_on_startup = true,
    header = {
      "            :h-                                  Nhy`               ",
      "           -mh.                           h.    `Ndho               ",
      "           hmh+                          oNm.   oNdhh               ",
      "          `Nmhd`                        /NNmd  /NNhhd               ",
      "          -NNhhy                      `hMNmmm`+NNdhhh               ",
      "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
      "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
      "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
      "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
      " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
      " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
      " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
      " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
      "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
      "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
      "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
      "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
      "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
      "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
      "       //+++//++++++////+++///::--                 .::::-------::   ",
      "       :/++++///////////++++//////.                -:/:----::../-   ",
      "       -/++++//++///+//////////////               .::::---:::-.+`   ",
      "       `////////////////////////////:.            --::-----...-/    ",
      "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
      "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
      "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
      "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
      "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
      "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
      "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
      "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
      "                        .-:mNdhh:.......--::::-`                    ",
      "                           yNh/..------..`                          ",
      "                                                                    ",
    },

    -- Set menu
    buttons = {
      { txt = "  > Find file",keys = "ff", cmd = "Telescope oldfiles" },
      { txt = "  > Find Word"   ,keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  > Themes" ,keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    },
  }

  return M
