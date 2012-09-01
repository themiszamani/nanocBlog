---
title: "tmux - The Terminal Multiplexer"
created_at: 2012-02-06 22:22:00 -0700
kind: article
categories:
  - Linux
  - Arch
published: true
---

The first time I ever thought about multiplexing terminals was when I was using [rTorrent][1] very heavily. Don't ask me why - I guess the console fever was on. Multiplexing has nothing to do with rTorrent. Ability to detach the sessions was nice though.

[Tmux][2] didn't exist at that time. Or at least I didn't know it did. I was using [GNU screen][3] at that time. Tmux is similar to screen but has several key differences. The most important being that it's still in active development. Last stable release of screen was in 2008. Tmux is in active development.

For those who don't know what I am talking about - consider this. You want to split a terminal into multiple windows - what do you do? Or maybe you want to switch windows after you split them. Or just have multiple windows open that you can easily switch between or attach and detach the sessions. There are a lot of things you can do with tmux.

Tmux also comes with a status bar that you can use to monitor the windows, activity, time, date, battery life, hostname - bunch of things. Another important thing here is that it's very easy to configure. Uses plain text file for configuration with option handles that you actually understand by reading.

<!-- more -->

I didn't like the default keybindings of tmux which mainly relied on the Control key. It becomes too messy when used with vim. There were some other options also which were causing issues. When looking for a solution, I came across the blog of [Ton Kersten][4]. His configuration file is also tailored for vim users. I am using it almost exactly as it is with a couple of changes. You can find the file I am using [here][5].

You need to put the file at ~/.tmux.conf. If you are running tmux and want to load a new configuration file then issue the command,

    tmux source-file PATH_TO_FILE

Another killer feature of tmux is you can have a tmux session inside a tmux session. That's like a taco inside a taco inside a taco-bell which is in a mall.... It's deep :)

[1]: http://libtorrent.rakshasa.no/
[2]: http://tmux.sourceforge.net/
[3]: http://www.gnu.org/software/screen/
[4]: http://tonkersten.com/2011/07/104-switching-to-tmux/
[5]: https://gist.github.com/1757760

