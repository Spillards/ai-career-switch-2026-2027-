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
