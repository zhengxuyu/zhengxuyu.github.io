---
layout: blog-post
title: "From Vibe Coding to Agentic Engineering"
date: 2026-05-07 00:00:00 +0000
categories: Blog
tags: [Agentic Engineering, Vibe Coding, AI Agents, LLM, Software Engineering]
draft: false
description: "Karpathy frames vibe coding and agentic engineering as two distinct disciplines. One raises the floor. The other raises the ceiling. Here is how we got from one to the other, and where the line between them is already blurring."
tldr: "Vibe coding, coined by Karpathy in February 2025, democratized software creation by letting anyone describe what they want and get working code. Agentic engineering, which he introduced at Sequoia AI Ascent 2026, is the professional discipline of coordinating fallible AI agents while preserving correctness, security, and taste. They serve different goals: vibe coding raises the floor, agentic engineering raises the ceiling. But the boundary is getting fuzzy as agents get more reliable."
---

**TL;DR:** Vibe coding, coined by Karpathy in February 2025, democratized software creation by letting anyone describe what they want and get working code. Agentic engineering, which he introduced at Sequoia AI Ascent 2026, is the professional discipline of coordinating fallible AI agents while preserving correctness, security, and taste. They serve different goals: vibe coding raises the floor, agentic engineering raises the ceiling. But the boundary is getting fuzzy as agents get more reliable.

---

