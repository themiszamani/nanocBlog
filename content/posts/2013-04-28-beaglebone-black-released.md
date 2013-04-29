---
title: "BeagleBone Black Released"
created_at: 2013-04-28 13:07:12 -0700
kind: article
categories:
    - BeagleBone
    - Electronics
published: true
---

The makers of [BeagleBoard][1] announced an update to their [BeagleBone][2] series of boards a few weeks ago. Yesterday, [BeagleBone Black][3] was launched. The BeagleBone Black is a significant improvement over the original BeagleBone hardware. With a 1GHz ARM Cortex-A8 processor, 2GB onboard flash memory and 512MB DDR3 RAM - this little board is a powerhouse for DIYers. The folks over at BeagleBoard say that they expect to have the BeagleBone Black in full production by end of May.

When the [Raspberry-Pi][4] was launched last year, the $89 price tag of the original BeagleBone was nowehere competitive, especially when you consider that the RPi has an onboard HDMI, component video and audio along with physical headers. This year around though, the BeagleBoard has managed to deliver something very interesting and, at the same time, only for $45.

<!-- more -->

BeagleBone Black delivers with mouth watering specs for any hacker. It pumps up the CPU speed, double the RAM, adds onboard flash and a mini HDMI port, all this while consuming only 70% power compared to the original BeagleBone.

    |---------------+-----------------------+-----------------------|
    |               |   BeagleBone Black    |      BeagleBone       |
    |---------------+-----------------------+-----------------------|
    | Processor     | AM3359AZCZ100, 1GHz   | AM3359ZC72, 720MHZ    |
    | Video Out     | HDMI                  | None                  |
    | DRAM          | 512MB DDR3L           | 256MB DDR2            |
    | Flash         | 2GB eMMC, uSD         | none, uSD             |
    | Onboard JTAG  | Optional              | Over USB              |
    | Serial Port   | Header                | Over USB              |
    | Power         | 210-460mA@5V          | 300-500mA@5V          |
    |---------------+-----------------------+-----------------------|

^^ For some reason - my blog generator isn't generating tables properly :-/ Just ignore that.

That's not all, the BeagleBone also packs a 3D accelerated GPU, an 10/100 ethernet port, host USB and client USB interfaces. Add to that the abundance of peripheral interfaces and GPIOs on the board and it starts to look even better. It has 4 user LEDs, 65 GPIOs (3.3V), ADC, SPI, I2C, LCD header, 7 analog inputs, 3 serial ports, CAN bus and a lot more. All this at $45.

There's a lot going right for this board. I have already ordered mine from [Element 14][5] and expect to get it in about a month. Imagine putting this baby in a home automation system and controlling everything in your house from a brower over the internet. Why?, you ask... because I can ;)

[1]: http://beagleboard.org
[2]: http://beagleboard.org/Products/BeagleBone
[3]: http://beagleboard.org/Products/BeagleBone%20Black
[4]: http://www.raspberrypi.org/
[5]: http://www.element14.com/community/community/knode/dev_platforms_kits/element14_dev_kits/next-gen_beaglebone
