# Data Quality Cases — Customer Churn Dataset

## 1. Doel

Deze oefening toont hoe concrete datakwaliteitsregels fouten in een klantdataset detecteren voordat de data wordt gebruikt voor analyse, rapportering of machine learning.

## 2. Dataset

De dataset bevat klantgegevens voor een fictieve churncase.

Belangrijke velden:

- `customer_id`
- `tenure_months`
- `plan`
- `monthly_spend`
- `support_tickets_90d`
- `churned`

De fouten zijn bewust aangebracht in een kopie van de oorspronkelijke dataset.

## 3. Datakwaliteitscases

| ID | Fouttype | Record en veld | Foutieve waarde | Detectieregel | Businessimpact | Correctie |
|---|---|---|---|---|---|---|
| DQ-01 | Missing value | Klant `1006`, `tenure_months` | Leeg | `tenure_months` mag niet leeg zijn en moet een geheel getal ≥ 0 bevatten. | Analyses en churnvoorspellingen missen een belangrijk kenmerk over de klantduur. | Achterhaal de juiste waarde aan de bron of markeer het record als onbruikbaar. |
| DQ-02 | Verkeerd datatype/domein | Klant `1007`, `churned` | `88` | `churned` mag uitsluitend `true` of `false` zijn. | Het targetlabel kan niet betrouwbaar worden gebruikt voor training of rapportering. | Vervang door de geverifieerde booleanwaarde. |
| DQ-03 | Out-of-range | Klant `1005`, `monthly_spend` | `-20` | `monthly_spend` moet numeriek en ≥ 0 zijn. | Omzetberekeningen, klantwaarde en modelrelaties worden vertekend. | Controleer de bron en corrigeer of verwijder het ongeldige record. |
| DQ-04 | Duplicate ID | `customer_id` | `1009` komt tweemaal voor | Iedere niet-lege `customer_id` moet een positief geheel getal zijn en exact eenmaal voorkomen. | Klanten kunnen dubbel worden geteld en koppelingen kunnen bij het verkeerde record terechtkomen. | Onderzoek of het om een dubbel record of twee foutief gekoppelde klanten gaat. |
| DQ-05 | Inconsistente categorie | Klant `1004`, `plan` | `Groen` | `plan` moet exact `Basic`, `Advanced` of `Pro` zijn. | Segmentrapporten en categoriecodering worden onbetrouwbaar. | Map de waarde naar de correcte toegestane categorie nadat de bron is gecontroleerd. |

## 4. Testresultaat

| Controle | Verwacht resultaat | Werkelijk resultaat |
|---|---|---|
| Missing-valuecontrole | DQ-01 wordt gevonden | Gevonden |
| Booleancontrole | DQ-02 wordt gevonden | Gevonden |
| Bereikcontrole | DQ-03 wordt gevonden | Gevonden |
| Uniciteitscontrole | DQ-04 wordt gevonden | Gevonden |
| Categoriecontrole | DQ-05 wordt gevonden | Gevonden |

**Totaal:** 5 van de 5 bewust aangebrachte fouten zijn gedetecteerd.

## 5. Conclusie

De foutieve dataset is niet geschikt voor analyse of modeltraining zolang deze fouten niet zijn onderzocht en gecorrigeerd.

De oefening toont dat een datakwaliteitsregel minimaal vier zaken nodig heeft:

1. een duidelijk veld;
2. een geldige waarde of geldigheidsvoorwaarde;
3. een detecteerbare overtreding;
4. een beschreven businessimpact.

Een algemene uitspraak zoals “de data moet correct zijn” is geen testbare kwaliteitsregel.

## 6. Data readiness review v0.1

### Beoogde voorspelling en label

Deze fictieve oefencase veronderstelt een supervised-classificationvraag: **welke klanten zullen churnen?** De kolom `churned` is het label dat een eventueel model zou moeten leren voorspellen:

- `true`: de klant heeft opgezegd;
- `false`: de klant is gebleven.

De huidige dataset legt nog niet vast **binnen welke toekomstige periode** churn wordt gemeten. Voor een echt model moeten observatievenster, voorspelmoment en voorspellingstermijn eerst eenduidig worden gedefinieerd. Anders ontstaat risico op label ambiguity en data leakage.

### Waarschijnlijk bruikbare features

