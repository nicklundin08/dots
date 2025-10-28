# TODOS
- LSP -> underlines instead of gutter symbols
- Lang
    - java
        - Neotest
        - cmp extra sources
        - cmp keybinds (c-n c-p not working? tab?)
    - Ruby
        - LSP working
        - Conform
        - neotest
        - Rails console keybind/plugin?
    - TS
        - LSP working
        - Conform
        - neotest
        - REPL keybind/plugin?
- Dashboard to see all plugins? Checkhealth?
- Workflow (or plugin) for quickfix




- NVIM port lazy plugins?
  - plenary
  - blink.cmp
  - flash.nvim
  - friendly-snippets ?
  - gitsigns.nvim
  - mini.pairs
  - noice.nvim
  - nvim-nio
  - nvim-treesitter
  - nvim-treesitter-sexp
  - nvim-treesitter-textobjects
  - nvim-ts-autotag
  - todo-comments.nvim
  - trouble.nvim
  - ts-comments.nvim


Junit error
   Warn  17:58:41 notify.warn Neotest neotest-java: ...vimPackages/start/neotest-java/lua/neotest-java/init.lua:19:     Junit Platform Console Standalone jar not found at /Users/nicholaslundin/.local/share/nvim/neotest-java/junit-platform-console-standalone-1.10.1.jar
    Please run the following command to download it: NeotestJava setup
    Or alternatively, download it from https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.10.1/junit-platform-console-standalone-1.10.1.jar
  
stack traceback:
	...NeovimPackages/start/neotest/lua/neotest/client/init.lua:89: in function <...NeovimPackages/start/neotest/lua/neotest/client/init.lua:88>
	[C]: in function 'assert'
	...vimPackages/start/neotest-java/lua/neotest-java/init.lua:19: in function 'check_junit_jar'
	...vimPackages/start/neotest-java/lua/neotest-java/init.lua:44: in function 'build_spec'
	...ovimPackages/start/neotest/lua/neotest/client/runner.lua:76: in function '_run_tree'
	...ovimPackages/start/neotest/lua/neotest/client/runner.lua:65: in function <...ovimPackages/start/neotest/lua/neotest/client/runner.lua:22>
	[C]: in function 'xpcall'
	...NeovimPackages/start/neotest/lua/neotest/client/init.lua:84: in function 'run_tree'
	...ovimPackages/start/neotest/lua/neotest/consumers/run.lua:85: in function 'func'
	...r/pack/myNeovimPackages/start/nvim-nio/lua/nio/tasks.lua:169: in function <...r/pack/myNeovimPackages/start/nvim-nio/lua/nio/tasks.lua:168>

ruby_lsp error
[ERROR][2025-10-27 17:45:12] ...p/_transport.lua:36	"rpc"	"ruby-lsp"	"stderr"	"/nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/installer.rb:340:in `rescue in install': You don't have write permissions for the /nix/store/i17gp77p5gxjg40zji1ravckakz7vnf8-neovim-ruby-env/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 directory. (Gem::FilePermissionError)\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/installer.rb:289:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/resolver/specification.rb:105:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:195:in `block in install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/dependency_installer.rb:250:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems.rb:556:in `install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:378:in `install_bundler_if_needed'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:222:in `run_bundle_install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:117:in `setup!'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/exe/ruby-lsp:75:in `<top (required)>'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `load'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `<main>'\n/nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:402:in `mkdir': Permission denied @ dir_s_mkdir - /nix/store/i17gp77p5gxjg40zji1ravckakz7vnf8-neovim-ruby-env/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 (Errno::EACCES)\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:402:in `fu_mkdir'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:380:in `block (2 levels) in mkdir_p'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:378:in `reverse_each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:378:in `block in mkdir_p'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:370:in `each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:370:in `mkdir_p'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/installer.rb:306:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/resolver/specification.rb:105:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:195:in `block in install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/dependency_installer.rb:250:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems.rb:556:in `install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:378:in `install_bundler_if_needed'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:222:in `run_bundle_install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:117:in `setup!'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/exe/ruby-lsp:75:in `<top (required)>'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `load'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `<main>'\n"

