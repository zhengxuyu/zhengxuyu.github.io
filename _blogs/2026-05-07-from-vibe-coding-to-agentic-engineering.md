---
layout: blog-post
title: "From Vibe Coding to Agentic Engineering"
date: 2026-05-07 00:00:00 +0000
categories: Blog
tags: [Agentic Engineering, Vibe Coding, AI Agents, LLM, Software Engineering]
draft: false
description: "Karpathy frames vibe coding and agentic engineering as floor vs. ceiling. Here is how I see the split playing out."
tldr: "Vibe coding raised the floor -- anyone can ship software. But production needs someone accountable. Agentic engineering is the discipline that emerged to fill that gap: coordinating fallible agents while keeping quality. The catch is that the boundary between the two keeps moving as agents improve."
---

**TL;DR:** Vibe coding raised the floor -- anyone can ship software. But production needs someone accountable. Agentic engineering is the discipline that emerged to fill that gap: coordinating fallible agents while keeping quality. The catch is that the boundary between the two keeps moving as agents improve.

---

In February 2025, Karpathy [described](https://x.com/karpathy/status/1886192184808149383) a new way of working: "fully give in to the vibes, embrace exponentials, and forget that the code even exists." He called it vibe coding. Collins Dictionary made it Word of the Year. Within months, people who had never written a for loop were deploying web apps.

That was the promise: software creation with no barrier to entry. And for weekend projects and quick prototypes, the promise held. But then people started running production with it, and a gap opened up.

The gap was accountability. Vibe coding works when you do not care why the code works, only that it does. The moment other people depend on your software, "it mostly works" is not a quality bar. Nobody was reviewing the output. Security holes went unnoticed. Bugs were unfixable because there was no mental model of what the code was doing. Vibe coding had democratized creation, but it had no answer for ownership.

Something needed to fill that gap. Around December 2025, Karpathy [noted](https://karpathy.bearblog.dev/sequoia-ascent-2026/) that he could not remember the last time he corrected the model. Error rates had dropped enough that the work changed in kind, not just degree. Instead of fixing what the AI broke, you could direct what it built. The job shifted from typist to architect, from keyboard to spec.

That shift gave the gap a name. At [Sequoia AI Ascent 2026](https://www.youtube.com/watch?v=96jN2OCIfLs), Karpathy called it agentic engineering: "the professional discipline of coordinating fallible agents while preserving correctness, security, taste, and maintainability." His framing was clean. Vibe coding raises the floor. Agentic engineering raises the ceiling. Two different disciplines solving two different problems.

What makes it a discipline, not just a workflow, is that it puts accountability back in. You own the spec. You own the verification. You own the quality bar. The AI changes how code gets written, not who is responsible for it. And the "fallible" part matters. Current models have spiky capabilities -- they refactor massive codebases in one pass and then make baffling mistakes on trivial things. Knowing where the spikes and valleys are is the new core competence.

The [tooling](https://github.com/jordimas/awesome-agentic-engineering) has organized around this idea. CLI agents like [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and [Gemini CLI](https://github.com/google-gemini/gemini-cli) operate directly on your codebase. IDE tools like [Cursor](https://www.cursor.com/) and [Zed](https://zed.dev/agentic-engineering) embed agents into the editor. They all share a model where the human sets direction and the agent executes. Karpathy's verifiability principle explains why coding is ahead of other domains: code has tests, type checkers, diffs. The more verifiable your workflow, the more you can delegate.

But here is the tension I keep coming back to. The boundary between vibe coding and agentic engineering is supposed to be clear -- one is casual, the other is professional. In practice, it is already blurring. Simon Willison [wrote yesterday](https://simonwillison.net/2026/May/6/vibe-coding-and-agentic-engineering/) that he is no longer reviewing every line of agent-generated code, even for production. He produces repos with a hundred commits in 30 minutes. At that speed, review is impractical. You trust the agent like you trust a library you did not write.

Each successful unreviewed deployment makes you more confident. But confidence is not verification. And when agents write their own test suites and set up their own CI, the question shifts from "did you review the code" to "did you review the verification." The accountability that agentic engineering was supposed to restore starts to feel like it is dissolving again, just one layer up.

I do not have a clean resolution for this. My working answer is that the gap between what agents can do and what they can be trusted to do will keep narrowing but never fully close. The human role keeps moving upward -- from writing code, to directing agents, to verifying verification -- but it does not disappear. Someone still has to own the outcome.

Karpathy's floor-and-ceiling metaphor is the right starting point. The question that keeps me up is whether the ceiling eventually becomes the new floor.
