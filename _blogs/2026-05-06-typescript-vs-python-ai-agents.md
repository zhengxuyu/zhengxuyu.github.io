---
layout: blog-post
title: "Why TypeScript Keeps Showing Up in AI Agent Apps"
date: 2026-05-06 00:00:00 +0000
categories: Blog
tags: [TypeScript, Python, AI Agents, LLM, Open Source]
draft: false
description: "Python still carries the model layer. But in the application layer around AI agents, TypeScript keeps appearing for practical reasons: typed schemas, browser-native interaction, and deployment."
tldr: "Python remains central to training, fine-tuning, data science, evals, and research prototypes. In the application layer around agents, TypeScript keeps appearing because agent products inherit many constraints from web apps: schema validation, streaming UI, tool calls, user state, auth, and deployment. This is not a replacement story. It is a split between model work and product work."
---

**TL;DR:** Python remains central to training, fine-tuning, data science, evals, and research prototypes. In the application layer around agents, TypeScript keeps appearing because agent products inherit many constraints from web apps: schema validation, streaming UI, tool calls, user state, auth, and deployment. This is not a replacement story. It is a split between model work and product work.

---

I have spent most of my AI life inside Python.

That is not a casual preference. Python basically carried the last decade of AI. Around 2012, deep learning broke out of the academic corner after [AlexNet](https://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks), and the practical stack started to form around Python. Then came Theano, Caffe, Keras, TensorFlow, PyTorch. By the time [transformers arrived in 2017](https://arxiv.org/abs/1706.03762), Python was already the default place where serious AI work happened. Training scripts, notebooks, data loaders, eval pipelines, CUDA wrappers, research baselines, random one-off experiments at 2 a.m. All Python.

I was lucky to live through most of that wave as a builder, not just as a spectator. I used Python for classical ML, deep learning experiments, data processing, model evaluation, and LLM training. When [GPT-3](https://arxiv.org/abs/2005.14165) made prompt engineering feel like a new interface, I was still in Python. When [ChatGPT](https://openai.com/index/chatgpt/) kicked everyone into building copilots and agent demos, I was still in Python. [LangChain](https://github.com/langchain-ai/langchain) was Python. [CrewAI](https://github.com/crewAIInc/crewAI) was Python. [AutoGen](https://github.com/microsoft/autogen) was Python. If you were building anything serious with a language model in 2023, opening a `.py` file felt almost automatic.

Then agents arrived and changed the way we build.

A chatbot mostly answers. An agent is supposed to do things: call tools, read and write state, remember context, ask for approval, stream progress, recover from errors, and hand results back to a user or another system. Once you ask a model to act instead of just talk, the model itself is no longer the whole product.

You need a harness around it.

LangChain's [The Anatomy of an Agent Harness](https://www.langchain.com/blog/the-anatomy-of-an-agent-harness) puts the relationship bluntly: "Agent = Model + Harness." Their definition of harness is useful here:

> The code, configuration, and execution logic around the model.

This is where product constraints become hard to avoid: tool schemas, state transitions, streaming events, user approvals, auth boundaries, deployment targets.

When we started writing more agent-related code, TypeScript kept appearing in places where I expected Python.

TypeScript was not designed for AI. [Microsoft describes TypeScript](https://opensource.microsoft.com/blog/2018/03/05/typescript-overview) as a typed superset of JavaScript for application-scale JavaScript development, originally created to improve tooling around JavaScript. The pitch was boring and practical: keep the JavaScript runtime, add static types, improve tooling, catch more mistakes before production.

That same tradeoff shows up again in agent applications.

[Mastra](https://github.com/mastra-ai/mastra) was building an agent framework in TypeScript. [Vercel AI SDK](https://ai-sdk.dev/docs/introduction) was integrating streaming and tool calls into React applications. [CopilotKit](https://github.com/CopilotKit/CopilotKit) was working on the agent UI layer. The API design and examples were already shaped around schemas, edge runtimes, serverless deploys, and browser state.

As of May 6, 2026, [Mastra](https://github.com/mastra-ai/mastra) is at 23.6k stars. [CopilotKit](https://github.com/CopilotKit/CopilotKit) is at 30.7k stars. [Vercel AI SDK](https://github.com/vercel/ai) is widely used in frontend AI applications. [MCP servers](https://github.com/modelcontextprotocol/servers) is at 85.1k stars. [Stagehand](https://github.com/browserbase/stagehand) is at 22.5k stars.

None of these projects are trying to train the next frontier model. They are working on the part that comes after the demo: making an agent usable, observable, interactive, and shippable.

TypeScript happens to inherit a lot of the machinery for that job from modern web development.

## Where TypeScript Fits

The useful question is concrete: what does the agent have to do all day?

The first LLM apps were closer to scripts: send a prompt, get text back, parse it, maybe call an API. Python fit that shape well.

Modern agents have to stream tokens, call tools, render tool results, keep state across sessions, and live inside Next.js apps, Vercel deployments, Cloudflare Workers, browser extensions, Electron apps, and internal dashboards people keep open all day.

At that point, the center of gravity moves away from the notebook and toward the browser.

## 1. Typed Boundaries for LLM Output

Many agent bugs are not reasoning failures. They are boundary failures: the model returns a shape the surrounding code did not expect.

You ask the LLM for a tool call:

```python
result = json.loads(llm_response)
name = result["name"]
args = result["args"]
```

Looks fine. Then one day the model returns `tool_name` instead of `name`, or gives you `"10"` where you expected a number, and your agent falls over in front of a user.

Python can handle this. [Pydantic](https://docs.pydantic.dev/latest/concepts/validators/) is good, and if all you need is runtime validation, Python is not missing the basic tool.

*The TypeScript point is narrower: in agent apps, the same shape often has to travel across the model call, the tool executor, the API route, and the UI component that renders the result. TypeScript makes that shape part of the surrounding application type system.*

Suppose the model is allowed to call a search tool, and it returns this:

```json
{
  "tool": "search",
  "input": {
    "query": "latest MCP server examples",
    "limit": 5
  }
}
```

With [Zod](https://zod.dev/), you can describe the expected shape once:

```typescript
const SearchCall = z.object({
  tool: z.literal("search"),
  input: z.object({
    query: z.string(),
    limit: z.number().int().positive().default(5),
  }),
});

type SearchCall = z.infer<typeof SearchCall>;

const parsed = SearchCall.safeParse(JSON.parse(llmResponse));
if (!parsed.success) {
  // The model returned the wrong shape. Ask it to retry, or fail safely.
  console.error(parsed.error.issues);
  return;
}

// From here on, TypeScript knows:
// parsed.data.tool is "search"
// parsed.data.input.query is a string
// parsed.data.input.limit is a positive integer
await search(parsed.data.input.query, parsed.data.input.limit);
```

Python can do the validation part with Pydantic. The difference is what happens after validation. In a TypeScript app, `SearchCall` can flow into the server action, the tool executor, and the React component without rewriting the contract in another language. The same schema rejects bad model output at runtime, gives the rest of the code a concrete type, and can be exposed back to the model as the tool's expected input shape.

[Mastra's tool system](https://mastra.ai/reference/agents/createTool) is built around this pattern:

```typescript
const searchTool = createTool({
  id: "web-search",
  description: "Search the web for information",
  inputSchema: z.object({
    query: z.string().describe("The search query"),
    limit: z.number().optional().default(5),
  }),
  outputSchema: z.object({
    results: z.array(z.object({
      title: z.string(),
      url: z.string().url(),
      snippet: z.string(),
    })),
  }),
  execute: async ({ context }) => {
    // context.query is a string, context.limit is a number
    // downstream code gets the same type information
  },
});
```

LLM output is an untrusted boundary.

It is not your database. It is not an internal function. It is not a service you control. It can drift a little on any call. Add enough tools and enough state, and "a little" becomes a real source of production bugs.

This is one reason typed schemas show up so often in TypeScript agent code. The value is not that Python cannot validate JSON. It is that the validated contract can keep moving through the rest of a TypeScript product without a second schema translation step.

## 2. Agents Often End Up in the Browser

The product shape matters here. Many agents are not data pipelines. They are interactive applications.

Users do not want to wait five minutes for a black box to finish and then receive a blob of JSON. They want to see tokens stream. They want to see which tool is being called. They want progress. They want to interrupt, approve, edit, retry, and inspect what the agent is doing.

The browser already has a whole stack for this kind of interaction.

Look at the shape of Vercel AI SDK:

```typescript
import { streamText } from "ai";
import { anthropic } from "@ai-sdk/anthropic";

const result = streamText({
  model: anthropic("claude-sonnet-4-20250514"),
  messages,
  tools: {
    getWeather: {
      description: "Get weather for a location",
      parameters: z.object({ city: z.string() }),
      execute: async ({ city }) => fetchWeather(city),
    },
  },
  onStepFinish: ({ toolResults }) => {
    // the UI can update after every tool step
  },
});
```

The pattern here is that the agent is not treated as a backend process that eventually hands text to the frontend. Streaming, tool calls, React state, server components, and user interaction sit in the same programming model.

The agent becomes part of the UI.

CopilotKit's [AG-UI protocol](https://www.copilotkit.ai/ag-ui) standardizes the event stream between agents and interfaces: text deltas, tool calls, state updates, component rendering. [AWS Bedrock AgentCore later added AG-UI support](https://aws.amazon.com/about-aws/whats-new/2026/03/amazon-bedrock-agentcore-runtime-ag-ui-protocol/) too. At minimum, this shows that agent-to-UI communication is becoming a separate layer of infrastructure.

Python can absolutely do this. Write the agent in Python, expose it through FastAPI, stream over WebSockets, then build a React frontend that consumes the events. Plenty of teams do exactly that.

The tradeoff is the translation layer.

The agent lives in Python. The UI lives in TypeScript. The tool output shape gets defined in one place, the API schema in another, and the frontend renderer has to learn it again. Every new tool output can mean touching three layers. State sync, error handling, streaming formats, retries, cancellation: all of it becomes glue code.

It works, but it adds surfaces that have to stay in sync.

## 3. Sharing a Runtime Can Remove Glue Code

In some products, the agent can run in the same runtime as the app it serves. That is not always necessary, but it can remove a lot of glue code.

Take MCP. MCP defines how agents discover and call external tools. With the [TypeScript MCP SDK](https://modelcontextprotocol.io/docs/sdk), you can write an MCP server inside a Next.js app:

```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";

const server = new McpServer({ name: "my-app-tools", version: "1.0.0" });

server.tool("query-database", {
  description: "Query the application database",
  inputSchema: z.object({ sql: z.string() }),
  handler: async ({ sql }) => {
    const result = await prisma.$queryRawUnsafe(sql);
    return { content: [{ type: "text", text: JSON.stringify(result) }] };
  },
});
```

The interesting part is not MCP itself. It is how close this code sits to the actual product.

It can use the same ORM. The same auth context. The same connection pool. The same config. No extra HTTP hop. No separate Python service. No second deployment just so an agent can call a tool that already exists inside the app.

In real production systems, every extra service adds deployment, monitoring, and debugging overhead.

[Stagehand](https://docs.browserbase.com/introduction/stagehand) has a similar shape. It wraps Playwright with AI primitives like `act()`, `extract()`, and `agent()`. Browser automation, extraction schemas, and application code can all sit in the same TypeScript system. Change a schema, and downstream consumers can fail at compile time instead of later in a run.

The more an agent depends on product state and UI behavior, the more this kind of proximity matters.

## Where Python Still Fits Better

I do not read this as a "TypeScript replaces Python" story.

Python still has several places where it fits the work better.

**Training and fine-tuning.** PyTorch, JAX, CUDA-heavy workflows, distributed training. If you are touching the model layer, you are probably writing Python.

**Data science and evals.** Pandas, NumPy, SciPy, statistics, offline evals, notebooks. TypeScript does not have an equivalent ecosystem here. If my agent evaluation work turns into real data analysis, I still reach for Python first.

**Research prototypes.** Academic repos, paper baselines, experimental agent architectures. Python is still the default language of that world.

**Complex orchestration.** LangGraph's Python ecosystem is still more mature for state machines, multi-agent workflows, conditional branches, human-in-the-loop checkpoints, and persistence. LangGraph.js exists, but the Python side has more battle-tested patterns.

So I would not frame this as replacement. I would frame it as a split between two kinds of work.

## The Split

I currently see the split like this:

Python remains the stronger fit for the model layer: training, fine-tuning, embeddings, offline evals, numeric work, research prototypes. If you need `torch.cuda` or `scipy.optimize`, use Python.

TypeScript is showing up in the app layer: agent orchestration, tool execution, streaming UI, user interaction, and production deployment.

For a while, many people treated agents as smarter scripts. That made Python the obvious choice.

But many agents are turning into interactive applications that call tools and models. Once you see them that way, the TypeScript story is less about syntax and more about the surrounding web stack.

Mastra, CopilotKit, Vercel AI SDK, MCP, and Stagehand are examples of projects focused on the productization problem. Not "how do we train a better model?" but "how do we put an agent inside something people use every day?"

My read: AI agents will not end up purely Python or purely TypeScript. The model layer stays Python-heavy. The user-facing app layer borrows more from TypeScript and the web stack.

If you are building a Python agent demo, fine.

If you are shipping an agent that streams, calls tools, renders UI, handles user state, and changes every week because customers keep finding new edge cases, the TypeScript ecosystem is one of the places worth understanding.

The interesting shift is narrower than "TypeScript versus Python."

It is about where agent work stops being model work and starts being product engineering.
