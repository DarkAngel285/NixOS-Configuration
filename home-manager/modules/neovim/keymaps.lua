local map = vim.keymap.set
local opts = { silent = true, noremap = true }

map("n", "<escape>", ":noh<cr>", opts)

map("n", "<leader>w", ":w<cr>", opts)
map("n", "<leader>q", ":qa<cr>", opts)
map("n", "<leader>Q", ":qa!<cr>", opts)

map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-h>", "<C-w>h", opts)

map("n", "<M-S-k>", ":resize -2<cr>", opts)
map("n", "<M-S-j>", ":resize +2<cr>", opts)
map("n", "<M-S-l>", ":vertical resize -2<cr>", opts)
map("n", "<M-S-h>", ":vertical resize +2<cr>", opts)

map("n", "<M-k>", ":m-2<cr>", opts)
map("n", "<M-j>", ":m+1<cr>", opts)

map("n", "<leader>a", ":Alpha<cr>", opts)

map("n", "<leader>e", ":Neotree toggle<cr>", opts)

map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", opts)
map("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<cr>", opts)
map("n", "<leader>tv", ":ToggleTerm size=50 direction=vertical<cr>", opts)

map("n", "L", ":BufferNext<cr>", opts)
map("n", "H", ":BufferPrevious<cr>", opts)
map("n", "<M-l>", ":BufferMoveNext<cr>", opts)
map("n", "<M-h>", ":BufferMovePrevious<cr>", opts)
map("n", "<leader>c", ":BufferClose<cr>", opts)

map("n", "<leader>li", ":LspInfo<cr>", opts)
-- map("n", "<leader>ls", ":LspStop ", opts)
-- map("n", "<leader>lS", ":LspStart<cr>", opts)
-- map("n", "<leader>lr", ":LspRestart<cr>", opts)

map("n", "<leader>ldo", function()
	vim.diagnostic.open_float()
end, opts)

map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, opts)
map("n", "<leader>dc", function()
	require("dap").continue()
end, opts)
map("n", "<leader>di", function()
	require("dap").step_into()
end, opts)
map("n", "<leader>do", function()
	require("dap").step_out()
end, opts)
map("n", "<leader>dO", function()
	require("dap").step_over()
end, opts)
map("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, opts)
map("n", "<leader>ds", function()
	require("dap").session()
end, opts)
map("n", "<leader>dt", function()
	require("dap").terminate()
end, opts)
map("n", "<leader>de", function()
	require("dapui").eval()
end, opts)
map("n", "<leader>du", function()
	require("dapui").toggle()
end, opts)
map("n", "<leader>dw", function()
	require("dap.ui.widgets").hover()
end, opts)

map("n", "<leader>sl", ":Telescope resume<cr>", opts)
map("n", "<leader>fd", ":Telescope diagnostics<cr>", opts)
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
map("n", "<leader>fm", ":Telescope marks<cr>", opts)
map("n", "<leader>b", ":Telescope buffers<cr>", opts)
map("n", "<leader>gf", ":Telescope git_files<cr>", opts)
map("n", "<leader>of", ":Telescope oldfiles<cr>", opts)

map("n", "ge", "yiw:%s/<C-r>0//g<Left><Left>")

-- map("i", "jk", "<escape>", opts)
-- map("i", "kj", "<escape>", opts)

map("i", "<C-BS>", "<C-w>", opts)

map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

map("v", "ge", "y:%s/<C-r>0//g<Left><Left>")

map({ "v", "x" }, "K", ":m '<-2<cr>gv=gv", opts)
map({ "v", "x" }, "J", ":m '>+1<cr>gv=gv", opts)

map("t", "<esc>", "<C-\\><C-n>", opts)
-- map("t", "jk", "<C-\\><C-n>", opts)
-- map("t", "kj", "<C-\\><C-n>", opts)

map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
