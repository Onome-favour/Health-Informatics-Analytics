
CREATE OR REPLACE VIEW Graph_Logic_View AS
SELECT 
    Symptoms AS Symptom_Node, 
    Disease AS Disease_Node, 
    COUNT(*) AS Connection_Weight,
    AVG(Age) AS Patient_Demographic_Avg
FROM cleaned_big_data
GROUP BY Symptoms, Disease
HAVING Connection_Weight > 10
ORDER BY Connection_Weight DESC;

SELECT * FROM Graph_Logic_View LIMIT 10;
