# Repository guidance

## Learning principles

- Start with the business problem before choosing tools.
- Prefer the simplest solution that satisfies requirements.
- Do not use an agent where deterministic automation or a workflow is sufficient.
- Do not complete learning exercises on behalf of the user unless explicitly requested; explain the next step and let the user execute it.
- Avoid blind copy-paste: the user must be able to explain code and artefacts.
- Add tools, dependencies, frameworks, or services only for a clear learning or project reason.

## Repository rules

- Never commit secrets, API keys, credentials, tokens, or personal or confidential data.
- Never place Notion links or Notion page references in GitHub files. GitHub artefacts must remain self-contained; links from Notion to GitHub are allowed.
- Do not create or maintain a glossary, terminology list, or glossary-building task in GitHub. Glossary management belongs exclusively in the existing Central Glossary in Notion.
- Use meaningful commit messages.
- Keep the README and setup, usage, and test instructions current.
- Preserve the agreed repository structure unless a refactor is justified and documented.

## Portfolio quality

- Every serious artefact must document the problem, requirements, design, implementation, tests/evaluation, failure cases, limitations, lessons learned, and reproducibility.
- Support quality claims with evidence and evaluations.
- Make portfolio artefacts understandable and assessable by an outsider.
- Prefer reproducible evidence over certificates or screenshots without context.

## Solution design

- Establish business needs, value, and constraints before selecting technology.
- Prefer deterministic automation for fixed, predictable workflows; use agents only when dynamic reasoning or tool selection is required.
- Include human-in-the-loop review, exception handling, and guardrails where risk warrants them.
- Treat feedback as evaluation data; do not assume user corrections automatically retrain a model.

## Learning/project behavior

- If a previous competency gate is materially insufficient, remediate the gap before adding complexity.
- Keep technical complexity aligned with AI Business Analyst, Junior AI Consultant, and GenAI Consultant roles, with growth toward AI Business Architect.