In February 2025, Andrej Karpathy fired off what he later called ["a shower of thoughts throwaway tweet"](https://x.com/karpathy/status/1886192184808149383):

> There's a new kind of coding I call "vibe coding", where you fully give in to the vibes, embrace exponentials, and forget that the code even exists.

He was describing his weekend workflow with Cursor Composer and Claude Sonnet. "I just see stuff, say stuff, run stuff, and copy paste stuff, and it mostly works." The tweet went viral. Collins Dictionary named "vibe coding" their Word of the Year for 2025. Suddenly everyone from product managers to teenagers was shipping software without reading a single line of it.

Fifteen months later, at [Sequoia's AI Ascent 2026](https://www.youtube.com/watch?v=96jN2OCOfLs), Karpathy came back with a different framing. Vibe coding was never the endgame. It was the beginning of something else.

"Vibe coding raises the floor," he said. "Agentic engineering raises the ceiling. Two different goals. Two different disciplines."

I have been watching this transition happen in my own work over the past year. What follows is my attempt to trace the arc from vibe coding to agentic engineering, and to think through what the split actually means in practice.

## The vibe coding era

Karpathy had already hinted at this direction back in 2023 when he said "the hottest new programming language is English." But vibe coding gave the idea a name and a permission structure. You did not need to understand the code. You just needed to describe what you wanted, accept the output, and iterate on the vibes.

For throwaway projects, this worked remarkably well. Internal tools, quick prototypes, personal utilities, weekend experiments. The barrier to creating software dropped to near zero. People who had never written a for loop were deploying web apps.

The problems showed up when vibe-coded projects grew past the throwaway stage. Without understanding what the code was doing, debugging became guesswork. Security holes went unnoticed because nobody was reviewing the output. Performance issues compounded because there was no mental model of the underlying architecture. The vibes were great until something broke, and then you had no idea why.

This was not a failure of the concept. Karpathy was clear from the start that vibe coding was for "throwaway weekend projects." The failure was in scope creep. People took a weekend workflow and tried to run production systems with it.

## What changed in December 2025

At the Sequoia talk, Karpathy pointed to December 2025 as an inflection point. He said he could not remember the last time he had to correct the model. Error rates had dropped enough that the constant correction loop disappeared.

This matters because it changed the nature of the work. When models were unreliable, human attention was mostly spent on catching mistakes. When models became reliable enough, human attention could shift to higher-order concerns: architecture, security, taste, system design. The job stopped being "fix what the AI broke" and started being "direct what the AI builds."

That shift is what makes agentic engineering a different discipline, not just a better version of vibe coding.

## Agentic engineering as Karpathy defines it

His [definition](https://karpathy.bearblog.dev/sequoia-ascent-2026/) is worth quoting directly:

> Agentic engineering is the professional discipline of coordinating fallible agents while preserving correctness, security, taste, and maintainability.

Three words stand out: fallible, coordinating, and preserving.

Fallible because current models have what Karpathy calls "spiky" capability profiles. They can refactor a 100,000-line codebase in one pass and then make a baffling mistake on something trivial. The spikes are real and so are the valleys. Agentic engineers need to know where both are.

Coordinating because the work is no longer about a single prompt-response cycle. Modern agent workflows involve multiple agents working in parallel, reading and writing to shared codebases, calling external tools, running tests, and reporting results. Someone has to orchestrate that.

Preserving because speed without quality is just technical debt generated faster. "You're still responsible for your software just as before," Karpathy said. The AI changes how the code gets written, not who is accountable for it.

What remains irreducibly human, in his framework: aesthetics, judgment, taste, and oversight. You own the spec. You own the plan. You own the quality bar.

## The tools shaping the practice

The [awesome-agentic-engineering](https://github.com/jordimas/awesome-agentic-engineering) repository gives a useful snapshot of where the tooling stands. The ecosystem has split along a few axes.

On one side, CLI-native agents like [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Gemini CLI](https://github.com/google-gemini/gemini-cli), and [Codex](https://github.com/openai/codex) operate directly on local codebases. They read files, run commands, edit code, and commit changes. They feel less like assistants and more like junior engineers who happen to live in your terminal.

On the other side, IDE-integrated tools like [Cursor](https://www.cursor.com/) and [Zed](https://zed.dev/) embed agent capabilities into the editing environment. Zed's [agentic engineering page](https://zed.dev/agentic-engineering) frames the approach as "combining human craftsmanship with AI tools," positioning it between what they call "technological zealotry" (all code should be AI-generated) and "dismissive skepticism" (AI code is garbage). Their argument is that working with stochastic tools is itself a new engineering skill that demands "rigor, clarity, and intent."

Open-source alternatives like [Aider](https://github.com/Aider-AI/aider), [OpenHands](https://github.com/All-Hands-AI/OpenHands), and [Plandex](https://github.com/plandex-ai/plandex) fill various niches. Standards like [MCP](https://modelcontextprotocol.io/) (Model Context Protocol) and [agents.md](https://github.com/anthropics/agents-md) are emerging to make these tools interoperable.

What all of them share is a shift from "AI writes code for you" to "AI executes plans under your direction." The human moves from typist to architect. Or as Karpathy put it, from the keyboard to the spec.

## The verifiability principle

One of the more interesting ideas from the Sequoia talk is what I am calling the verifiability principle: "LLMs automate what you can verify."

Code is a domain where verification is relatively tractable. You can run tests. You can type-check. You can diff. You can deploy to staging and click through. This is why coding agents have advanced faster than agents in domains where correctness is harder to measure.

Karpathy's prediction follows from this: the next domains to get automated are the ones where someone figures out how to make verification tractable. If you cannot check the output, you cannot trust the agent. And if you cannot trust the agent, you are back to doing the work yourself.

This has a practical implication for how engineers work with agents today. The more verifiable you make your workflow (clear specs, comprehensive tests, typed interfaces, automated checks), the more you can safely delegate. Investing in verification infrastructure is not overhead. It is what makes delegation possible.

## The line is already blurring

Here is the part that makes me uneasy. Simon Willison [wrote about this](https://simonwillison.net/2026/May/6/vibe-coding-and-agentic-engineering/) just yesterday:

> The problem is that as the coding agents get more reliable, I'm not reviewing every line of code that they write anymore, even for my production level stuff.

He reports producing "repositories with a hundred commits and a beautiful readme and comprehensive tests in 30 minutes." At that speed, line-by-line review becomes impractical. You start trusting the agent the way you trust a library you did not write or an API you did not build. It works until it does not.

Willison flags this as a normalization of deviance risk. Each successful unreviewed deployment increases your confidence. But confidence is not the same as verification. You are just accumulating unexamined assumptions.

His boundary rule is practical: if a bug only hurts you, vibe code away. If other people depend on the software, you need the discipline of agentic engineering. "Vibe coding delegates code ownership to the AI. Agentic engineering keeps your engineering judgment in the driver's seat."

But even that line is getting harder to hold. When agents can write comprehensive test suites, set up CI pipelines, and catch their own regressions, the question shifts from "did you review the code" to "did you review the verification." Meta-verification. Turtles all the way down.

## The 10x multiplier, reloaded

"People used to talk about the 10x engineer," Karpathy said at Sequoia. "I think this is magnified a lot more."

I think he is right, and I think the magnification goes in both directions. A skilled engineer who knows how to spec clearly, verify thoroughly, and direct agents effectively can produce output that would have taken a team of ten a year ago. But an engineer who delegates without understanding, who trusts without verifying, who ships without reviewing, can produce damage at the same amplified scale.

Agentic engineering is a power tool. Power tools are great when you know what you are doing. They are dangerous when you do not.

## Where this is heading

Karpathy introduced the concept of Software 3.0 at the talk: the LLM as computer, with the context window as RAM, model weights as CPU, and external tools as peripherals. In this framing, writing software becomes writing prompts. Installation becomes copying a text block into your agent. The entire abstraction layer shifts upward.

I find this both exciting and worth being cautious about. The bitter lesson that Karpathy references (every hybrid system will be outperformed by pure end-to-end neural approaches) has held up historically, but we are in a strange moment where the neural systems are powerful enough to be useful and unreliable enough to be dangerous. The discipline of agentic engineering exists precisely because of that gap.

My bet is that the gap will narrow but never fully close. Models will get better. Verification tools will get better. The human role will shift further toward judgment, taste, and accountability. But the need for someone to own the outcome, someone who understands what is being built and why, that does not go away. It just becomes more leveraged.

Karpathy's floor-and-ceiling metaphor is the cleanest way I have found to think about this. Vibe coding brought millions of new people into software creation. Agentic engineering is figuring out how to keep the quality bar while moving at speeds that would have seemed absurd two years ago. Both matter. They are just solving different problems.

The interesting question is not which one wins. It is how long the distinction holds up as the agents keep getting better.
