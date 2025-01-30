local cmd = vim.api.nvim_create_user_command

-- i learned this one from NvChad also
cmd("MasonInstallAll", function()
  if #MASON_INSTALLS == 0 then
    print("No packages to install!")
    return
  end
  local mr = require("mason-registry")
  mr.refresh(function()
    for _, inst in ipairs(MASON_INSTALLS) do
      local pkg = mr.get_package(inst)
      if not pkg:is_installed() then
        pkg:install()
        print("Installing " .. inst)
      else
      end
    end
  end)
end, { desc = "Install missing packages defined in MASON_INSTALLS table at plugins/mason" })
