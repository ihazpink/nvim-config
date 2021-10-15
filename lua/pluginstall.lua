-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Install plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- lsp plugins
	use 'neovim/nvim-lspconfig'
	use 'onsails/lspkind-nvim'
	use 'kabouzeid/nvim-lspinstall'

	-- autocompletion
	use { 'ms-jpq/coq_nvim', branch='coq' }
	use { 'ms-jpq/coq.artifacts', branch='artifacts'}

	-- User utils
	use 'sbdchd/neoformat'
	use { 'famiu/feline.nvim', requires='kyazdani42/nvim-web-devicons' }
	use {'nvim-telescope/telescope.nvim', requires='nvim-lua/plenary.nvim'}
	use 'windwp/nvim-autopairs'
	use 'glepnir/dashboard-nvim'


	-- improved syntax
	use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
	use 'norcalli/nvim-colorizer.lua'

	-- Themes
	use 'ayu-theme/ayu-vim'

	-- failsafe dependencies
	-- Sometimes plugins that have shared dependencies can fail
	-- to update and take the dependecy out with them
	use 'kyazdani42/nvim-web-devicons'
end)
