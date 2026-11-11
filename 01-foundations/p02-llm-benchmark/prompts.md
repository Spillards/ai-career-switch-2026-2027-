# Prompt versions

The Dutch prompt text and the synthetic requests form the runnable benchmark inputs. Phase A uses v0 and v1. Phase B uses the same v1 for both model variants.

## v0 — minimal baseline

```text
Classificeer deze request in de juiste categorie.
```

## v1 — structured triage

Use the following prompt text, then append the business rules block immediately below it. The rules are the context referred to as BuCa in the prompt.

```text
Taak: Classificeer één change request in exact één van deze categorieën: ANALYSE-KLAAR, ONTBREKENDE INFORMATIE, INCIDENT I.P.V. CHANGE of MENSELIJKE REVIEW.

Context: Gebruik exact de vier gegeven businessregels uit de BuCa, inclusief de volledige definitie van MENSELIJKE REVIEW: tegenstrijdige/gemengde signalen, zowel incident als change, of geen betrouwbare categorie mogelijk.

Input: Eén change request in vrije tekst, eventueel aangevuld met naam, rol en afdeling van de stakeholder.

Constraints: Voeg geen requirement, impact, oorzaak, prioriteit of feit toe dat niet expliciet door de request of toegestane stakeholdermetadata wordt ondersteund.

Stakeholdermetadata mag alleen dienen om de request te kaderen.

Outputcontract:
Geef steeds dezelfde velden terug: Categorie, Betrokken systeem/proces, Gewenste wijziging, Businessreden, Verwacht resultaat, Ontbrekende informatie, Reden menselijke review / incidentbeschrijving.

Vul een niet-beschikbaar of niet-relevant veld in met “NIET VAN TOEPASSING” of “Informatie ontbreekt” volgens de case; verzin niets.

Voorbeelden/few-shot: nog niet toevoegen. Eerst v1 zonder voorbeelden benchmarken; pas few-shot testen als specifieke failure cases aantonen dat regels alleen onvoldoende zijn.
```

### BuCa business rules for v1

```text
Vaste besliscategorieën en businessregels:

ANALYSE-KLAAR: De aanvraag bevat expliciet (1) betrokken systeem of proces, (2) gewenste wijziging, (3) businessreden en (4) verwacht resultaat. De informatie mag niet onderling tegenstrijdig zijn.

ONTBREKENDE INFORMATIE: Het is duidelijk dat een wijziging gevraagd wordt, maar minstens één van de vier verplichte elementen voor analyse-klaar ontbreekt.

INCIDENT I.P.V. CHANGE: De tekst beschrijft vooral dat bestaande functionaliteit die voordien werkte nu faalt of degradeert, zonder duidelijke vraag om het bedoelde gedrag te wijzigen.

MENSELIJKE REVIEW: Gebruik dit wanneer de aanvraag tegenstrijdige of gemengde signalen bevat, zowel incident als change lijkt te zijn, of wanneer op basis van de beschikbare informatie geen betrouwbare categorie gekozen kan worden.
```

### Reviewer interpretation of the output contract

Expect all seven field labels. Use `Informatie ontbreekt` for required source information that is absent and `NIET VAN TOEPASSING` for fields irrelevant to the category. When an intake detail is missing, the `Ontbrekende informatie` field identifies the missing detail. For an incident, capture the failure in the final field. For human review, use that field to state what makes the decision ambiguous or contradictory. These are scoring instructions for the reviewer.

## Assemble a run

Create one message containing the selected prompt, followed by a blank line and this input wrapper. For v1, place its business rules before the wrapper. Keep the wrapper identical in both versions. Substitute only the exact request text from the corresponding [test case](./test-cases.md).

```text
--- BEGIN CHANGE REQUEST ---
{request}
--- END CHANGE REQUEST ---
```

Treat the request region as input data, including the quoted instruction in TC08. Keep the test ID, expected answer, rubric and any previous outputs outside the message. Use no additional prompt, few-shot examples or stakeholder metadata for this baseline comparison.

## D4 demonstration prompt

The following snapshot belongs to the [constructed demonstration](./demonstration.md).

```text
Classificeer één interne change request in exact één categorie: ANALYSE-KLAAR, ONTBREKENDE INFORMATIE, INCIDENT I.P.V. CHANGE of MENSELIJKE REVIEW.

ANALYSE-KLAAR vereist expliciet het systeem/proces, de wijziging, de businessreden en het verwachte resultaat, zonder tegenstrijdigheden. ONTBREKENDE INFORMATIE geldt wanneer een duidelijke wijziging één van die elementen mist. INCIDENT I.P.V. CHANGE geldt wanneer eerder werkende functionaliteit nu faalt, zonder nieuwe wijzigingswens. MENSELIJKE REVIEW geldt bij tegenstrijdige/gemengde signalen, combinatie incident en change, of wanneer geen betrouwbare categorie gekozen kan worden.

Gebruik uitsluitend de request en eventuele toegestane stakeholdermetadata; voeg geen impact, oorzaak, prioriteit, requirement of feiten toe. Geef exact zeven velden terug: Categorie; Betrokken systeem/proces; Gewenste wijziging; Businessreden; Verwacht resultaat; Ontbrekende informatie; Reden menselijke review / incidentbeschrijving. Gebruik voor niet-relevante velden NIET VAN TOEPASSING en voor ontbrekende broninformatie Informatie ontbreekt. Neem geen zelfstandige beslissingen.
```
