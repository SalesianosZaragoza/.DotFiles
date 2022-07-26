if not vim.visual_impairing then
  require("bufferline").setup{}
end
vim.cmd[[
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
