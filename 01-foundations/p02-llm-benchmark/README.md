# P02 — LLM Benchmark v0.1

**Task:** Triage internal change requests.  
**Evidence status:** Published protocol, ten synthetic test cases, a scored demonstration and a four-response live pilot. Full controlled comparisons are pending.

## Business problem

Functional analysts at a fictional SaaS company receive free-text requests from Sales, Customer Service, Finance and Operations. Some requests are ready for analysis, some lack key information, and others describe an incident or combine conflicting needs. The proposed assistant gives analysts a first-pass triage recommendation and identifies what to clarify. The analyst retains responsibility for the next action, priority and approval.

The business hypothesis is faster intake with fewer clarification cycles. The benchmark measures task correctness, output conformance and grounding in the request. Intake time and downstream business outcomes would require a separate study.

## Benchmark design

| Phase | Question | Setup | Status |
| --- | --- | --- | --- |
| A — Prompt comparison | What changes when the minimal baseline is replaced with the structured prompt? | TC01–TC10 × v0/v1, one fixed model and configuration, 20 runs. | TC01 pilot and TC03 v1 spot check published. Full set pending. |
| B — Model comparison | How do two model variants handle the same prompt on the Core cases? | TC01–TC05 × two models, fixed v1, 10 runs. | TC01 cross-interface pilot published. Full set pending. |
| D4 — Scoring demonstration | What does the rubric reveal about different kinds of errors? | TC01–TC05, ten constructed responses and one documented demonstration prompt. | Scored example set |

The benchmark evaluates the combined v1 change: business rules, source constraints and a seven-field output contract. A controlled difference between v0 and v1 would measure that package. An experiment that isolates one instruction would require a separate comparison.

- [Prompts, business rules and output contract](./prompts.md)
- [Ten copyable synthetic inputs and expected behaviour](./test-cases.md)
- [Live pilot results and limitations](./pilot-results.md) · [captured inputs and responses](./pilot-runs.json)
- [Scored demonstration and failure cases](./demonstration.md)
- [Run log template](./run-log-template.csv)

## Scoring rubric

Score each response against the frozen case expectation. Record all three dimensions and the reason for any deduction.

| Dimension | 0 | 1 | 2 |
| --- | --- | --- | --- |
| **T — Task correctness** | Wrong category or contradiction of the expected behaviour. | Right category with a material detail wrong or missing. | Right category and all material case details correct. |
| **O — Output and constraints** | Major contract violation, such as an invalid category value or missing structure. | Recognisable structure with a missing or incorrect field or marker. | One allowed category value and all seven fields with applicable markers. |
| **E — Evidence and claims** | Unsupported fact, requirement, cause, impact or priority. | Limited inference with incomplete direct support. | Source-grounded claims with uncertainty or missing information identified when applicable. |

A wrong category drawn from the allowed list is a T error. Assess the field structure and marker use separately for O. Score v0 against the same rubric even though only v1 receives the output contract. This makes the effect of adding the contract visible. Each case is worth up to 6 points. Each prompt in phase A has a maximum of 60 points and each model in phase B has a maximum of 30 points. Treat these as equal-weight diagnostic scores.

Use failure labels to describe concrete issues: **F-T** task, **F-C** format or constraints, **F-E** unsupported claim, **F-U** unresolved uncertainty presented as certain, **F-R** irrelevant material carried into the output. A response can have several labels. Record severity and the suspected cause separately. If reviewers disagree, record the discrepancy and rationale for the final score.

## Reproduce

1. Pin the commit containing this README. Use its prompts, test inputs, expectations and rubric throughout the comparison. Store its SHA in the run log.
2. For phase A, choose one available model variant and keep the interface, visible generation settings and tool access identical across v0 and v1. For phase B, use v1 on both variants and TC01–TC05 only. Keep tools, browsing and grounding disabled where the interface permits. Document differences and any unavailable settings.
3. Start a fresh session for each case and prompt/model pair. Assemble the message using [the prompt instructions](./prompts.md#assemble-a-run). Paste the exact synthetic request and leave the expected result out of the model input. Use no stakeholder metadata for the published set.
4. Save the exact sent message and raw response. Record run ID, phase, prompt version, model variant as displayed, date/time with offset, interface, settings and tooling. Record errors and retries as separate attempts. Use the [CSV template](./run-log-template.csv) and point the path columns to the saved UTF-8 text files.
5. Compare the saved response with the expected category and case-specific checks. Score T/O/E separately and record failure codes and severity. If practical, hide prompt/model labels during scoring. Total scores and report differences per dimension and per case, including regressions.
6. Report model, setup and sample scope with any conclusion. To review the published demonstration today, score the selected outputs in [the demonstration](./demonstration.md) against their stated inputs and compare your scoring with the recorded breakdown.

## Findings and limitations

In the live pilot, ChatGPT Medium scored **1/6 with v0** and **6/6 with v1** on TC01. Gemini 3.1 Pro also scored **6/6** on TC01 with the identical v1 input. A separate ChatGPT v1 spot check correctly classified TC03 as an existing incident (**6/6**). This small pilot uses visible web configurations. The full comparisons and underlying model revisions are unverified.

The constructed D4 responses scored **20/30 (SIM-A)** and **29/30 (SIM-B)**. The largest difference is grounding, **3/10 versus 10/10**. SIM-B has a marker error despite the higher total. The main failure to investigate in controlled runs is TC05: the response invents SharePoint and treats an incomplete request as ready for analysis.

An earlier exploratory v0/v1 comparison changed the model variant at the same time and used earlier expectations that were later corrected. Causal conclusions about v1 remain open. The D4 responses illustrate scoring and failure analysis. External model performance, reliability in production, security, compliance, latency, costs and time savings remain unmeasured.

If controlled runs reproduce TC05, test one change: add a completeness check before selecting ANALYSE-KLAAR. Check TC01 and TC03 for regressions, then re-run the fixed set before deciding whether to adopt the change.
