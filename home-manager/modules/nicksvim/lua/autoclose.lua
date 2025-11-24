-- vim.api.nvim_create_autocmd("TermClose", {
--     callback = function()
-- 	    print("Command exited with status" + v:event.status)
-- 	    -- vim.cmd("close")
--     end
-- })

--autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

vim.api.nvim_create_autocmd("TermClose", {
  callback = function()
    if vim.v.event.status == 0 then
      print("Process completed succesfully")
      vim.cmd("bdelete! " .. vim.fn.expand("<abuf>"))
    end
  end,
})
