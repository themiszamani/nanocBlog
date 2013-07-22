---
title: "Controlling an LED on the Raspberry-Pi Using C"
created_at: 2013-04-18 21:35:40 -0700
kind: article
categories:
    - Raspberry-Pi
    - Electronics
published: true
---

If you read my [previous][1] post on the Raspberry-Pi, I spoke about controlling an LED connected to the Pi using python. Python is good enough when it comes to simple tasks such as, well, blinking LEDs, but when you want to do some other intensive tasks along with it, nothing beats the speed of C. That, plus, you should do it because it's fun. Really.

Let's keep the same setup as the last time. Anode of the LED is connected to GPIO 17 and the cathode to the ground. Let's create a new file to control the GPIO using C.

<!-- more -->

    #!c
    // This library provides access to GPIO and other IO functions of
    // the Broadcom BCM2835 chip on the Raspberry-Pi.
    #include <bcm2835.h>

    // Blinks on Raspberry-Pi GPIO 17
    #define LED_PIN RPI_GPIO_P1_17

    int main(int argc, char **argv) {
        // Return if the initialization fails.
        if (!bcm2835_init())
	        return 1;

        // Set the LED_PIN to be an output
        bcm2835_gpio_fsel(LED_PIN, BCM2835_GPIO_FSEL_OUTP);

        // Now blink the LED
        while (1) {
	        bcm2835_gpio_write(PIN, HIGH);  // LED on
        	delay(1000);
	        bcm2835_gpio_write(PIN, LOW);   // LED off
	        delay(1000);
        }

        bcm2835_close();
        return 0;
    }

Save the file as - say - _blink\_led.c_. This program uses the [bcm2835][2] library for the Raspberry-Pi. This example is taken from the official website for the library. The library provides a lot of functions for controlling low level peripherals on the 26 pin header on Raspberry-Pi board. Let's go through the more confusing parts in the code here. The P1 in the define statement that defines the pin refers to the version of the Raspberry-Pi board you have. Next, it checks if it can access the initialization routine for the RPi and exits if it cannot. Next, it configures the GPIO as output. Finally, it toggles the GPIO as HIGH (1) and LOW (0) to turn the LED on and off. There is an exhaustive list of functions in this library with a very good [documentation available][3]. Download the _bcm2835_ library and install it.

    cd
    wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.25.tar.gz
    tar zxvf bcm2835-1.25.tar.gz
    cd bcm2835-1.25
    ./configure
    make
    sudo make check
    sudo make install

Now, compile the code and run it,

    gcc -o blink_led blink_led.c -l bcm2835
    sudo ./blink_led

That's it. Again, if you did everything correctly, you should see the LED blinking every second. Point to be noted here is that this library, though faster than the python script we wrote earlier, still does not provide real time performance for reasons stated on the [website][4]. If you are interested in other approaches to this problem that use other programming languages or even a lower level access (register manipulation) then head over to the [wiki][5] for low level peripherals on the RPi. Happy coding.

[1]: http://nerditya.com/2013/04/blinking-an-led-on-the-raspberry-pi/
[2]: http://www.airspayce.com/mikem/bcm2835/group__gpio.html
[3]: http://www.airspayce.com/mikem/bcm2835/
[4]: http://www.airspayce.com/mikem/bcm2835/
[5]: http://elinux.org/RPi_Low-level_peripherals

