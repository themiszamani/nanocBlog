---
title: "Modular Vim Configuration"
created_at: 2012-02-19 12:12:00 -0700
kind: article
categories:
  - Linux
  - Vim
published: true
---

Without getting into the whole Vim vs Emacs religious fight, which believe me is hard for me to do, I am going to just go ahead and explain how the modular Vim configuration I use works. This assumes that you already use Vim and are looking for a way to improve the portability and readability of your configuration. I repeat, this is NOT a tutorial on using Vim.

Let's start with the Vim configuration file, ~/.vimrc. You can specify options in this file that you wish to enable (disable) in Vim. Things like status lines, show ruler, setting the tabstops. You can also go on to make it more complex and add autocorrects, keybindings and a bunch of other goodies.

The problem with this approach is, if you are a poweruser then your configuration file can easily get over a few hundred lines and will be a challenge to maintain. The way to avoid this problem is to split the file into multiple smaller files - a modular setup. This makes it easier to upgrade and maintain Vim settings.

There is also a possibility that you work with multiple languages and you may need different settings for each one of them. Such as syntax coloring and indentation. I, for example, use a tabstop of 2 for Ruby and HTML while tab stop of 4 for Verilog and C/C++.

<!-- more -->

You can add such filetype based configuration flags in the vimrc file. You can also split this part into multiple files and go with the modular approach mentioned above. There is, however, another, better way to achieve the same result.

Let's go over the basic (non filetype based) configuration part now. Here is [my .vim directory on GitHub][1]. If you check the config.vim file, you will see that it loads \*.vim files from the config directory. If you check in the config directory, you will find many .vim files that list the configuration options. The main configuration file looks for all such .vim files and loads the options when you start Vim. If you notice, these files do not contain filetype based configurations. Vim, as I previously mentioned, has a more elegant way to do it.

Go back to the base of the Git repository and you will see two directories, ftplugin and ftdetect which stand for filetype plugins and filetype detection. I will put the code to detect and setup the filetype options in these directories soon. It allows you to set local options, related to a particular filetype and also allows you to pair file extensions with filetypes. .sva for example, is same as .sv and used for SystemVerilog. Stay tuned for more.

### Update: 02/23/2012 ###

I have added the ftdetect and ftplugin directories to the testing branch in the Git repository. Once I throughly test it for any possible issues, I will merge it to master.

[1]: https://github.com/adibis/.vim

