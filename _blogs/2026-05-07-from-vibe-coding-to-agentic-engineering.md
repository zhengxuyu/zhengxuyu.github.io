---
layout: blog-post
title: "From Vibe Coding to Agentic Engineering"
date: 2026-05-07 00:00:00 +0000
categories: Blog
tags: [Agentic Engineering, Vibe Coding, AI Agents, LLM, Software Engineering]
draft: false
description: "Karpathy frames vibe coding and agentic engineering as floor vs. ceiling. Here is how I see the split playing out."
tldr: "Vibe coding raises the floor -- anyone can create software. Agentic engineering raises the ceiling -- professionals coordinate fallible agents while keeping quality. The two are different disciplines, but the line between them is blurring fast as agents get more reliable."
---

**TL;DR:** Vibe coding raises the floor -- anyone can create software. Agentic engineering raises the ceiling -- professionals coordinate fallible agents while keeping quality. The two are different disciplines, but the line between them is blurring fast as agents get more reliable.

---

In February 2025, Karpathy [tweeted](https://x.com/karpathy/status/1886192184808149383):

> There's a new kind of coding I call "vibe coding", where you fully give in to the vibes, embrace exponentials, and forget that the code even exists.

A throwaway tweet, by his own admission. Collins Dictionary made it Word of the Year. Everyone started shipping software without reading it.

Fifteen months later, at [Sequoia AI Ascent 2026](https://www.youtube.com/watch?v=96jN2OCIfLs), he came back with a sharper framing: "Vibe coding raises the floor. Agentic engineering raises the ceiling. Two different goals. Two different disciplines."

I have been living through this transition. Here is how I see it.

## Vibe coding worked until it didn't

Vibe coding was great for throwaway projects. Describe what you want, accept the output, iterate. People who had never written a for loop were deploying web apps. The barrier to creating software dropped to near zero.

The trouble came when vibe-coded projects grew past the throwaway stage. No one was reviewing the output, so security holes went unnoticed. Debugging became guesswork because there was no mental model of what the code was doing. The vibes were great until something broke.

Karpathy meant it for weekend projects. People tried to run production with it.

## December 2025 changed things

Karpathy pointed to December 2025 as an inflection point. He said he could not remember the last time he corrected the model. The constant fix-what-the-AI-broke loop disappeared. Human attention shifted from catching mistakes to directing what gets built: architecture, security, taste.

That shift is what makes agentic engineering a different discipline, not just better vibe coding.

## What agentic engineering actually means

From Karpathy's [Sequoia summary](https://karpathy.bearblog.dev/sequoia-ascent-2026/):

> Agentic engineering is the professional discipline of coordinating fallible agents while preserving correctness, security, taste, and maintainability.

Fallible -- because models have "spiky" capabilities. They refactor 100k-line codebases and then make baffling mistakes on trivial things. Coordinating -- because it is no longer a single prompt-response cycle; multiple agents work in parallel on shared code. Preserving -- because speed without quality is just technical debt generated faster.

What remains human: you own the spec, the plan, and the quality bar. "You're still responsible for your software just as before."

One idea from the talk that stuck with me: "LLMs automate what you can verify." Code is verifiable (tests, type checks, diffs), which is why coding agents are ahead. The more verifiable you make your workflow, the more you can safely delegate.

## The tooling right now

The [awesome-agentic-engineering](https://github.com/jordimas/awesome-agentic-engineering) repo gives a good snapshot. CLI agents ([Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Codex](https://github.com/openai/codex)) operate directly on your codebase -- they feel like junior engineers in your terminal. IDE tools ([Cursor](https://www.cursor.com/), [Zed](https://zed.dev/agentic-engineering)) embed agents into the editing environment. Zed frames it as working with stochastic tools being [a new engineering skill](https://zed.dev/agentic-engineering) in its own right.

The common thread: "AI writes code for you" is becoming "AI executes plans under your direction."

## The line is blurring

Simon Willison [wrote yesterday](https://simonwillison.net/2026/May/6/vibe-coding-and-agentic-engineering/) about something that makes me uneasy too:

> As the coding agents get more reliable, I'm not reviewing every line of code that they write anymore, even for my production level stuff.

He produces repos with a hundred commits and comprehensive tests in 30 minutes. At that speed, line-by-line review is impractical. You start trusting the agent like a library you didn't write. Each successful unreviewed deployment raises your confidence -- but confidence is not verification.

His rule: if a bug only hurts you, vibe code away. If others depend on it, you need agentic engineering discipline. Fair enough. But when agents write their own test suites and set up CI, the question shifts from "did you review the code" to "did you review the verification."

## Where I think this goes

Karpathy talked about the 10x engineer being "magnified a lot more." I think the magnification cuts both ways. A good engineer with agents produces what used to take a team. A careless one produces damage at the same scale.

My bet: the gap between model capability and model reliability will narrow but never fully close. The human role keeps shifting toward judgment, taste, and accountability. Vibe coding brought millions of new people into software creation. Agentic engineering is figuring out how to keep the quality bar at speeds that seemed absurd two years ago.

The interesting question is how long the distinction holds up as agents keep getting better.
