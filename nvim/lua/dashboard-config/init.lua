local db = require('dashboard')
db.default_executive = 'telescope'
db.custom_header = {
    [[neovim]],
}
db.custom_center = {
    {desc = 'Find File', action = 'Telescope find_files'},
    {desc = 'Search Text', action = 'Telescope live_grep'},
    {desc = 'Recent Files', action = 'Telescope oldfiles'},
    {desc = 'Config', action = 'edit ~/.config/nvim/init.lua'},
}
db.custom_footer = {''}
