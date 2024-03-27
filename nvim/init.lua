-- 高速 load の有効化
if vim.loader then vim.loader.enable() end

-- == load plugin manager =====================================================
-- load lazy.nvim
-- https://github.com/folke/lazy.nvim
-- lazy.nvim path: ~/.local/share/nvim/lazy/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- == general settings ========================================================
if not table.unpack then
  table.unpack = unpack
end

local options = {
  -- gui カラー設定
  termguicolors = true,
  -- encode
  encoding = "utf-8",
  fileencoding = "utf-8",
  -- 表示
  -- アイコンの表示カラムを常に表示
  signcolumn = "yes",
  -- 行番号を表示
  number = true,
  -- 検索した文字のハイライト
  hls = true,
  -- 入力など
  -- タブサイズの設定
  tabstop = 4,
  shiftwidth = 0,
  -- タブの自動補完
  autoindent = true,
  -- タブ入力を空白に変換
  expandtab = true,
  -- 補完で大文字小文字を無視
  ignorecase = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- clipboard を共有する
vim.opt.clipboard:append{'unnamedplus'}

-- nvim 用の python3 環境を指定する
vim.g.python3_host_prog = '~/.nvim_python3/bin/python3'

-- == load plugins ============================================================
-- set config path
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/?.lua;" .. package.path

require('lazy').setup({
  spec = {
    { import = "plugins" },
  },
})

-- == load keymaps ============================================================
require('keymaps')
