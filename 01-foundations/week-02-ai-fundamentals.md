# Block 2 — AI Fundamentals for Business

**Status:** Block 2 closed on 17 September 2026 after the explicit transition request. The evidence below is learning and draft portfolio evidence, not a production deployment.

## Block goal

Strengthen business-oriented AI fundamentals: frame the business problem before selecting technology, compare non-AI and AI approaches, assess data readiness, make value hypotheses falsifiable and connect claims to inspectable evidence.

## Supervised versus unsupervised learning

- **Supervised learning** learns from examples with a known label or target. A churn model, for example, may learn from historical customer records in which `churned` is known.
- **Unsupervised learning** looks for structure without a predefined target, such as customer segments or unusual patterns.
- The choice starts with the business question. “Which customers are likely to leave?” and “Which groups behave similarly?” are different problems and require different evidence.

Neither approach is automatically appropriate merely because historical data exists. Label quality, representativeness, missingness, class balance, segment coverage and intended use still need to be assessed.

## Business problem versus AI solution

The working sequence is:

1. define the business problem and stakeholder;
2. establish the current baseline;
3. identify the simplest adequate non-AI solution;
4. state the specific extra value expected from AI;
5. inspect data, risk, operational constraints and human responsibilities;
6. define the evidence that would support or reject the choice.

A complex business problem is not automatically an AI problem. Deterministic rules, workflow redesign, classical software or optimisation may be more reliable and proportionate.

## Value hypothesis and solution chain

A **value hypothesis** asks whether a proposed change is a plausible, measurable and falsifiable value promise.

A **solution chain** tests how that value could actually arise:

Business outcome → process change → system or AI output → required data → human role → metric → risk/control.

The hypothesis can sound attractive while the chain exposes a missing dependency, weak control or unsupported causal step.

## Data literacy evidence

I created and tested five explicit data-quality cases for a fictitious customer-churn dataset: a missing value, invalid label, out-of-range value, duplicate identifier and inconsistent category. All five controls detected the intended error.

I then completed **Data readiness review v0.1**. The review identifies `churned` as the label, treats `tenure_months`, `plan`, `monthly_spend` and `support_tickets_90d` as candidate features, and excludes `customer_id` as a predictor. It records privacy considerations, a critical label-quality rule and the limitations that prevent the sample from being model-ready.

Evidence:

- [Data quality cases and Data readiness review v0.1](../02-data-sql-api/data-quality-cases.md)
- [Fictitious churn sample — CSV](../02-data-sql-api/week-02-data-literacy/customer_churn_sample.csv)
- [Fictitious churn sample — JSON](../02-data-sql-api/week-02-data-literacy/customer_churn_sample.json)

## When AI is not a good solution

The reviewed draft uses seven go/no-go criteria and distinguishes four possible outcomes:

- no AI needed;
- AI not yet responsible;
- insufficient evidence;
- candidate for a controlled pilot, not an automatic production GO.

Portfolio artefact:

- [When AI Is Not a Good Solution — reviewed draft v0.2](./when-ai-is-not-a-good-solution.md)

## NIST MANAGE 1.1 and 2.1 decision check

The [NIST AI RMF Playbook — MANAGE 1.1 and 2.1](https://airc.nist.gov/airmf-resources/playbook/manage/) sharpen the decision, rather than requiring another summary. **MANAGE 1.1** asks whether a proposed system meets its stated purpose and whether development or deployment should proceed, weighing benefits against negative risks and using evaluation evidence. **MANAGE 2.1** adds viable non-AI, manual or partly automated alternatives and the people and resources needed to manage risk.

For each candidate use case, record the intended business outcome, the simplest adequate comparator, measurable benefit and failure criteria, likely negative impacts, the owner of review and fallback, and the cost of ongoing oversight. If these are unknown, the decision is **insufficient evidence**. If a simpler approach meets the objective with less risk or burden, choose it. Passing a paper checklist supports only a controlled pilot, never an unmeasured production GO.

## Failure cases and controls

The fictitious churn data-quality exercise demonstrates detection of five seeded errors; it does not test a trained model. In a real churn pilot, an invalid or late `churned` label could teach the wrong target; a field learned only after the prediction point would leak future information; missing values and inconsistent categories could distort segment results. The current controls are explicit data checks and a readiness review. Before deployment, a separate time-aware evaluation, segment and error analysis, business baseline, owner-approved thresholds, human review of retention actions and fallback would be needed.

## Evidence and claim status

Completed exercise evidence is linked above. The one-pager is a reviewed consulting draft, not proof that a production system has been built or validated. No claims about model accuracy, business impact or deployment are made without measurements.

The Block 2 assessment was completed and scored 6.5/10. No red error was recorded on the four named core topics. The original 8/10 threshold was recalibrated as an ambitious learning target in the completed block review. Targeted weak spots are carried into applied Block 3 work. Formal closure does not claim independent mastery.

## Remaining weak spots

- Revisit solution choice when historical examples have reliable labels: the assessment's mail-routing case called for supervised multiclass classification before considering LLM + RAG.
- Distinguish business, operational and system/model performance measures from controls or guardrails.
- Specify model-behaviour and failure-case evidence before asserting LLM reliability. These are targets for later applied practice, not claims of completed remediation.

## Lessons learned

- Start from the business problem and the simplest adequate benchmark.
- Separate business KPIs, operational KPIs and system/model quality metrics.
- A claim becomes useful only when the evidence that could support or disprove it is explicit.
- Data availability is not the same as data readiness.
- Human review is not a complete control unless its owner, decision right, evidence and fallback are clear.
- Worked examples help, but the underlying core knowledge is necessary to solve new cases independently.

## Sources

- [Google — Machine Learning Problem Framing](https://developers.google.com/machine-learning/problem-framing/problem)
- [NIST AI RMF Playbook — Manage](https://airc.nist.gov/airmf-resources/playbook/manage/)

[Back to Foundations](./README.md)
