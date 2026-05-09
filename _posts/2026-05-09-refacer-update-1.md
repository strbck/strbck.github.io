---
layout: post
title:  "Refacer: Week One Update"
date:   2026-05-09 08:00:00 -0500
categories:
---

# Refacer: Week One Update

Quick progress check on Refacer. A lot got done this week.

The Python pipeline is now formalized — what was previously exploratory prototype code is cleaned up and properly structured. The full face detection → swap → enhance → scrub chain runs end to end without duct tape holding it together.

The Gradio UI is in. It's a prototype, but it works: drop in a folder, hit run, get anonymized photos out. Exactly the interaction model we were after. Running it locally in the browser, no external calls.

Metadata scrubbing via exiftool is wired up and operational. GPS coordinates, timestamps, camera serial numbers — all stripped on output. That was always a core requirement, not a nice-to-have, so it felt good to get it in early.

And the whole thing is now Dockerized. That's a big deal for the portability goal — no dependency nightmares, no "works on my machine" nonsense. If you can run Docker, you can run Refacer.

---

Next week the focus shifts to controls. Right now the pipeline runs with sensible defaults, but there's no way to tune it. We'll be adding:

- **Confidence thresholds** — filter out low-confidence detections rather than blindly swapping every pixel that might be a face
- **Multi-pass support** — the option to run multiple swapping passes on a detected face, which should improve coverage on difficult angles and partial occlusions

That second one is particularly interesting. A single pass occasionally leaves something recognizable behind on a face that's turned or partially obscured. Multiple passes should close that gap.

More to come.
