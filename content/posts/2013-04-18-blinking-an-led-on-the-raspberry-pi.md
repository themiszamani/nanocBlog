---
title: "Blinking an LED on the Raspberry Pi"
created_at: 2013-04-18 19:33:12 -0700
kind: article
categories:
    - Raspberry-Pi
    - Electronics
published: true
---

I got my Raspberry-Pi a few months ago. I was just using it as an IRC server for the best part of the last few months. Finally I decided to actually start some programming with the Pi. As with most other hardware development platforms, the first basic project I set out for was - blinking an LED.

Although blinking an LED is not the most exciting thing in the world, especially when using a powerful microcomputer such as the Pi, it gets you familiar with the basics of the hardware and gives you a starting point to build on. So, let's get started.

The first thing you will need - if you haven't already - is to install an operating system on the Pi. I use [Archlinux][1] but that may not be the best starting point for beginners. If you don't have a lot of experience with Linux then I recommend you install [Raspian][2] on your Pi.

<!-- more -->

If you look at the Pi, there's a <X> pin header on the board that has some peripheral connections as well as a few GPIOs. GPIOs are general purpose input output pins. These are the pins where you can 'drive' a 1 or a 0 and control hardware. We would connect one end of the LED to a GPIO and the other to either +3.3V or GND.

[![](/images/posts/2013-04-18-GPIO-header-thumbnail.png)](/images/posts/2013-04-18-GPIO-header.png)

Hook up the anode of the LED (the longer pin) to GPIO 17. Connect the shorter end to GND. Now, open up a terminal on the Pi. If you don't have a monitor and keyboard connected to the Pi and don't know know how to log in to the Pi using SSH please search how to do that. Then, try out the following commands.

    #!bash
    sudo su
    cd /sys/class/gpio
    echo 17 > export
    cd gpio17
    echo out > direction
    echo 1 > value

You should see the LED light up. Though it works, it's not the most attractive way of controlling the GPIOs. For controlling the GPIOs using Python, there's a module, [RPi.GPIO][3] that you can use. If you installed Raspian, it already comes with RPi.GPIO. Controlling GPIOs is much easier with this library. Create the following script.

    #!python
    import RPi.GPIO as GPIO
    import time
    # Pin to which LED is connected
    LED_PIN = 17
    # Blink function
    def blink(inPin):
        GPIO.output(inPin,GPIO.HIGH)
        time.sleep(1)
        GPIO.output(inPin,GPIO.LOW)
        time.sleep(1)
        return
    # To use Raspberry-Pi board pin numbers
    GPIO.setmode(GPIO.BOARD)
    # Set the LED pin as output
    GPIO.setup(LED_PIN, GPIO.OUT)
    # Blink the LED forever
    while (1):
        blink(LED_PIN)
    GPIO.cleanup()

Save this file - say _blink\_led.py_ - and then run the script as,

    #!python
    sudo python blink_led.py

If you did everything correct, you should see the LED blinking with on and off times of a second each. There are other ways to control GPIOs, including low level C programming. We will see that in the next post.

[1]: http://archlinuxarm.org/platforms/armv6/raspberry-pi/
[2]: http://www.raspberrypi.org/downloads
[3]: https://pypi.python.org/pypi/RPi.GPIO
