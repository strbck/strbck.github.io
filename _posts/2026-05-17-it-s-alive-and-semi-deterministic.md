---
layout: post
title:  "It's alive! (and semi-deterministic)"
date:   2026-05-17 00:00:00 -0500
categories:
---

# It's alive! (and semi-deterministic)

Good morning world! We've had a pretty productive week.

[Last time](https://strbckr.com/2026/05/12/one-pi-four-machines-zero-trust.html) we talked about the homelab, I gave a brief overview of the architecture. Today we're going to talk about some of the cool things we're doing with it! In particular, I'd like to discuss n8n, which is quickly becoming one of my favorite services.

I've never used any kind of no-code automation tool, but I was always impressed to learn about what people could accomplish with Zapier and the like. So after getting n8n configured on Clarke, I was eager to see what could be built with it. 

My first automation was *very* simple: a mirror for posts on my Bluesky account to my Threads account. Surprisingly easy to set up, and triggers every minute to check for new content! So done and done.

Next up, I tried something a little more complex -- and I wanted to bring in the Claude API. So this one features an RSS feed that pulls in news in cybersecurity, AI, and the local area. Then it packages the articles off to Claude for a brief synopsis and HTML writeup. The output from *that* call hits a Gmail node which fires off to my iCloud. Customizable morning digests for a nickel a day! 

The last one we (at this point, Claude and I) did was the most complicated workflow by far: a daily 'job matcher'. This one was tricky because I wanted to minimize token spend as much as possible; I had tried to build an automated task for job matching in Claude Cowork, but it would almost always hit my usage limit when it fired in the mornings. So we needed to optimize. 

The workflow starts with simple SerpAPI calls to the Google Jobs service, looking for postings in the last 24 hours in particular fields/domains I'd like. It gets the basic information (title, employer, description, etc.) and then sends them off to the Claude API. 

The idea here was to set up a 2-layered workflow: Claude would do an initial 'PASS'/'FAIL' assessment for criteria I set. The important thing here was that this assessment is very light -- it can run on Haiku 4.5 with an output limit of 10 tokens per job posting -- so virtually nothing spent on this layer. 

The 2nd layer is where Claude does the deep-dive. For job postings that passed the initial screen, we make a more complex call to Sonnet 4.6 to how the role is a good fit and the angle for the application. We then pull in a kind of 'master resume' document from my Google Drive, which gives Claude context on which to build targeted documents for the application. 

This next part (I thought) was pretty cool, and is what I really wanted to talk about today. Asking Sonnet to write up the whole document (resume, cover letter) wasn't ideal for two reasons: massive token spend, and the output wasn't consistent in terms of quality or formatting. So we needed to try something different.

Instead of having Sonnet write the whole thing, we set up a small Flask endpoint on the Clarke host as a microservice. This was to use a Python library for building a DOCX file (specifically wanted to use pip here and sidestep [all the nasty NPM supply chain worries that have been going on this week](https://unit42.paloaltonetworks.com/monitoring-npm-supply-chain-attacks/)). Also, it was just a neat architecture model to try out, and extensible for future purposes too.

The DOCX files come back as base64-encoded binaries, which get attached to another Gmail message and fired away, one email per matched posting. Pretty neat stuff if I say so myself! Here's a screen capture of the current automation diagram:

![Job match in n8n](/assets/images/jobmatchn8n.JPG){:width="100%"}

What I really learned with this workflow was how good deterministic harnessing for AI can help reduce costs significantly and tighten up overall output consistency. It also makes it much easier to troubleshoot the LLM prompts in the overall pipeline, because the model is only capable of modifying certain elements at each step.

All this is to say: 'semi-deterministic' isn't a real term by any means. A process is either deterministic or nondeterministic. *But in practice*, the core idea of this (deterministic harnessing for nondeterministic components) is an appropriate shorthand. 

So yeah. 'Clarke' is alive, and semi-deterministic. Really excited to see the other uses we can find for this little fella.

That's all for now folks! See you next time.
-Carter