| Feature | Mogelijke voorspellende waarde | Voorwaarde voor gebruik |
|---|---|---|
| `tenure_months` | Klantduur kan samenhangen met opzeggedrag. | Moet beschikbaar zijn op het voorspelmoment en consequent worden berekend. |
| `plan` | Verschillen tussen abonnementen kunnen samenhangen met churn. | Categorieën moeten stabiel en volledig zijn; kleine groepen afzonderlijk beoordelen. |
| `monthly_spend` | Prijs- of waardebeleving kan relevant zijn. | Valuta, kortingen en meetperiode moeten vastliggen; waarden moeten niet-negatief zijn. |
| `support_tickets_90d` | Recente serviceproblemen kunnen een vroeg signaal zijn. | Eén ticketdefinitie en een correct afgebakend venster van 90 dagen zijn nodig. |

Dit zijn **kandidaatfeatures**, geen bewezen predictors. Hun bruikbaarheid moet worden aangetoond met voldoende representatieve historische data, leakage-controles, segmentanalyse en evaluatie op ongeziene data.

### Identifier, geen nuttige predictor

`customer_id` is een technische identifier. Het veld is nodig om records uniek te houden, fouten te onderzoeken en gecontroleerd aan brongegevens te koppelen, maar hoort niet als predictor in het model. De numerieke waarde heeft geen legitieme businessbetekenis voor churn en kan toevallige patronen of memorisatie veroorzaken.

### Privacy en sensitivity

In deze oefenset staan geen rechtstreeks identificerende velden zoals naam of e-mailadres en geen expliciete bijzondere categorieën van persoonsgegevens. Toch vragen meerdere velden aandacht:

- `customer_id` kan een pseudonieme persoonsreferentie zijn en blijft persoonsgegevens wanneer heridentificatie via andere systemen mogelijk is;
- `monthly_spend` bevat financieel/commercieel klantgedrag;
- `plan`, `tenure_months`, `support_tickets_90d` en `churned` vormen samen een klantprofiel en kunnen worden gebruikt voor profiling of geautomatiseerde segmentatie;
- koppeling met CRM-, support- of betaalgegevens vergroot privacy-, toegangs- en doelbindingsrisico's.

Voor werkelijk gebruik moeten minimaal doel en rechtsgrond, dataminimalisatie, toegangsrechten, bewaartermijn, beveiliging en de gevolgen van profiling worden beoordeeld door de bevoegde privacy- en data-eigenaren.

### Zwaarste kwaliteitsrisico

De zwaarste van de vijf aangebrachte fouten is **DQ-02: `churned = 88`**. Dit is een fout in het label — de ground truth waarop een supervised model leert en waarop de kwaliteit ervan wordt gemeten. Een verkeerd label kan:

- het model het verkeerde patroon aanleren;
- trainings- en evaluatiemetrics vertekenen;
- een onjuiste businessbeslissing legitimeren;
- moeilijker zichtbaar blijven dan een eenvoudige featurefout.

**Kwaliteitsregel:** `churned` is verplicht en moet exact een geldige booleanwaarde (`true` of `false`) bevatten. Iedere andere of ontbrekende waarde wordt geblokkeerd voor training en evaluatie totdat ze tegen de bronsituatie is geverifieerd.

De duplicate `customer_id` is eveneens kritiek: wanneer duplicaten over train- en testsets worden verdeeld, kan dezelfde klant aan beide zijden terechtkomen en ontstaat datalek/leakage met kunstmatig goede evaluatieresultaten.

### Readinessbesluit v0.1

**Besluit: niet model-ready; wel geschikt als leer- en validatie-oefening.**

Redenen:

- de dataset is klein en bevat bewust aangebrachte fouten;
- omvang, class balance en representativiteit zijn niet aangetoond;
- labelbron, voorspelmoment en voorspellingstermijn ontbreken;
- volledigheid, actualiteit en historische stabiliteit zijn niet onderzocht;
- privacygrondslag, data-eigenaarschap en toegangsmodel zijn niet vastgelegd;
- er is nog geen train/validation/test-splitsing of leakagecontrole.

### Vereiste vervolgstappen voor een echte churncase

1. Definieer churn, observatievenster, voorspelmoment en voorspellingstermijn met de business owner.
2. Herstel of quarantaineer alle records die niet aan de kwaliteitsregels voldoen en documenteer de correctiebron.
3. Verzamel voldoende historische, representatieve data en analyseer class balance, missingness en segmentdekking.
4. Bevestig per feature dat ze op het voorspelmoment beschikbaar is en geen informatie uit de toekomst bevat.
5. Voer privacy-, doelbindings-, toegangs- en retentiebeoordeling uit.
6. Bevries een onafhankelijke testset en vergelijk een model met een eenvoudige businessbaseline.
