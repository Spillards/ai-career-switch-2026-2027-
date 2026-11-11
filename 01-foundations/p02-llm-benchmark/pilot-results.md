# Live pilot — 11 November 2026

Four completed responses on two synthetic cases were captured from the model interfaces. The [run records](./pilot-runs.json) include the submitted text, captured response text, interface, available timing and scoring rationale.

## Results

| Run | Case | Prompt | Visible configuration | T/O/E | Score |
| --- | --- | --- | --- | --- | ---: |
| PILOT-01 | TC01 | v0 | ChatGPT Medium | 0/0/1 | 1/6 |
| PILOT-02 | TC01 | v1 | ChatGPT Medium | 2/2/2 | 6/6 |
| PILOT-03 | TC01 | v1 | Gemini 3.1 Pro | 2/2/2 | 6/6 |
| PILOT-04 | TC03 | v1 | ChatGPT Medium | 2/2/2 | 6/6 |

**Prompt pilot, TC01.** Under the same visible ChatGPT Medium setting, v0 produced the category `FUNCTIONAL_ENHANCEMENT` outside the P02 taxonomy. It did capture the substantive request. v1 returned `ANALYSE-KLAAR`, all seven fields and both conditions: less spam and continued receipt of supplier emails. The v0/v1 difference on this one case is **1/6 → 6/6**.

**Cross-interface pilot, TC01.** With the identical v1 message, ChatGPT Medium and Gemini 3.1 Pro both scored **6/6**. The two web interfaces expose different configuration details. This is one matched observation.

**Incident spot check, TC03.** ChatGPT v1 identified the missing backup as an existing incident and avoided assigning a technical cause. The recorded response scored **6/6**.

## Execution and limits

- Each published response came from a fresh temporary web conversation. The operator supplied no files or additional prompts and selected no tools. The interfaces did not expose sampling, backend revision or automatic routing.
- Responses were captured as displayed text. Formatting such as Markdown bold and spacing can differ from the original UI. Missing exact submission times are marked in the run records.
- Gemini Flash submissions yielded no completed response available for capture. A separate local Foundation Models attempt returned ModelManagerError 1008 without a response. Those attempts have no T/O/E score.
- The full ten-case prompt comparison and five-case cross-model comparison remain incomplete. Each reported configuration has one captured response per reported case and prompt. No ranking, performance stability, or business impact follows from this pilot.
- For the full comparison, rerun from the same [frozen inputs](./test-cases.md) and [prompts](./prompts.md). Prefer a fixed, recorded backend variant where available and log completed responses and technical failures separately using the [run log template](./run-log-template.csv).
