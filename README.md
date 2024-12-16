# Vim Configuration for C++ and Web Development

This repository contains my custom Vim configuration files, designed to optimize C++ development and support JavaScript, TypeScript, and web development workflows. With a focus on syntax highlighting, linting, code completion, and seamless formatting, these settings enhance productivity across multiple domains.

## Features

### C++ Development
- **Custom Syntax Highlighting**: Enhances readability with custom colors for variables, functions, and keywords.
- **Linting and Formatting**: Integrated with ALE for linting and auto-fixing using `clang-format`.
- **Compilation and Execution**: Shortcut to compile and run C++ code directly in Vim.
- **VS Code-Like Theme**: Uses the [vim-code-dark](https://github.com/tomasiser/vim-code-dark) theme for a modern, dark aesthetic.
- **Enhanced C++ Highlighting Options**:
  - Class scope and member variables.
  - POSIX standard and experimental template features.
  - Concepts and type-based syntax.

### JavaScript/TypeScript Support
- **Syntax Highlighting**:
  - JSX component tags and styled components are color-coded.
  - Keywords like `import`, `export`, and `return` are highlighted in VS Code style.
- **Prettier Integration**: Automatically formats JavaScript, CSS, and HTML on save.
- **CoC and ALE Integration**: Provides intelligent autocompletion and real-time linting.

### General Vim Features
- **Relative Line Numbers**: For easier navigation.
- **Custom Folding**: Disables all automatic folding for an unobstructed view of the code.
- **Filetype Detection**: Automatic detection and configuration for `.tsx`, `.jsx`, `.ts`, `.js`, and `.cpp` files.
- **Split Management**: Terminals open below the current window for better organization.

## Installation

### Prerequisites
- **Vim 8.0+** or **Neovim** with `+termguicolors` support.
- [vim-code-dark](https://github.com/tomasiser/vim-code-dark) theme installed in `~/.vim_runtime/my_plugins/`.
- [ALE](https://github.com/dense-analysis/ale) plugin for linting and fixing.
- [CoC](https://github.com/neoclide/coc.nvim) for intelligent autocompletion.

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/Tanner-Davison/vim-config.git ~/.vim
Create a symbolic link to .vimrc:

bash
Copy code
ln -s ~/.vim/.vimrc ~/.vimrc
Install the required plugins:

Use your preferred plugin manager (e.g., vim-plug or Vundle) to install the listed plugins.
Alternatively, follow the installation instructions for each plugin manually.
Install language servers:

C++: clangd
JavaScript/TypeScript: tsserver or eslint.
Configure clang-format and prettier on your system.

Running C++ Code
To compile and run C++ code:

Press <F9> to save, compile, and execute main.cpp.
Customizing
Modify the .vimrc file to adjust any settings or add new features.

Keybindings
Key	Function
<F1>	Inserts a sample C++ function.
<F2>	Inserts placeholder address info.
<F9>	Compile and run main.cpp.
Contributions
Feel free to open issues or submit pull requests to improve the configuration or suggest new features.

Happy coding! 😊
