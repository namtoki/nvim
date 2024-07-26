return {
  {
    "niuiic/dap-utils.nvim",
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",

    opts = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.adapters.cppdbg = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }

      dap.configurations.cpp = {
        {
          name = "C++ gdbserver",
          type = "cppdbg",
          request = "attach",
          cwd = "${workspaceFolder}",
          MIMode = "gdb",
          stopAtEntry = false,
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          useExtendedRemote = true,
          miDebuggerServerAddress = function()
            return vim.fn.input("Server address: ", "192.168.0.28:10000")
          end,
          processId = function()
            return vim.fn.input("Process ID: ", "2066")
          end,
          miDebuggerPath = "${workspaceFolder}/build70/exports/arm-aios93mllib32-linux-gnueabi-release/sysroots/x86_64-oesdk-linux/usr/bin/arm-aios93mllib32-linux-gnueabi/arm-aios93mllib32-linux-gnueabi-gdb",
          --miDebuggerPath = function()
          --  return require("dap.utils").pick_file({
          --    filter = ".gdb",
          --    executables = false,
          --    path = "/home/work/theos/heos/build70/exports",
          --  })
          --end,
          setupCommands = {
            {
              text = "set sysroot ${workspaceFolder}/build70/exports/arm-aios93mllib32-linux-gnueabi-release/cache/debug_stage/DENON-DWS_70-SERIES_DEV",
              ignoreFailures = false,
            },
          },
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
