require("urlview").setup({
	-- Prompt title (`<context> <default_title>`, e.g. `Buffer Links:`)
	default_title = "Links:",
	-- Default picker to display links with
	-- Options: "native" (vim.ui.select) or "telescope"
	default_picker = "telescope",
	-- Set the default protocol for us to prefix URLs with if they don't start with http/https
	default_prefix = "https://",
	-- Command or method to open links with
	-- Options: "netrw", "system" (default OS browser); or "firefox", "chromium" etc.
	-- By default, this is "netrw", or "system" if netrw is disabled
	navigate_method = "system",
	-- Ensure links shown in the picker are unique (no duplicates)
	unique = true,
	-- Ensure links shown in the picker are sorted alphabetically
	sorted = true,
	-- Logs user warnings (recommended for error detection)
	debug = true,
	-- Custom search captures
	},
      })