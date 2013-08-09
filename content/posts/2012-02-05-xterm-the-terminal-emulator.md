---
title: "xterm - The Terminal Emulator"
created_at: 2012-02-05 13:36:00 -0700
kind: article
categories:
  - Linux
  - Arch
published: true
---

Ever since I started using Linux, I have been using Gnome-Terminal as terminal emulator for the most part. Even during the brief time I used XFCE and KDE, I was using it since I liked the configuration options on it. The problem with that approch was - the dependency on Gnome.

For the minimalist setup that I currently am using - this seemed like a foolish approach. I started looking at the alternatives and after going through [urxvt][1] (rxvt with unicode support) and [xtrem][2], I decided to settle on xterm for now.

xterm supports all the usual stuff - unicode extensions, colors, ability to theme it the way you want. The best thing was the ability to go full screen - even on Gnome and you could remove the menu bar completely - something that I almost never use in any terminal emulator.

<a href="/images/posts/2012-02-05-xterm.png" class="lightbox" ><img src="/images/posts/2012-02-05-xterm-thumbnail.png" alt=""></a>

The screenshot shown above is xterm working in conjunction with [tmux][3]. tmux is a terminal multiplexer. Look at it like the replacement of [GNU-screen][4] with improvements over everything that makes you hate GNU-screen. After looking at various options, I settled on a slight modification of the theme that [Mike][5] uses on his machine.

<!-- more -->

To theme xterm, you have to put the colors and options in the ~/.Xresources file. Once you put the code there, you have to run the following command and restart xterm for the changes to take effect. The command is,

    xrdb -load ~/.Xresources

Here's [the configuration I am using][7] in the screenshot above.

Note :- I am also using [zsh][6] with a custom theme AND tmux in the screenshot above. Don't worry if you don't get the same results yet. Wait for the upcoming posts where I will talk about setting up those 2 as well.

[1]: http://rxvt.sourceforge.net/
[2]: http://invisible-island.net/xterm/
[3]: http://tmux.sourceforge.net/
[4]: http://www.gnu.org/software/screen/
[5]: https://github.com/mikecrittenden/dotfiles/blob/master/xorg/.Xresources
[6]: http://www.zsh.org/
[7]: https://gist.github.com/1748132

