-- BLOK 3 - SQL-BASIS
-- Voorwaarde: de fictieve churn-CSV is geïmporteerd in de tabel customers.
-- De tabel bevat tien oefenrecords; de resultaten ondersteunen geen uitspraken over
-- echte klanten of een grotere klantenpopulatie.

-- OEFENING D1 - BUSINESSAGGREGATIE PER PLAN

-- BUSINESSVRAAG
-- Toon per plan het aantal records en de gemiddelde maanduitgave, alfabetisch op plan.

-- DATAVERTALING
-- Tabel: customers
-- Kolommen: plan, monthly_spend
-- Functies: COUNT() voor het aantal records, AVG() voor de gemiddelde maanduitgave en
-- ROUND() om het gemiddelde af te ronden op twee decimalen
-- Groepen: groeperen per plan
-- Volgorde: alfabetisch volgens plan

-- VERWACHTING
-- Ik verwacht per plan één resultaatrij met het aantal records en de gemiddelde
-- maanduitgave voor dat plan, alfabetisch gesorteerd.

-- HOOFDQUERY
SELECT
    plan,
    COUNT(*) AS aantal_records,
    ROUND(AVG(monthly_spend), 2) AS gemiddelde_maanduitgave
FROM customers
GROUP BY plan
ORDER BY plan;

-- UITKOMST HOOFDQUERY:
-- Advanced;4;50.0
-- Basic;3;25.0
-- Pro;3;100.0

-- CONTROLEQUERY
-- Controleer de aantallen en de berekende gemiddelden via een tweede redenering.
SELECT
    plan,
    COUNT(*) AS aantal_records,
    SUM(monthly_spend) AS totale_maanduitgave
FROM customers
GROUP BY plan
ORDER BY plan;

-- CONTROLE:
-- Voor elk plan geldt:
-- gemiddelde_maanduitgave = totale_maanduitgave / aantal_records
-- De groepsaantallen vormen samen opnieuw het totale aantal records:
-- 4 + 3 + 3 = 10 records.

-- BEGRENSDE CONCLUSIE
-- In deze fictieve oefendataset bevat Advanced 4 records met een gemiddelde
-- maanduitgave van 50,00; Basic bevat 3 records met een gemiddelde maanduitgave van
-- 25,00; en Pro bevat 3 records met een gemiddelde maanduitgave van 100,00.
-- De plangroepen worden alfabetisch weergegeven.

-- BEPERKING
-- Deze uitkomst beschrijft alleen de tien fictieve oefenrecords en ondersteunt geen
-- uitspraak over echte klanten of een grotere klantenpopulatie.


-- OEFENING D2 - BUSINESSAGGREGATIE PER CHURNWAARDE

-- BUSINESSVRAAG
-- Toon per churnwaarde het aantal records en het gemiddelde aantal supporttickets in
-- de afgelopen 90 dagen.

-- DATAVERTALING
-- Tabel: customers
-- Kolommen: churned, support_tickets_90d
-- Functies: COUNT() voor het aantal records, AVG() voor het gemiddelde en ROUND()
-- om het gemiddelde af te ronden op twee decimalen
-- Groepen: groeperen per churned-waarde
-- Volgorde: alfabetisch volgens churned voor een vaste weergavevolgorde

-- VERWACHTING
-- Ik verwacht één resultaatrij voor false en één voor true, met per groep het
-- aantal records en het gemiddelde aantal supporttickets.

-- HOOFDQUERY
SELECT
    churned,
    COUNT(*) AS aantal_records,
    ROUND(AVG(support_tickets_90d), 2) AS gemiddeld_aantal_supporttickets
FROM customers
GROUP BY churned
ORDER BY churned;

-- UITKOMST HOOFDQUERY:
-- false;7;3.86
-- true;3;2.67

-- CONTROLEQUERY
-- Bereken het gemiddelde onafhankelijk als som gedeeld door het aantal niet-lege
-- waarden en controleer daarnaast het aantal records per groep.
SELECT
    churned,
    COUNT(*) AS aantal_records,
    SUM(support_tickets_90d) AS som_tickets,
    COUNT(support_tickets_90d) AS aantal_waarden,
    ROUND(
        SUM(support_tickets_90d) * 1.0 / COUNT(support_tickets_90d),
        2
    ) AS controle_gemiddelde
FROM customers
GROUP BY churned
ORDER BY churned;

-- UITKOMST CONTROLEQUERY:
-- false;7;27;7;3.86
-- true;3;8;3;2.67

-- CONTROLE:
-- 27 / 7 = 3.86 en 8 / 3 = 2.67, telkens afgerond op twee decimalen.
-- De groepsaantallen vormen samen opnieuw het totale aantal records:
-- 7 + 3 = 10 records.

-- BEGRENSDE CONCLUSIE
-- In deze fictieve oefendataset hebben de 7 records met churned = false gemiddeld
-- 3,86 supporttickets in de afgelopen 90 dagen. De 3 records met churned = true
-- hebben gemiddeld 2,67 supporttickets.

-- BEPERKING
-- Deze beschrijvende uitkomst geldt uitsluitend voor de tien oefenrecords. Ze toont
-- niet aan dat het aantal supporttickets churn veroorzaakt en is niet representatief
-- voor echte klanten.


-- OEFENING D3 - MINIMUM EN MAXIMUM KLANTDUUR

-- BUSINESSVRAAG
-- Bepaal de minimale en maximale klantduur in maanden binnen de volledige fictieve
-- oefentabel.

-- DATAVERTALING
-- Tabel: customers
-- Kolom: tenure_months
-- Functies: MIN() voor de minimumwaarde en MAX() voor de maximumwaarde
-- Filters: geen; de volledige tabel wordt gebruikt

-- VERWACHTING
-- Ik verwacht één resultaatrij met de laagste en hoogste niet-lege klantduur.

-- HOOFDQUERY
SELECT
    MIN(tenure_months) AS minimum_klantduur,
    MAX(tenure_months) AS maximum_klantduur
FROM customers;

-- UITKOMST HOOFDQUERY:
-- 2;37

-- CONTROLEQUERY 1
-- Sorteer oplopend en neem de eerste niet-lege waarde om het minimum te controleren.
SELECT tenure_months
FROM customers
WHERE tenure_months IS NOT NULL
ORDER BY tenure_months ASC
LIMIT 1;

-- UITKOMST CONTROLEQUERY 1:
-- 2

-- CONTROLEQUERY 2
-- Sorteer aflopend en neem de eerste niet-lege waarde om het maximum te controleren.
SELECT tenure_months
FROM customers
WHERE tenure_months IS NOT NULL
ORDER BY tenure_months DESC
LIMIT 1;

-- UITKOMST CONTROLEQUERY 2:
-- 37

-- BEGRENSDE CONCLUSIE
-- In deze fictieve oefendataset varieert tenure_months van minimaal 2 tot maximaal
-- 37 maanden.

-- BEPERKING
-- Deze uitkomst beschrijft alleen de tien fictieve oefenrecords en ondersteunt geen
-- uitspraak over echte klanten of een grotere klantenpopulatie.
