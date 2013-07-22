---
title: "Assembly Programming for TI MSP430 Launchpad on Linux"
created_at: 2013-04-19 17:35:54 -0700
kind: article
categories:
    - MSP430
    - Electronics
published: false
---

Texas Instruments Launchpad is an evaluation board for the MSP430 line of microcontrollers from TI. The best part about these kits is the price - they cost a mere $4.30 per unit and come packed with features. MSP line of microcontrol...

You will need to install some tools to get started with the assembly coding for these microcontrollers. First off, is the assembler. An assembler converts the assembly language code into machine code. A stream of bits being programmed into appropriate memory locations. There are a few assemblers available for MSP430 controllers but since we eventually would move into C programming for these controllers, I recommend you install [mspgcc][1]. Currently TI and RedHat are working on merging the changes upstream to gcc, eventually replacing mspgcc, but we will worry about that later. For now, install mspgcc following the instructions on the [wiki][2]. Next, we need a tool to program the controller from Linux. You will need to install [mspdebug][3] for this. If you use Archlinux, both mspgcc and mspdebug are available in the AUR.

<!-- more -->

Okay then - on with the actual coding. If you've read my [last][4] [two][5] posts, you must have guessed what is the first program we will be writing with the launchpad. That's right, the blink LED code.
