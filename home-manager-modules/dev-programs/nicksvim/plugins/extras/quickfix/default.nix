{...}: {
  #    let my_qf_list = [
  #        \{'filename': 'src/main.lua', 'lnum': 10, 'col': 5, 'text': 'Undefined variable "foo"', 'type': 'E'},
  #        \{'filename': 'src/utils.lua', 'lnum': 25, 'col': 1, 'text': 'Missing function documentation', 'type': 'W'},
  #    ]
  #
  #        :call setqflist(my_qf_list, 'a')
  #
  # :copen

  programs.nixvim = {
    extraFiles = {
      "after/ftplugin/qf.lua".source = ./qf.lua;
    };
  };
}
