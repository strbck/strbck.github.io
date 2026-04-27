---
layout: post
title:  "Interface 2037 Ready for Inquiry."
date:   2026-04-27 16:00:00 -0500
categories:
---

# "Interface 2037 Ready for Inquiry.

This is MUTHR — a Weyland-Yutani-inspired personal terminal I've been building over the past few weeks. It's a functional cyberdeck disguised as a prop from the *Alien* universe, and honestly it might be my favorite project I've worked on so far.

![MUTHR WIP Assembled](/assets/images/muthrwipassembled.jpg){:width="100%"}

---

## The Concept

This whole thing started when I stumbled across [bee-write-back](https://github.com/shmimel/bee-write-back), an open source project that I ended up forking as the foundation for this build. The Weyland-Yutani theming was my own spin on it — I wanted something that felt like it belonged on the USCSS Nostromo rather than on a desk in 2026. 

The goal was never just a prop though. MUTHR is meant to actually *do* things:

- **Journaling and writing** — a distraction-free terminal for getting words down (courtesy of the original bee-write-back software)
- **Claude chat terminal** — a dedicated IRC-inspired AI interface (yes, I asked Claude to help me build a Claude terminal)
- **Scripting and network analysis** — a lightweight tool for poking around on networks and running Python scripts

Basically a personal cyberdeck with a lore-accurate paint job.

---

## The Hardware

The guts are pretty straightforward — it's running on a **Raspberry Pi Zero 2W**, which is small enough to tuck cleanly inside the case without any drama. Speaking of the case, it's **3D printed PLA**, which I got printed at my local library for basically nothing. Huge shoutout to public library makerspaces — genuinely underrated resource.

The keyboard and other internals/additions I've made to the original project will be featured in the next post once the build is fully assembled. Stay tuned on that one.

---

## The Software

Here's where it comes together. The UI is a custom green-on-black terminal interface, very deliberately styled after the chunky retro-futuristic displays you'd see in the *Alien* franchise. Monospace font, white border lines, amber section headers, the whole deal.

![MUTHR WIP Readout](/assets/images/muthrwipreadout.jpg){:width="100%"}

The engineering readout you're seeing there is the WIP screensaver — reactor status, plasma manifold pressure, cooling node temps, fuel reserves. You know, the essentials. Weyland-Yutani Corp. timestamps included (and a secret rare message I'll share later).

---

## What's Next

There are some other additions I'll make like an aluminum backpanel and power indicator light, which will complete the whole assembly. Maybe even an ethernet port if I can squeeze it in. Either way, next up I'll be doing a full finished-build post with proper photos, a deeper dive into the software, and a demo of the Claude terminal in action.

Until then — MUTHR is nominal. All systems stable.

*2026.04.27 // WEYLAND-YUTANI CORP.*
