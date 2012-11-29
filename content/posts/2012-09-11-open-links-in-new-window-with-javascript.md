---
title: "Open Links in New Window with JavaScript"
created_at: 2012-09-11 23:35:08 -0700
kind: article
categories:
    - JavaScript
    - HowTo
published: true
---

One of the main issues I had with my website at adityashevade.com or even this blog was opening links in new window, automatically. Adding the _blank target to every link is a painful and boring process. I was searching for ways to automate the process using vim registers and python scripts. All of those methods involved running the generated content through scripts and that, again, could have issues if I miss certain corner cases.

After searching for some time, I decided to go the other way - JavaScript. A simple function to load every time a page is loaded and then add the _blank target to all the links. This, again, could go wrong in certain cases but - it doesn't. Not that I know of at least.

<!-- more -->

Here's the JavaScript code I am using. I found this in one of the Stack Overflow threads.

    #!javascript
    $('a[href^="http://"]')
    .attr("target", "_blank");
    $(this).attr('href', newHref).attr("target", "_blank");

Save it in some file. Finally, add the following line in your HTML file. You can also add this in an include file (such as footer) that will automatically go on each page.

    #!javascript
    <script src="js/fileName.js"></script>

That's it - you've got a setup to add a _blank target to every link. This reminds me, by the way, I need to get a good syntax colorize filter to my nanoc configuration now. Happy coding!

