CREATE OR REPLACE VIEW health_research_view AS
SELECT 
    b.Patient_ID, 
    b.Age, 
    -- This ensures Power BI sees "Female" or "Male" with NO hidden characters
    TRIM(REPLACE(REPLACE(b.Gender, '\r', ''), '\n', '')) AS Gender,
    TRIM(REPLACE(REPLACE(b.Disease, '\r', ''), '\n', '')) AS Disease,
    b.Symptoms AS Clinical_Label, 
    s.Name AS Story_Source,
    s.Narrative_Summary AS Thick_Data_Context
FROM cleaned_big_data b
LEFT JOIN patient_stories s ON 
    -- The join must also use the "Cleaned" version of the text
    TRIM(REPLACE(REPLACE(b.Gender, '\r', ''), '\n', '')) = TRIM(REPLACE(REPLACE(s.Gender, '\r', ''), '\n', '')) 
    AND 
    TRIM(REPLACE(REPLACE(b.Disease, '\r', ''), '\n', '')) = TRIM(REPLACE(REPLACE(s.Disease, '\r', ''), '\n', ''))
WHERE b.Disease LIKE 'Diabetes%';

















