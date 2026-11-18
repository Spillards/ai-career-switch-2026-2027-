# P04 — HTTP API collection v0.1

Use a small, repeatable API test collection to distinguish transport success from correct content. This learning project covers request construction, query filters, JSON types, automated assertions, negative tests and diagnosis with JSONPlaceholder.

**Status:** Block 5 technical learning gate passed, **9/10**, on 18 November 2026 using existing exercises and saved files. This is a curated learning portfolio release. Formal block review and the next block are separate decisions.

## Problem and approach

A client can receive HTTP 200 while retrieving the wrong posts. A create response can also appear successful without persistent storage. Checking status alone misses both issues.

The baseline is manually sending a request and reading its response. The collection adds explicit expectations and automated checks where already developed during the exercises. Postman is sufficient for inspecting this small public API; a custom application would add unnecessary work at this stage.

## Files

- [Portable collection](./p04.postman_collection.json) — ten requests in Postman Collection v2.1 format.
- [Evidence and gate assessment](./evidence.md) — earlier observations, scoring and limitations.
- [Verification record](./verification-2026-11-18.json) — eleven fresh HTTP executions by ChatGPT, including recovery after intentional failures.
- [Synthetic example post](./example-post.synthetic.json) — constructed from the submitted exercise payload and expected create response; not a raw response export.
- [Provenance manifest](./provenance.json) — source mapping, checksums and publication changes.
- [Original native YAML snapshot](./source-snapshot/native/) — 26 unmodified text files from the learner's local collection, including intentional mistakes.

## Reproduce

1. Download `p04.postman_collection.json` and use Postman's **Import** action to select that JSON file. The native source snapshot and a Pages document are different formats; do not treat the whole project package as a collection JSON export.
2. Open the imported collection and verify its collection variable: `base_url = https://jsonplaceholder.typicode.com`. Select **No Environment**, or ensure an active environment does not override that variable. No API key is required.
3. Run the six **Core** requests. Check the expectations below. The POST and the subsequent GET have manual checks; the other four Core requests contain the learner's saved automatic assertions.
4. Run the two requests under **Intentional failures** separately. One assertion in each is supposed to fail. Afterwards rerun **01 Detail post 5**; all three assertions should pass.
5. The **Transfer** folder contains two comments requests reconstructed from the learner's submitted notes. Check their status, array shape and relevant `postId` values manually.

| Request | Expected response | Check |
| --- | --- | --- |
| GET `/posts/5` | 200, object, `id: 5` | Three automatic checks pass |
| GET `/posts/?userId=1` | 200, nonempty array | Every item has numeric `userId: 1` |
| GET `/posts?userId=99999` | 200, `[]` | Status and empty-array checks pass |
| GET `/posts/225` | 404, `{}` | Expected-error status and empty-object checks pass |
| POST `/posts` | 201, submitted fields and an assigned ID | Compare `userId: 11`, title and body; current sample response uses ID 101 |
| GET `/posts/101` | 404, `{}` | JSONPlaceholder does not persist the simulated create |
| GET `/posts/5`, assertion expects 3 | 200, `id: 5` | Status/shape pass; ID assertion fails |
| GET `/posts/`, assertion expects only user 1 | 200, unfiltered array | Status passes; content assertion fails |
| GET `/comments?postId=1` | 200, nonempty array | Every comment belongs to post 1 |
| GET `/comments?postId=101` | 200, `[]` | Empty filtered result |

The observed counts of 10 filtered posts, 100 unfiltered posts and five comments belong to this sample dataset. A general API contract need not prescribe these counts. An empty posts list does not prove that a user is absent; an empty comments list does not prove that a post is absent.

## Publication changes and authorship

The learner built and exercised the original requests and scripts. ChatGPT consolidated the files and documentation at the learner's request; creating this rubric or commit is not additional learner evidence.

The stored native definition has an empty `base_url`, even though earlier working-session evidence records a resolved value. The portable collection explicitly supplies the documented public base URL. This is a packaging correction, not evidence that the original snapshot was independently portable.

The saved request named “Comment op post-ID 1” still targets `/posts/1`. The two transfer URLs in the portable collection were therefore reconstructed from the submitted D5 notes. Their fresh assistant verification is labelled separately. They are not presented as the learner's original exported requests.

Original assertion code is retained. Request names are shortened and public API URLs normalized to `{{base_url}}`. Workspace settings, environments, globals and Pages documents are excluded. The source manifest records the exact included files.

## Verification and limits

Fresh verification used Node HTTP requests and the saved JavaScript assertions with a small compatibility adapter for the assertion methods in use. Seventeen saved assertions ran across eleven requests: fifteen passed and the two deliberately wrong assertions failed as expected. Four additional assistant checks passed. The final detail-request recovery passed all three assertions.

This verifies the HTTP behaviour and the tested assertion logic. It is not a new Postman GUI run, a Newman execution, a GUI import test or full JSON Schema validation. The JSON, request bodies, variable, source checksums, assertion preservation and expected failure pattern were checked separately.

The API is a public exercise service. No authentication, production security, retries, rate-limit handling, persistent writes, performance or business-impact measurement is demonstrated. The work supports basic API literacy and debugging, not production API engineering.

## Python handoff

The learner selected `GET /posts/225`: send the GET, read the status, parse JSON and verify 404 with an empty object. This defines future scope only; no Python implementation or next block is started here.

## Sources

- [JSONPlaceholder: resources, filters and simulated writes](https://jsonplaceholder.typicode.com/)
- [Postman: importing data](https://learning.postman.com/docs/getting-started/importing-and-exporting/importing-data/)
- [Postman Collection v2.1 schema](https://schema.getpostman.com/json/collection/v2.1.0/collection.json)
