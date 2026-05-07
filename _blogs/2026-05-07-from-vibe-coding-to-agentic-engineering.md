---
layout: blog-post
title: "From Vibe Coding to Agentic Engineering"
date: 2026-05-07 00:00:00 +0000
categories: Blog
tags: [Agentic Engineering, Vibe Coding, AI Agents, LLM, Software Engineering]
draft: false
description: "Agentic engineering is replacing manual coding and static AI workflows. The data already shows the tipping point."
tldr: "Software engineering is moving through three stages: manual coding, copilot-style autocomplete, and now agentic engineering where AI agents execute plans autonomously. 55% of developers already use AI agents regularly, 27% of production code is AI-authored, and agent session durations nearly doubled in three months. The transition is not coming -- it is underway."
---

**TL;DR:** Software engineering is moving through three stages: manual coding, copilot-style autocomplete, and now agentic engineering where AI agents execute plans autonomously. 55% of developers already use AI agents regularly, 27% of production code is AI-authored, and agent session durations nearly doubled in three months. The transition is not coming -- it is underway.

---

Karpathy [called it](https://x.com/karpathy/status/1886192184808149383) vibe coding in February 2025. Fifteen months later, at [Sequoia AI Ascent 2026](https://www.youtube.com/watch?v=96jN2OCIfLs), he proposed [agentic engineering](https://karpathy.bearblog.dev/sequoia-ascent-2026/) as its professional successor. But framing this as vibe coding versus agentic engineering misses the larger picture. What we are actually watching is the third phase of a longer transition in how software gets built.

## Three phases of human-AI coding

<div style="overflow-x:auto;margin:32px 0;">
<table style="width:100%;border-collapse:collapse;font-size:0.88em;">
<thead>
<tr style="border-bottom:2px solid rgba(232,184,120,0.4);">
<th style="text-align:left;padding:10px 14px;color:#E8B878;">Phase</th>
<th style="text-align:left;padding:10px 14px;">Time</th>
<th style="text-align:left;padding:10px 14px;">How it works</th>
<th style="text-align:left;padding:10px 14px;">Human role</th>
</tr>
</thead>
<tbody>
<tr style="border-bottom:1px solid rgba(255,255,255,0.08);">
<td style="padding:10px 14px;font-weight:600;">Manual coding</td>
<td style="padding:10px 14px;">Before 2021</td>
<td style="padding:10px 14px;">Human writes every line</td>
<td style="padding:10px 14px;">Writer</td>
</tr>
<tr style="border-bottom:1px solid rgba(255,255,255,0.08);">
<td style="padding:10px 14px;font-weight:600;">Copilot era</td>
<td style="padding:10px 14px;">2021 -- 2024</td>
<td style="padding:10px 14px;">AI autocompletes, human accepts or rejects</td>
<td style="padding:10px 14px;">Editor</td>
</tr>
<tr>
<td style="padding:10px 14px;font-weight:600;">Agentic engineering</td>
<td style="padding:10px 14px;">2025 -- now</td>
<td style="padding:10px 14px;">AI agents plan, write, test autonomously</td>
<td style="padding:10px 14px;">Architect</td>
</tr>
</tbody>
</table>
</div>

Each phase changed what the human does. In the copilot era, you still wrote code -- the AI just guessed your next line. In agentic engineering, you write the spec and the verification criteria. The agent handles the implementation. Karpathy's [definition](https://karpathy.bearblog.dev/sequoia-ascent-2026/) captures it: "the professional discipline of coordinating fallible agents while preserving correctness, security, taste, and maintainability."

The shift from editor to architect is not incremental. It changes the skills that matter, the tools you reach for, and the failure modes you worry about.

## The data says we are already in phase three

This is not a prediction about the future. The transition is measurable right now.

**Adoption is past the tipping point.** The [Pragmatic Engineer survey](https://newsletter.pragmaticengineer.com/p/ai-tooling-2026) (February 2026) found that 95% of developers use AI tools at least weekly. More telling: 55% regularly use AI agents -- not autocomplete, but autonomous agents that plan and execute. The [Stack Overflow 2025 survey](https://survey.stackoverflow.co/2025/ai) (65,000+ respondents) put daily AI tool usage among professional developers at 51%.

<div style="margin:32px 0;">
<div style="font-size:0.82em;color:rgba(255,255,255,0.5);margin-bottom:12px;">Developer AI tool adoption (sources: Stack Overflow, Pragmatic Engineer, JetBrains)</div>
<div style="display:flex;flex-direction:column;gap:8px;">
<div style="display:flex;align-items:center;gap:12px;">
<span style="width:200px;font-size:0.85em;text-align:right;">Use AI tools weekly</span>
<div style="flex:1;background:rgba(255,255,255,0.06);border-radius:4px;height:24px;position:relative;">
<div style="width:95%;background:rgba(232,184,120,0.7);height:100%;border-radius:4px;"></div>
<span style="position:absolute;right:8px;top:3px;font-size:0.78em;font-weight:600;">95%</span>
</div>
</div>
<div style="display:flex;align-items:center;gap:12px;">
<span style="width:200px;font-size:0.85em;text-align:right;">Use AI for 50%+ of work</span>
<div style="flex:1;background:rgba(255,255,255,0.06);border-radius:4px;height:24px;position:relative;">
<div style="width:75%;background:rgba(232,184,120,0.55);height:100%;border-radius:4px;"></div>
<span style="position:absolute;right:8px;top:3px;font-size:0.78em;font-weight:600;">75%</span>
</div>
</div>
<div style="display:flex;align-items:center;gap:12px;">
<span style="width:200px;font-size:0.85em;text-align:right;">Use AI agents regularly</span>
<div style="flex:1;background:rgba(255,255,255,0.06);border-radius:4px;height:24px;position:relative;">
<div style="width:55%;background:rgba(232,184,120,0.4);height:100%;border-radius:4px;"></div>
<span style="position:absolute;right:8px;top:3px;font-size:0.78em;font-weight:600;">55%</span>
</div>
</div>
</div>
</div>

**Production code is already substantially AI-authored.** The largest empirical study to date (4.2 million developers, November 2025 to February 2026) measured AI-authored production code at 26.9%. Microsoft reports 20-30% internally. Google says 25%+. Gartner projects 60% by end of 2026.

**The tools are shifting from autocomplete to autonomous.** Anthropic's [agentic coding trends report](https://resources.anthropic.com/2026-agentic-coding-trends-report) shows that between October 2025 and January 2026, the 99.9th percentile Claude Code session duration nearly doubled from under 25 minutes to over 45 minutes. Agents are running longer because they are doing more before handing back to the human. The era of "accept this line suggestion" is giving way to "here is the PR, ready for review."

The revenue numbers tell the same story. Cursor went from $300M to $2B+ ARR in under a year. Claude Code hit $1B run rate faster than any AI coding tool in history. These are not niche tools. They are becoming the default way professional software gets written.

## What actually changes

Four things shift when you move from copilot-style coding to agentic engineering.

First, the unit of work changes. You stop thinking in lines of code and start thinking in tasks. "Implement the auth middleware with these constraints" replaces "write a function that checks the JWT." The spec becomes the primary artifact, not the code.

Second, verification replaces review. You cannot read every line an agent writes across a 30-minute session with a hundred commits. Instead, you invest in making output verifiable: comprehensive tests, type checking, CI pipelines, staging environments. Karpathy's principle from the Sequoia talk -- "LLMs automate what you can verify" -- is the reason coding agents are ahead of agents in other domains. Code has tests. Code has diffs. The more verifiable you make your workflow, the more you can delegate.

Third, and this is the one I feel most personally, the career profile of a programmer is changing. When the bottleneck was typing code, the profession rewarded speed and stamina -- young engineers with fresh syntax knowledge and the energy to grind out features had a natural edge. When the bottleneck shifts to architecture, system design, and knowing which tradeoffs will bite you in six months, experience becomes the scarce resource. Programming is starting to look less like a young person's game and more like medicine or law: a profession where accumulated project judgment compounds over a career. The people I see getting the most out of agentic tools are not the fastest coders. They are the ones who have seen enough systems fail to write a good spec.

Fourth, the failure mode changes. In manual coding, bugs come from typos and logic errors. In copilot coding, bugs come from accepting wrong suggestions. In agentic engineering, the risk is architectural: the agent builds something that works but is designed wrong, insecure, or unmaintainable. The [METR study](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) found that developers perceived themselves as 20-24% faster with AI tools while actually being 19% slower on familiar codebases -- because they over-trusted the output. The follow-up study with improved agentic tools showed an 18% speedup, suggesting the tooling is catching up, but the trust calibration problem remains.

## What comes next

The tools are converging on a common model. CLI agents ([Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Codex](https://github.com/openai/codex)), IDE agents ([Cursor](https://www.cursor.com/), [Zed](https://zed.dev/agentic-engineering)), and open-source options ([Aider](https://github.com/Aider-AI/aider), [OpenHands](https://github.com/All-Hands-AI/OpenHands)) all share the same basic interaction: human defines intent, agent executes, human verifies. Standards like [MCP](https://modelcontextprotocol.io/) and [agents.md](https://github.com/anthropics/agents-md) are making the ecosystem interoperable. The [awesome-agentic-engineering](https://github.com/jordimas/awesome-agentic-engineering) repo tracks the landscape.

Gartner forecasts 90% of enterprise software engineers using AI coding assistants by 2028. Given that we are already at 85% regular usage in 2026, I think the more interesting threshold is when agent-style usage overtakes autocomplete-style usage. We are at 55% agent adoption now. My guess is we cross 75% within a year.

Simon Willison [raised a fair concern](https://simonwillison.net/2026/May/6/vibe-coding-and-agentic-engineering/) about where this leads: as agents get reliable enough, the line between agentic engineering and vibe coding blurs. You stop reviewing every line even for production code. The accountability that agentic engineering is supposed to preserve starts dissolving. I think this is real, but it is a calibration problem, not a fundamental one. We already trust compilers, libraries, and frameworks we did not write. The question is building the verification infrastructure that justifies that trust for agents too.

The transition from manual coding to copilot took about three years. The transition from copilot to agentic engineering is happening faster. Karpathy pointed to December 2025 as the inflection point -- the moment error rates dropped enough that human attention shifted from correction to direction. We are five months past that inflection. The phase change is not coming. It is here.
