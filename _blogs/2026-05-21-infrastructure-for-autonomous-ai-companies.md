---
layout: blog-post
title: "The Infrastructure for Autonomous AI Companies"
date: 2026-05-21 00:00:00 +0000
categories: Blog
tags: [AI Agents, Autonomous Companies, Agent Orchestration, One-Person Company, Agentic Engineering, AI Infrastructure]
draft: false
pinned: true
keywords: "autonomous AI companies, AI agents, agent infrastructure, agent orchestration, one-person company, agentic engineering, AI organization, Zhengxu Yu"
description: "A short note on autonomous AI companies: the interesting shift is not agents doing tasks, but tasks routing themselves through agents, tools, budgets, permissions, evals, and human approvals."
tldr: "There is a new kind of company shape emerging. It does not feel like a robot CEO. It feels like a ticket queue that learned to hire temporary workers. In human companies, scaling means hiring. In AI companies, scaling means routing: sending each task through the right agents, tools, permissions, budgets, evals, and human approvals without losing the plot."
---

Recent AI agent progress made me start thinking about what comes next. My answer is AI organization.

A single agent has a ceiling. The context is finite. The tool list gets too long. Skills start to overlap. At some point, making one agent more capable also makes it more complicated to steer.

The next step is not to keep stuffing more context, tools, and skills into one universal agent. It is to split the work across smaller agents with narrower roles, then build the layer that routes tasks between them.

Take a normal founder question: "Is this idea worth building?"

That is not one task. First you have to clarify the user, the pain, the wedge, the market, the obvious objections, and what would make the idea false. Then someone should check whether people already search for this, complain about it, or pay for bad alternatives. Then the vague idea has to become a narrow first version. Then someone has to estimate whether that version is a weekend prototype or a three-month build. Then someone has to ask who the first ten users would be and how to reach them. Finally, someone has to make the founder decision: kill it, park it, or define the smallest test that would make the next decision less stupid.

A single agent can try to hold all of that in its head, but that is exactly where the context gets muddy. The cleaner version is to route the idea through agents with different scopes, keep the intermediate artifacts, and only bring the human back for the real decision.

That is the moment the "AI company" idea stops sounding like a sci-fi org chart and starts sounding like infrastructure.

MCP and A2A matter because they make this less imaginary. MCP lets agents reach tools and data. A2A lets agents discover, talk to, and delegate to other agents. So the interesting question is no longer just "can the model do the task?" It becomes:

which agent should do which part, with which tool, under which permission, paid from which budget, checked by which eval, and escalated to which human?

In human companies, scaling means hiring. In AI companies, scaling means routing.

## The Data

The data does not prove that autonomous AI companies already exist. It says something more interesting: agents are entering workflows faster than companies are learning how to control them.

<div style="overflow-x:auto;margin:28px 0;">
<table style="width:100%;border-collapse:collapse;font-size:0.88em;">
<thead>
<tr style="border-bottom:2px solid rgba(232,184,120,0.4);">
<th style="text-align:left;padding:10px 14px;color:#E8B878;">Signal</th>
<th style="text-align:left;padding:10px 14px;">Data</th>
<th style="text-align:left;padding:10px 14px;">Meaning</th>
</tr>
</thead>
<tbody>
<tr style="border-bottom:1px solid rgba(255,255,255,0.08);">
<td style="padding:10px 14px;font-weight:600;">Adoption</td>
<td style="padding:10px 14px;"><a href="https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai">McKinsey 2025</a>: 23% scaling agentic AI in at least one function; 39% experimenting.</td>
<td style="padding:10px 14px;">Agents are moving into real operations.</td>
</tr>
<tr style="border-bottom:1px solid rgba(255,255,255,0.08);">
<td style="padding:10px 14px;font-weight:600;">Distribution</td>
<td style="padding:10px 14px;"><a href="https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025">Gartner</a>: up to 40% of enterprise apps may include task-specific AI agents by end of 2026, up from less than 5% in 2025.</td>
<td style="padding:10px 14px;">Agents become a software distribution pattern.</td>
</tr>
<tr style="border-bottom:1px solid rgba(255,255,255,0.08);">
<td style="padding:10px 14px;font-weight:600;">Experimentation</td>
<td style="padding:10px 14px;"><a href="https://www2.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/autonomous-generative-ai-agents-still-under-development.html">Deloitte</a>: 25% of gen-AI companies expected to launch agentic pilots in 2025; 50% by 2027.</td>
<td style="padding:10px 14px;">The pilot curve is steep.</td>
</tr>
<tr style="border-bottom:1px solid rgba(255,255,255,0.08);">
<td style="padding:10px 14px;font-weight:600;">Governance</td>
<td style="padding:10px 14px;"><a href="https://www.deloitte.com/us/en/what-we-do/capabilities/applied-artificial-intelligence/content/state-of-generative-ai-in-enterprise.html">Deloitte 2026</a>: only about one in five companies has mature governance for autonomous agents.</td>
<td style="padding:10px 14px;">Control is behind adoption.</td>
</tr>
<tr>
<td style="padding:10px 14px;font-weight:600;">Security</td>
<td style="padding:10px 14px;"><a href="https://newsroom.ibm.com/2025-07-30-ibm-report-13-of-organizations-reported-breaches-of-ai-models-or-applications%2C-97-of-which-reported-lacking-proper-ai-access-controls">IBM 2025</a>: 13% reported breaches of AI models or apps; 97% of those lacked proper AI access controls.</td>
<td style="padding:10px 14px;">Unmanaged agency becomes security risk.</td>
</tr>
</tbody>
</table>
</div>

