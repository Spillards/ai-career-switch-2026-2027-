# When AI Is Not a Good Solution

**Status:** Reviewed draft v0.2  
**Scope:** Block 2 consulting artefact  
**Evidence boundary:** This is a decision framework. It does not claim that an AI system has been built, deployed or validated.

## Purpose

This one-pager helps a business analyst or consultant recognise situations in which AI is not the right solution, is not yet responsible to use, or is insufficiently supported by evidence.

> Start with the business problem, the simplest adequate solution and the evidence that AI would create additional value.

## Decision path

Work through the questions in order.

1. **Are the business goal, baseline or expected value unclear or not measurable?**  
   First improve problem framing and the baseline. **Decision: insufficient evidence.**

2. **Can a deterministic rule, workflow, process improvement or classical software solve the problem adequately?**  
   Prefer the simpler approach. **Decision: no AI needed.**

3. **Is required data or context missing, unreliable, outdated, unrepresentative or inaccessible?**  
   Improve data and context before proceeding. **Decision: AI not yet responsible.**

4. **Are the consequences of errors greater than the available human and technical controls can reasonably contain?**  
   Do not deploy while residual risk remains unacceptable. **Decision: AI not yet responsible.**

5. **Are privacy, security, compliance or governance requirements infeasible or disproportionate to the expected value?**  
   Redesign the approach or choose a simpler alternative. **Decision: AI is not responsible in this form.**

6. **Do cost, latency, maintenance, monitoring and technical complexity outweigh the expected business value?**  
   Prefer the simpler or cheaper approach. **Decision: no AI needed.**

7. **Is the core problem actually process, ownership, source information or change management?**  
   Address the underlying business problem first. **Decision: AI would treat the symptom rather than the cause.**

Passing every question does not produce an automatic GO. It only makes AI a candidate for comparison and controlled testing.

## Business examples

### 1. Invoice routing with stable rules

When reliable fields such as supplier, cost centre, purchase-order number and invoice type determine routing, start with document extraction where needed, fixed routing rules and human handling of exceptions.

ML or an LLM becomes relevant only if free text, exceptions or semantic ambiguity create a measured failure that the rule-based benchmark cannot handle proportionately.

### 2. Workforce scheduling under hard constraints

When employees must be assigned to visits according to availability, skills, time windows, rest periods and maximum working hours, the core question is: “Which valid combination is best under these rules?”

That points first to constraint optimisation, not automatically to ML. ML may later predict an uncertain input such as travel time or absence risk.

## Value checkpoint

- What concrete business problem are we solving, and for whom?
- What is the current baseline and expected measurable improvement?
- Is AI demonstrably better than the simplest adequate benchmark?
- Do benefits justify build, usage, maintenance and monitoring costs?

## Data checkpoint

- What data or context is required, and is its meaning clear?
- Is it sufficiently complete, correct, current, representative and accessible?
- Are trustworthy labels available if supervised ML is considered?
- Are source, owner, permissions and retention requirements known?
- Can the solution be tested on representative examples and failure cases?

## Risk checkpoint

- What is the main failure mode and business impact?
- Which errors are unacceptable?
- Where is human review necessary?
- What preventive, detective and corrective controls exist?
- Is there an enforceable approval step, inspectable evidence and a fallback?
- Are decisions, overrides and errors traceable?
- Is residual risk proportionate to expected value?

## Evidence required before a GO

- current baseline and a non-AI benchmark;
- representative normal, edge and failure cases;
- distinct business, operational and system/model quality metrics;
- test, evaluation, verification and validation outputs where relevant;
- cost, latency, maintenance and monitoring comparison;
- named owners for decisions, controls and change activities;
- documented fallback and pass/fail rule.

## Decision outputs

- **No AI needed** — a simpler approach is adequate.
- **AI not yet responsible** — prerequisites or controls are insufficient.
- **Insufficient evidence** — measure, test or investigate first.
- **Candidate for a controlled pilot** — compare against the baseline under explicit acceptance criteria; this is not a production GO.

## Information to gather before tool selection

Business problem → stakeholder and intended action → current baseline → simplest adequate solution → AI-specific value → data/context → constraints and dependencies → error impact → human role and controls → value and cost → evaluation evidence → decision.

## Limitations

This is an educational consulting artefact based on general decision principles. It has not been validated through a production pilot and contains no measured model or business-performance claims.

## Sources

- [Google — Machine Learning Problem Framing](https://developers.google.com/machine-learning/problem-framing/problem)
- [NIST AI RMF Playbook — Manage](https://airc.nist.gov/airmf-resources/playbook/manage/)

[Back to Block 2 evidence](./week-02-ai-fundamentals.md)
