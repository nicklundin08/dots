# TODOS
- LSP -> underlines instead of gutter symbols
- Lang
    - java
        - cmp extra sources
    - Ruby
        - LSP not working 
        - Conform not wokring
        - Neotest not working
    - TS
        - neotest
        - REPL keybind/plugin?
- Dashboard to see all plugins? Checkhealth?
- Workflow (or plugin) for quickfix


- NVIM port lazy plugins?
  - plenary
  - blink.cmp
  - friendly-snippets ?
  - nvim-nio
  - nvim-treesitter-sexp
  - nvim-treesitter-textobjects
  - nvim-ts-autotag


ruby_lsp error
[ERROR][2025-10-27 17:45:12] ...p/_transport.lua:36	"rpc"	"ruby-lsp"	"stderr"	"/nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/installer.rb:340:in `rescue in install': You don't have write permissions for the /nix/store/i17gp77p5gxjg40zji1ravckakz7vnf8-neovim-ruby-env/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 directory. (Gem::FilePermissionError)\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/installer.rb:289:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/resolver/specification.rb:105:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:195:in `block in install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/dependency_installer.rb:250:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems.rb:556:in `install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:378:in `install_bundler_if_needed'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:222:in `run_bundle_install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:117:in `setup!'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/exe/ruby-lsp:75:in `<top (required)>'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `load'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `<main>'\n/nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:402:in `mkdir': Permission denied @ dir_s_mkdir - /nix/store/i17gp77p5gxjg40zji1ravckakz7vnf8-neovim-ruby-env/lib/ruby/gems/3.3.0/gems/bundler-2.5.11 (Errno::EACCES)\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:402:in `fu_mkdir'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:380:in `block (2 levels) in mkdir_p'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:378:in `reverse_each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:378:in `block in mkdir_p'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:370:in `each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/fileutils.rb:370:in `mkdir_p'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/installer.rb:306:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/resolver/specification.rb:105:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:195:in `block in install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `each'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/request_set.rb:183:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems/dependency_installer.rb:250:in `install'\n\tfrom /nix/store/89zmxpc5wzc5c3n203xxwjbvy95dh8hc-ruby-3.3.9/lib/ruby/3.3.0/rubygems.rb:556:in `install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:378:in `install_bundler_if_needed'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:222:in `run_bundle_install'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/lib/ruby_lsp/setup_bundler.rb:117:in `setup!'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/lib/ruby/gems/3.3.0/gems/ruby-lsp-0.23.14/exe/ruby-lsp:75:in `<top (required)>'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `load'\n\tfrom /nix/store/xm5i8d47swjvhcsjnrkrbfq0jwrgza8i-ruby3.3-ruby-lsp-0.23.14/bin/ruby-lsp:18:in `<main>'\n"




[ERROR][2025-11-25 10:14:34] ...lsp/handlers.lua:562	'Nov 25, 2025, 10:14:34 AM Problems occurred when invoking code from plug-in: "org.eclipse.core.resources".\nInternal Error compiling /service-workshop/src/main/java/com/betterlesson/workshop/core/domain/auth/responses/WorkshopPermissionsResponse.java\njava.lang.RuntimeException: Internal Error compiling /service-workshop/src/main/java/com/betterlesson/workshop/core/domain/auth/responses/WorkshopPermissionsResponse.java\n\tat org.eclipse.jdt.internal.compiler.ProcessTaskManager.processing(ProcessTaskManager.java:139)\n\tat java.base/java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:572)\n\tat java.base/java.util.concurrent.FutureTask.run(FutureTask.java:317)\n\tat java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)\n\tat java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)\n\tat java.base/java.lang.Thread.run(Thread.java:1583)\nCaused by: java.lang.NullPointerException: Cannot invoke "org.eclipse.jdt.internal.compiler.lookup.MethodBinding.isStatic()" because "this.binding" is null
