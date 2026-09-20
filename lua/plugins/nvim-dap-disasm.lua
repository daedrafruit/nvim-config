vim.pack.add{
 "https://codeberg.org/Jorenar/nvim-dap-disasm",
}
require("dap-disasm").setup{
    -- Add disassembly view to elements of nvim-dap-ui
    dapui_register = true,

    -- Add disassembly view to nvim-dap-view
    dapview_register = true,
  }
