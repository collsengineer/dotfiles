# The following instructions are to install and setup NvChad on new hardware and to use my personal config.


## 1. Installing nvim 

```zsh
sudo pacman -S neovim
```

## 2. Aliasing vim command

This step is optional, but if you want to alias your vim command:

```zsh
alias v="nvim"
```
## 3. Installing a Nerd Font

Such as:

- JetBrainsMono Nerd Font
- FiraCode Nerd Font

## 4. Install Git

Make sure you've Git installed:

```zsh
sudo pacman -S git
```

## 5. Install NvChad

To prevent any issues, backup your existing nvim config files (if any) and remove local nvim cash:

```zsh
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.local/share/nvim
```

Then you can install NvChad:

```zsh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

## 6. Launch nvim

You'll be prompt with:

"Do you want to install example custom config? (y/n)"

Make sure to type `n` and hit `Enter`

## 7. Git clone this repo or just copy and paste all the code within this repo.
