# Block 5 — evidence review, 18 November 2026

The assessment reuses existing work instead of asking for duplicate method descriptions, a new learner-written rubric or another full request log.

## Gate decision

**Passed: 9/10, with no unresolved fundamental error demonstrated in the latest evidence.** The threshold was 8/10 without a core error. This decision concerns the HTTP/JSON/Postman gate; it does not formally close the study block or authorize the next one.

| Criterion | Score | Existing evidence and judgement |
| --- | ---: | --- |
| Request construction | 2/2 | Detail GET, filtered GET, empty list, missing resource and synthetic POST. The earlier D4 collection check records correct status and content for all five categories. Saved files support the request definitions. |
| JSON and parameters | 2/2 | Own request log, API contract, list/detail comparison and D5 comments transfer. Later work correctly distinguishes 200 with `[]` from 404 with `{}`. A string check on `name` is valid type checking, while filter verification requires the relevant ID on every returned item. |
| Fault diagnosis | 2/2 | D3 corrected missing-post request; D4 missing-filter comparison; intentionally wrong expectation on `/posts/5` followed by the normal three-check success. The earlier mistake of changing the URL instead of the assertion was corrected in the stored variants. |
| Automatic checks | 2/2 | Saved and previously executed status, JSON-object, ID, all-item filter and empty-result checks. Earlier records report 3/3, 2/2, 2/2 and 2/2 passes for the four automated Core requests. Fresh assistant verification corroborates the tested logic. |
| Reproducibility | 1/2 | Native files, reload, example output and reproduction steps exist. The saved snapshot has an empty base URL, the comments request name does not match its URL, and the portable JSON has not been imported through the GUI. ChatGPT addresses packaging explicitly; full independent learner-authored portability is not claimed. |
| **Total** | **9/10** | **Learning gate passed; retain the packaging limitations.** |

## Core-error checks

- **Success inferred only from HTTP status:** not present in the latest evidence. The missing-filter experiment shows that 200 can coexist with failed content expectations.
- **Simulated storage treated as persistent:** not present in the latest conclusion. The synthetic create is followed by a GET on ID 101 returning 404; the service documents non-persistence.
- **Diagnosis without a confirming rerun:** not present for the selected final example. The saved intentional ID expectation and the normal variant have a documented fail/recovery sequence.

Earlier wrong answers remain part of the private learning history. They are not silently rewritten as first-attempt successes. The conclusion is based on the later corrected work and the selected final examples.

## Evidence provenance

| Evidence layer | What it establishes | Limit |
| --- | --- | --- |
| Learner's D2–D5 notes | Predictions, observations, explanations and transfer attempt | Submitted notes are not machine-generated HTTP logs |
| Earlier D4 collection review | Assistant-recorded direct Postman execution of the five request categories and deliberate failure/recovery | Reused review record, not a new observation in this publication session |
| Native YAML snapshot | Concrete saved request and assertion definitions | Files prove configuration; they do not prove previous execution |
| Fresh verification JSON | Current HTTP status, response summaries and execution of the selected assertion code | Assistant's Node adapter, not Postman/Newman or learner-independent execution |
| Portable collection and README | Curated replay instructions and public example | Packaging prepared by ChatGPT; no GUI import claimed |

## What was consolidated

The portable collection supplies the known public base URL, normalizes URLs, separates intentional failures from normal requests and reconstructs the documented comments transfer. Original YAML files and their SHA-256 hashes remain available for comparison. The example JSON is a constructed synthetic illustration, labelled as such.

There is no need for another learner-written rubric, complete method catalogue, repeated full collection run or practice commit for this gate. Further work should add a new capability or address a demonstrated gap.
