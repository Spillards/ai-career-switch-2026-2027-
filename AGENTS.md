# Repository guidance

## Learning principles

- Start with the business problem before choosing tools.
- Prefer the simplest solution that satisfies requirements.
- Do not use an agent where deterministic automation or a workflow is sufficient.
- Do not complete learning exercises on behalf of the user unless explicitly requested; explain the next step and let the user execute it.
- Avoid blind copy-paste: the user must be able to explain code and artefacts.
- Add tools, dependencies, frameworks or services only for a clear learning or project reason.

## AI block control

- AI Consultant work uses content blocks of five actually completed study days, not calendar weeks.
- Only the user's exact instruction `Sluit blok X af. Start blok Y op`, with valid consecutive block numbers, closes one block and authorises the next.
- A calendar date, completed task, review, automation run or Life Coach transition never authorises an AI block transition.
- Do not prepare or modify future-block tasks, deliverables, galleries, exports or snapshots before that instruction.
- Mark future material as `Planned`; never present planned scope as completed evidence.

## Repository rules

- Never commit secrets, API keys, credentials, tokens, or personal or confidential data.
- Never place Notion links or Notion page references in GitHub files. GitHub artefacts must remain self-contained; links from Notion to GitHub are allowed.
- Do not create or maintain a glossary, terminology list, or glossary-building task in GitHub. Glossary management belongs exclusively in the existing Central Glossary in Notion.
- Use meaningful commit messages.
- Keep README, setup, usage and test instructions current.
- Preserve the agreed repository structure unless a refactor is justified and documented.
- Use repository-relative links for internal evidence and verify them before committing.

## Definition of Done and evidence

A portfolio artefact is done only when:

- its problem, intended user and scope are explicit;
- claims are separated from hypotheses and planned work;
- requirements or decision criteria are traceable to evidence;
- tests or evaluations include normal cases, edge cases and material failure cases where relevant;
- limitations, assumptions and unresolved risks are visible;
- reproduction or review instructions are sufficient for an outsider;
- linked files exist and contain no secrets or confidential data.

A draft may be useful evidence, but it must remain labelled as a draft until its stated review or assessment is complete.

## Portfolio quality

- Every serious artefact must document the problem, requirements, design, implementation, tests/evaluation, failure cases, limitations, lessons learned and reproducibility where those elements are applicable.
- Support quality claims with evidence and evaluations.
- Make portfolio artefacts understandable and assessable by an outsider.
- Prefer reproducible evidence over certificates or screenshots without context.
- Keep each artefact close to its source files and avoid duplicate copies that can drift.

## Solution design

- Establish business needs, value and constraints before selecting technology.
- Prefer deterministic automation for fixed, predictable workflows; use agents only when dynamic reasoning or tool selection is required.
- Include human-in-the-loop review, exception handling and guardrails where risk warrants them.
- Treat feedback as evaluation data; do not assume user corrections automatically retrain a model.
- Separate business KPIs, operational KPIs and system/model quality metrics.
- A control is stronger when it has an explicit enforcement or approval step and inspectable evidence.

## Technical-depth boundary

- Technical work must support the target roles: AI Business Analyst, Junior AI Consultant and GenAI Consultant, with gradual development toward AI Business Architect.
- Build enough depth to reason about feasibility, data, interfaces, evaluations, risks and delivery.
- Avoid engineering complexity that does not improve the learning objective, evidence quality or portfolio value.
- The user must be able to explain every committed technical choice.

## Capacity and learning design

From Block 3 onward, estimate cognitive load before publishing a task:

- include reading, explanation, example analysis, independent application, quality control, feedback and revision;
- add approximately 15% buffer;
- for a new heavy framework in 90 minutes, plan at most two or three complete Core cases or rows;
- split work before publication when the Core output does not fit;
- Stretch is optional and never required for the block goal;
- compare the first estimate with actual time and adjust later tasks.

## Sources and freshness

- Prefer primary and authoritative sources for technical, legal and governance claims.
- Record the source close to the claim or artefact it supports.
- Verify time-sensitive standards, product behaviour and regulations before relying on them.
- State when a conclusion is an inference rather than a source-backed fact.

## Market feedback

- Use credible role descriptions, recruiter feedback and portfolio reviews to test whether the roadmap matches the target roles.
- Treat this feedback as input for future planning, not as permission to skip the active block or change completed evidence retroactively.
