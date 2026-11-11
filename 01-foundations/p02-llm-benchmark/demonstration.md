# D4 — Scored demonstration

All ten responses were constructed to demonstrate the rubric. SIM-A and SIM-B identify two sets of sample responses. The five paired requests cover the same scenarios as TC01–TC05, with some wording differences from the frozen benchmark inputs. The [D4 prompt snapshot](./prompts.md#d4-demonstration-prompt) records the fixed demo specification. Scores below are the recorded example ratings.

## Results

| Profile | T /10 | O /10 | E /10 | Total /30 |
| --- | ---: | ---: | ---: | ---: |
| SIM-A | 7 | 10 | 3 | 20 |
| SIM-B | 10 | 9 | 10 | 29 |

| Example | Case | Profile | T/O/E | Total /6 | Failure and severity |
| --- | --- | --- | --- | ---: | --- |
| D4-DEMO-01 | TC01 | SIM-A | 1/2/1 | 4 | F-T, F-E · medium. Assigns the benefit to Operations and omits continued delivery of supplier email. |
| D4-DEMO-02 | TC01 | SIM-B | 2/2/2 | 6 | None recorded. |
| D4-DEMO-03 | TC02 | SIM-A | 2/2/2 | 6 | None recorded. |
| D4-DEMO-04 | TC02 | SIM-B | 2/2/2 | 6 | None recorded. |
| D4-DEMO-05 | TC03 | SIM-A | 2/2/0 | 4 | F-E · high. Invents insufficient storage as a cause for the missing backup. |
| D4-DEMO-06 | TC03 | SIM-B | 2/2/2 | 6 | None recorded. |
| D4-DEMO-07 | TC04 | SIM-A | 2/2/0 | 4 | F-E · high. Adds fraud reduction as an unsupported business benefit. |
| D4-DEMO-08 | TC04 | SIM-B | 2/1/2 | 5 | F-C · low. Uses an em dash where the contract expects NIET VAN TOEPASSING. |
| D4-DEMO-09 | TC05 | SIM-A | 0/2/0 | 2 | F-T, F-E, F-U · high. Invents SharePoint and marks the request ANALYSE-KLAAR. |
| D4-DEMO-10 | TC05 | SIM-B | 2/2/2 | 6 | None recorded. |

The profiles differ most on E. TC03 shows why a correct incident label and complete structure still require source verification. TC04 shows a format regression despite the higher SIM-B total. TC05 shows how an invented system can push an incomplete request into the wrong work queue.

## Selected outputs for review

### D4-DEMO-05 · TC03 · SIM-A

**Synthetic input**

```text
Finance meldt dat de periodieke back-up van kwartaalcijfers niet meer zichtbaar is op de Y-schijf, terwijl dit vroeger wel het geval was.
```

**Expected behaviour** — INCIDENT I.P.V. CHANGE; voorheen werkende back-up op Y-schijf is niet zichtbaar; geen nieuwe wijziging gevraagd.

**Constructed output**

```text
Categorie: INCIDENT I.P.V. CHANGE
Betrokken systeem/proces: Back-upproces kwartaalcijfers / Y-schijf
Gewenste wijziging: NIET VAN TOEPASSING
Businessreden: NIET VAN TOEPASSING
Verwacht resultaat: NIET VAN TOEPASSING
Ontbrekende informatie: NIET VAN TOEPASSING
Reden menselijke review / incidentbeschrijving: De back-upserver heeft vermoedelijk onvoldoende opslagruimte; daardoor ontbreekt de periodieke back-up op de Y-schijf.
```

**Recorded rating:** 2/2/0 (T/O/E), 4/6. F-E · high. Invents insufficient storage as a cause for the missing backup.

### D4-DEMO-08 · TC04 · SIM-B

**Synthetic input**

```text
Customer Service vraagt een verplicht veld 'bestelnummer' in het ticketportaal voor retouraanvragen, zodat dossiers sneller aan orders gekoppeld worden. Verwacht: elke nieuwe retouraanvraag bevat een bestelnummer.
```

**Expected behaviour** — ANALYSE-KLAAR; ticketportaal; verplicht bestelnummer bij retouren; sneller koppelen aan orders; elk nieuw retourdossier heeft een bestelnummer.

**Constructed output**

```text
Categorie: ANALYSE-KLAAR
Betrokken systeem/proces: Ticketportaal voor retouraanvragen
Gewenste wijziging: Veld 'bestelnummer' verplicht maken
Businessreden: Retourdossiers sneller aan orders koppelen
Verwacht resultaat: Iedere nieuwe retouraanvraag bevat een bestelnummer
Ontbrekende informatie: —
Reden menselijke review / incidentbeschrijving: NIET VAN TOEPASSING
```

**Recorded rating:** 2/1/2 (T/O/E), 5/6. F-C · low. Uses an em dash where the contract expects NIET VAN TOEPASSING.

### D4-DEMO-09 · TC05 · SIM-A

**Synthetic input**

```text
Operations vraagt nieuwe toegangsrechten zodat documentatie alleen toegankelijk is voor gerechtigden en men aan GDPR-regels voldoet; er wordt geen systeem genoemd.
```

**Expected behaviour** — ONTBREKENDE INFORMATIE; betrokken systeem/proces ontbreekt; toegang beperken tot gerechtigden; GDPR-naleving.

**Constructed output**

```text
Categorie: ANALYSE-KLAAR
Betrokken systeem/proces: SharePoint
Gewenste wijziging: Nieuwe toegangsrechten voor documentatie configureren
Businessreden: Documentatie afschermen voor onbevoegden en GDPR-naleving ondersteunen
Verwacht resultaat: Alleen gerechtigde medewerkers krijgen toegang tot documentatie
Ontbrekende informatie: NIET VAN TOEPASSING
Reden menselijke review / incidentbeschrijving: NIET VAN TOEPASSING
```

**Recorded rating:** 0/2/0 (T/O/E), 2/6. F-T, F-E, F-U · high. Invents SharePoint and marks the request ANALYSE-KLAAR.

### D4-DEMO-10 · TC05 · SIM-B

**Synthetic input**

```text
Operations vraagt nieuwe toegangsrechten zodat documentatie alleen toegankelijk is voor gerechtigden en men aan GDPR-regels voldoet; er wordt geen systeem genoemd.
```

**Expected behaviour** — ONTBREKENDE INFORMATIE; betrokken systeem/proces ontbreekt; toegang beperken tot gerechtigden; GDPR-naleving.

**Constructed output**

```text
Categorie: ONTBREKENDE INFORMATIE
Betrokken systeem/proces: Informatie ontbreekt
Gewenste wijziging: Nieuwe toegangsrechten voor documentatie instellen
Businessreden: Content beschermen tegen onbevoegde toegang en voldoen aan GDPR-regels
Verwacht resultaat: Documentatie uitsluitend toegankelijk voor gerechtigden
Ontbrekende informatie: Betrokken systeem/proces niet opgegeven; dit moet worden verduidelijkt.
Reden menselijke review / incidentbeschrijving: NIET VAN TOEPASSING
```

**Recorded rating:** 2/2/2 (T/O/E), 6/6. Identifies the missing system and leaves the application unspecified.
