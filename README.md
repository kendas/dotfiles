# The dotfiles of one Kaarel Ratas

That's me. Surprise!

## Installation of the individual dotfile packages

These dotfiles can either be copied to the user's home directory or alternatively (and I reccommend doing this) managed using GNU Stow. To do this, `stow` needs
to be installed and this repository must be in the users home directory. Let's say it is named `dotfiles`. To do this, simply do the following:

```
$ cd ~/dotfiles
$ stow zsh
$ stow vim
```

This seems like unknown magic, I realize, so I'll make it simple. Its not. It basically does the following:

```
for filename in './package':	# say, zsh
	target = '../'+filename
	if exists symlink named target:
		delete target
	symlink target to './package/'+filename
```

As such, If you wanted to experiment, you could have different dotfiles in different directories and just _stow_ them according to need. Convenient? I think so.

NOTE: Due to the nature of things, some files contain the paths `/home/kaarel` and `/home/kaarel/dotfiles`. If your name does not happen to be the same as mine, or the username differs, you
might need to do some editting.

## Customized dotfile packages

For some features that require plugins, some additional installation is required. This section will walk you through most of it.

These packages currently include `zsh` and `vim`.

First, you might need to udpdate your submodules:

```
$ git submodule init
$ git submodule update
```

### `zsh` installation instructions

The `zsh` package includes a Haskell-powered git prompt. The source code is included as a _git submodule_ in the dotfiles project root directory.

The first thing you need to do, is install _Haskell_ and _stack_.

```
$ sudo apt-get update && sudo apt-get install stack
$ cd ~/dotfiles/zsh-git-prompt
$ stack setup
$ stack build && stack install
```

Have no fear, my fellow traveller - the zsh-git-prompt executable will only be installed into the zsh-git-prompt directory.

### `vim` installation instructions

The `vim` package includes the following packages:

* `YouCompleteMe` - Code completion engine
* `Taglist` - ??
* `UltiSnips` - ??

#### `YouCompleteMe`

> YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for
> [Vim][]. It has several completion engines:
> 
> - an identifier-based engine that works with every programming language,
> - a [Clang][]-based engine that provides native semantic code
>   completion for C/C++/Objective-C/Objective-C++ (from now on referred to as
>   "the C-family languages"),
> - a [Jedi][]-based completion engine for Python 2 and 3 (using the [JediHTTP][] wrapper),
> - an [OmniSharp][]-based completion engine for C#,
> - a combination of [Gocode][] and [Godef][] semantic engines for Go,
> - a [TSServer][]-based completion engine for TypeScript,
> - a [Tern][]-based completion engine for JavaScript,
> - a [racer][]-based completion engine for Rust,
> - and an omnifunc-based completer that uses data from Vim's omnicomplete system
>   to provide semantic completions for many other languages (Ruby, PHP etc.).

Installation goes as follows:

```
$ sudo apt-get install build-essential cmake
$ sudo apt-get install python-dev python3-dev
$ cd ~/dotfiles/vim/.vim/bundle/YouCompleteMe
$ python3 install.py --clang-completer
```

Now, it has to be mentioned, that in order to get some completion features such as _C#_, _Go_, _TypeScript_, _JavaScript_ or _Rust_,
one must have some other packages intalled as well as supply the install script with some additional flags. More info in the
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe) Github repository.

#### `Taglist`

> The "Tag List" plugin is a source code browser for the Vim editor. It provides an overview of the structure of source code files
> and allows you to efficiently browse through source code files in different programming languages.

```
$ sudo apt-get install exuberant-ctags
```
