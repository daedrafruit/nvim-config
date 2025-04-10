return {
	'nvim-java/nvim-java',
	ft = { 'java' },
	config = function()
			require('java').setup {
				java_test = {
					enable = false
				},
				lombok = {
					enable = false
				},
				spring_boot_tools = {
					enable = false
				}, 
				java_debug_adapter = {
					enable = true
				}, 
				jdk = {
					auto_install = true,
					version = '17.0.2',
				},
			}
			require('lspconfig').jdtls.setup({})
	end,
}


