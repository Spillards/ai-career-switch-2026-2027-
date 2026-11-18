# Block 5 — HTTP, REST, JSON and Postman

**Status:** Completed learning block. The HTTP/JSON/Postman gate passed at **9/10** against a threshold of 8/10 without an unresolved core error. This is learning evidence, not a claim of production readiness.

## Completed learning route

This compact snapshot records the technical scope of the five study sessions. Completed exercises were reused where they already demonstrated the required skill.

| Session | Activity | Required output |
| --- | --- | --- |
| D1 | First HTTP request | Labelled request and observed response |
| D1 | URL to resource | Detail request and explanation of the endpoint |
| D1 | JSON shapes and types | Object/array and field-type observations |
| D1 | First collection | Saved requests, folders and base URL variable |
| D2 | Filter a list | Query parameter and a content check on the returned items |
| D2 | Send a POST body | Synthetic JSON body, observed create response and non-persistence caveat |
| D2 | Small API contract | Request inputs, expected response and relevant error behaviour |
| D2 | Bundle normal and boundary requests | Reused saved working requests; no duplicate collection |
| D3 | Diagnose a 404 | Cause, minimal correction and confirming execution |
| D3 | Authentication, access and limits | Recognition of API keys/tokens, access errors and rate limits |
| D3 | Detect incorrect content with HTTP 200 | Filtered/unfiltered comparison and a relevant content criterion |
| D4 | Automatic Postman checks | Status, object shape and expected ID assertions |
| D4 | Compare two fault detectors | Evidence that a status check can pass while a content check fails |
| D4 | Empty results and missing resources | Distinguish 200 with an empty array from 404 with an empty object |
| D4 | Collection verification | Existing five-request review plus controlled failure/recovery evidence |
| D5 | Transfer to comments | New resource/filter and boundary observation |
| D5 | Make the API work portable | Collection package and concise reproduction instructions |
| D5 | Evidence gate | Existing outputs assessed with the predefined rubric |

## Evidence and assessment

The [P04 collection package](../02-data-sql-api/p04-api-collection/) contains the portable collection, unchanged source snapshot, provenance, synthetic example, verification record and detailed assessment.

| Competency | Score |
| --- | ---: |
| Request construction | 2/2 |
| JSON and parameters | 2/2 |
| Fault diagnosis | 2/2 |
| Automatic checks | 2/2 |
| Reproducibility | 1/2 |

The selected evidence distinguishes HTTP success from correct content, recognises simulated POST storage, and includes an intentional failure followed by a confirming normal run.

## Limits retained

- Source files prove saved configuration; submitted observations and execution records are separate evidence layers.
- The portable package was assembled with assistant support. Independent learner-authored portability is not claimed.
- Fresh verification used Node with an assertion adapter, not the Postman/Newman runtime.
- The portable JSON was not imported through the GUI during that verification.
- Two comments requests were reconstructed from submitted notes and are labelled accordingly.
- This does not complete the broader P04 Python client or the full foundations phase.

## Next technical scope

The next extension is a small Python client: read and validate synthetic JSON, call the public test API, distinguish transport/HTTP/parsing/contract failures, and reproduce a valid run and an error check from a fresh environment. It should address the remaining portability weakness without repeating the full Postman catalogue.

[Repository overview](../README.md)
