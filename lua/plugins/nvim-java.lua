require('java').setup {
  java_test = {
    enable = false
  },
	lombok = {
    enable = true
  },
	spring_boot_tools = {
    enable = false
  }, 
	jdk = {
    auto_install = true,
    version = '17.0.2',
  },
}