The ingredients are arriving in the wrong order. First agents show up inside products. Then pilots spread. Then access-control problems appear. Then everyone realizes the hard part was not "can the agent do the task?" It was "who let it do that, with what authority, and how do we know it was right?"

Software development already has a small version of this. [Stack Overflow 2025](https://survey.stackoverflow.co/2025/ai) found 84% of developers use or plan to use AI tools, and 51% of professional developers use them daily, while sentiment and trust remain fragile. People use the tools anyway. They just stop trusting the output by default.

That is the whole thing: agency is getting cheap; accountability is not.

## The Company Is Not the Agent

The tempting mistake is to think the agent is the interesting unit.

It isn't. The agent is just labor. The company is the system around the labor.

An agent can complete a task. A company has to remember what happened, allocate risk, decide who is allowed to spend money, know which facts are official, evaluate the output, and explain itself later.

If every AI worker is just a prompt plus tools, the system cannot answer basic company questions:

- Who is acting?
- What can they access?
- What are they allowed to spend?
- Which memory is official?
- How is output judged?
- Who approves risky actions?
- What record exists after the action?

This is where the infrastructure gets boring, which is usually a sign that it is real. Identity. Permissions. Memory. Budgets. Evals. Audit logs. Human approval paths.

Without that layer, "autonomous company" mostly means giving a model too many tools and hoping nothing expensive happens.

## Hiring Becomes Routing

This is the cleanest way I can say the shift:

in a human company, you scale by adding people;

in an AI company, you scale by adding routable capabilities.

Suppose a customer asks for a custom enterprise integration. A naive agent system gives the request to a sales agent and hopes for the best. The more company-like version routes it:

- sales qualifies the opportunity
- engineering checks feasibility
- finance estimates margin
- legal flags contractual risk
- a reviewer checks policy compliance
- a human approves only if risk or value crosses a threshold

The question quietly changes from "who do we employ?" to "which capability should receive this task under these constraints?"

This is the part that feels new. A team can exist for one task, get a budget, use a few tools, produce an artifact, get evaluated, leave a log, and dissolve.

The org chart becomes executable. Or maybe the org chart disappears and what remains is a routing graph.

## The Infrastructure Stack

The stack is not conceptually hard. It is just the stuff you suddenly need when work can act on its own.

**Identity.** Every agent needs a persistent role, scope, skill profile, work history, and permission boundary. Without identity, there is no responsibility.

**Memory.** The organization cannot live in the context window. It needs personal memory, team memory, and institutional memory, with ownership, correction, and approval.

**Permissions.** Autonomy means action inside boundaries. Tool access is too coarse. Permissions must cover data sensitivity, action type, dollar amount, reversibility, external visibility, and approval thresholds.

**Budgets.** Digital labor still has economics. Compute, tool spend, model tier, and human review time all need allocation. The AI company needs a P&L for intelligence.

**Evaluation.** The manager becomes a test harness. Code has tests. Support has satisfaction and escalation rates. Marketing has conversion. Strategy has delayed outcomes. Agents are useful only where output can be judged.

**Audit.** Every meaningful action needs a ledger: agent, context, tool call, change, cost, approval, and outcome. The audit log is not just compliance. It is how the organization learns.

**Governance.** I do not want to manage a hundred chat windows. I want to set mission, risk appetite, approval thresholds, capital allocation, and escalation policy. [NIST's AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) talks about Govern, Map, Measure, and Manage. For autonomous companies, those become runtime primitives.

**Integration.** The protocol layer is improving. Anthropic's [Model Context Protocol](https://www.anthropic.com/news/model-context-protocol) gives agents a standard way to connect to tools and data. Google's [Agent2Agent protocol](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/) goes sideways: agents discovering each other's capabilities, delegating tasks, exchanging context, and collaborating across frameworks or vendors. MCP is agent-to-tool. A2A is agent-to-agent. Both are directly relevant to this routing view of the company.

But connection is not control. A2A can help agents talk to each other; it does not decide whether they should. The real question is not "can this agent call that tool or delegate to that agent?" It is "under which identity, budget, permission, evaluation, and audit context is that action allowed?"

## The Funny Part

The funny part is that after all this, it still looks like a company.

You can replace humans with agents and somehow end up reinventing roles, permissions, budgets, review, compliance, escalation, and performance tracking.

Maybe that is disappointing. I find it useful. It means the future autonomous AI company is not a swarm of agents doing vibes in the cloud. It is more like:

company = labor + routing + memory + permission + budget + evaluation + accountability.

The agent is the worker. The routing layer is the company.

## Sources

- [McKinsey, The State of AI in 2025](https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai)
- [Gartner, 40% of enterprise apps will feature task-specific AI agents by 2026](https://www.gartner.com/en/newsroom/press-releases/2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025)
- [Deloitte, Autonomous generative AI agents](https://www2.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/autonomous-generative-ai-agents-still-under-development.html)
- [Deloitte, State of AI in the Enterprise 2026](https://www.deloitte.com/us/en/what-we-do/capabilities/applied-artificial-intelligence/content/state-of-generative-ai-in-enterprise.html)
- [IBM, Cost of a Data Breach Report 2025](https://newsroom.ibm.com/2025-07-30-ibm-report-13-of-organizations-reported-breaches-of-ai-models-or-applications%2C-97-of-which-reported-lacking-proper-ai-access-controls)
- [Stack Overflow, 2025 Developer Survey: AI](https://survey.stackoverflow.co/2025/ai)
- [Anthropic, Introducing the Model Context Protocol](https://www.anthropic.com/news/model-context-protocol)
- [Google Developers Blog, Announcing the Agent2Agent Protocol](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/)
- [Agent2Agent Protocol Specification](https://google-a2a.github.io/A2A/specification/)
- [NIST, AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework)
