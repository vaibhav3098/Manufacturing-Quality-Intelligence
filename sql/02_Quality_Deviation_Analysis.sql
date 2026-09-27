/*===========================================================
PROJECT : Manufacturing Quality Optimization

FILE    : 02_Quality_Deviation_Analysis.sql

OBJECTIVE:
Evaluate manufacturing quality by comparing actual measurements against target setpoints and identifying quality deviations.

AUTHOR  : Vaibhav Sharma
===========================================================*/
USE Manufacturing_Quality_Optimization;
GO

/*-----------------------------------------------------------
Question 1: Which quality measurements show the maximum and minimum average deviation from their target setpoints?
-----------------------------------------------------------*/

WITH Quality_deviation_average AS 
(
SELECT
    'Stage 1' AS Stage,'Measurement_00' AS Measurement,
    ROUND(AVG(ABS([Stage1.Output.Measurement0.U.Actual] -[Stage1.Output.Measurement0.U.Setpoint])),3) AS Avg_Deviation
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_01',
    ROUND(AVG(ABS([Stage1.Output.Measurement1.U.Actual] -[Stage1.Output.Measurement1.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_02',
    ROUND(AVG(ABS([Stage1.Output.Measurement2.U.Actual] -[Stage1.Output.Measurement2.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_03',
    ROUND(AVG(ABS([Stage1.Output.Measurement3.U.Actual] -[Stage1.Output.Measurement3.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_04',
    ROUND(AVG(ABS([Stage1.Output.Measurement4.U.Actual] -[Stage1.Output.Measurement4.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_05',
    ROUND(AVG(ABS([Stage1.Output.Measurement5.U.Actual] -[Stage1.Output.Measurement5.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_06',
    ROUND(AVG(ABS([Stage1.Output.Measurement6.U.Actual] -[Stage1.Output.Measurement6.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_07',
    ROUND(AVG(ABS([Stage1.Output.Measurement7.U.Actual] -[Stage1.Output.Measurement7.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_08',
    ROUND(AVG(ABS([Stage1.Output.Measurement8.U.Actual] -[Stage1.Output.Measurement8.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_09',
    ROUND(AVG(ABS([Stage1.Output.Measurement9.U.Actual] -[Stage1.Output.Measurement9.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_10',
    ROUND(AVG(ABS([Stage1.Output.Measurement10.U.Actual] -[Stage1.Output.Measurement10.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_11',
    ROUND(AVG(ABS([Stage1.Output.Measurement11.U.Actual] -[Stage1.Output.Measurement11.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_12',
    ROUND(AVG(ABS([Stage1.Output.Measurement12.U.Actual] -[Stage1.Output.Measurement12.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_13',
    ROUND(AVG(ABS([Stage1.Output.Measurement13.U.Actual] -[Stage1.Output.Measurement13.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_14',
    ROUND(AVG(ABS([Stage1.Output.Measurement14.U.Actual] -[Stage1.Output.Measurement14.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_00',
    ROUND(AVG(ABS([Stage2.Output.Measurement0.U.Actual] -[Stage2.Output.Measurement0.U.Setpoint])),3) AS Avg_Deviation
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_01',
    ROUND(AVG(ABS([Stage2.Output.Measurement1.U.Actual] -[Stage2.Output.Measurement1.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_02',
    ROUND(AVG(ABS([Stage2.Output.Measurement2.U.Actual] -[Stage2.Output.Measurement2.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_03',
    ROUND(AVG(ABS([Stage2.Output.Measurement3.U.Actual] -[Stage2.Output.Measurement3.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_04',
    ROUND(AVG(ABS([Stage2.Output.Measurement4.U.Actual] -[Stage2.Output.Measurement4.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_05',
    ROUND(AVG(ABS([Stage2.Output.Measurement5.U.Actual] -[Stage2.Output.Measurement5.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_06',
    ROUND(AVG(ABS([Stage2.Output.Measurement6.U.Actual] -[Stage2.Output.Measurement6.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_07',
    ROUND(AVG(ABS([Stage2.Output.Measurement7.U.Actual] -[Stage2.Output.Measurement7.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_08',
    ROUND(AVG(ABS([Stage2.Output.Measurement8.U.Actual] -[Stage2.Output.Measurement8.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
   'Stage 2','Measurement2_09',
    ROUND(AVG(ABS([Stage2.Output.Measurement9.U.Actual] -[Stage2.Output.Measurement9.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_10',
    ROUND(AVG(ABS([Stage2.Output.Measurement10.U.Actual] -[Stage2.Output.Measurement10.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_11',
    ROUND(AVG(ABS([Stage2.Output.Measurement11.U.Actual] -[Stage2.Output.Measurement11.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_12',
    ROUND(AVG(ABS([Stage2.Output.Measurement12.U.Actual] -[Stage2.Output.Measurement12.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_13',
    ROUND(AVG(ABS([Stage2.Output.Measurement13.U.Actual] -[Stage2.Output.Measurement13.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_14',
    ROUND(AVG(ABS([Stage2.Output.Measurement14.U.Actual] -[Stage2.Output.Measurement14.U.Setpoint])),3)
FROM manufacturing_process_optimization
)
--Top 5 maximum quality devaition points
SELECT TOP (5)
Stage,Measurement,Avg_Deviation 
FROM Quality_deviation_average
ORDER BY Avg_Deviation DESC 


/*
Business Insight:
• Top 5 points showing maximum deviation(avearge) from setpoint are:
---Stage 2 (point 4):28.561
---Stage 1 (point 1):14.599
---Stage 1 (point 14):7.715
---Stage 2 (point 1):5.449
---Stage 2 (point 9):5.054
*/

--Top 5 minimum quality devaition(average) points
SELECT TOP (5)
Stage,Measurement,Avg_Deviation 
FROM Quality_deviation_average
ORDER BY Avg_Deviation 

/*
• Top 5 points showing minimum deviation (average) from setpoint are:
---Stage 2 (point 5):0.183
---Stage 2 (point 12):0.284
---Stage 2 (point 7):0.324
---Stage 2 (point 11):0.366
---Stage 2 (point 10):0.429
*/

/*-----------------------------------------------------------
Question 2: Which quality measurements show the maximum deviation from their target setpoints?
-----------------------------------------------------------*/

WITH Quality_deviation_max AS 
(
SELECT
    'Stage 1' AS Stage,'Measurement_00' AS Measurement,
    ROUND(MAX(ABS([Stage1.Output.Measurement0.U.Actual] -[Stage1.Output.Measurement0.U.Setpoint])),3) AS Max_Deviation
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_01',
    ROUND(MAX(ABS([Stage1.Output.Measurement1.U.Actual] -[Stage1.Output.Measurement1.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_02',
    ROUND(MAX(ABS([Stage1.Output.Measurement2.U.Actual] -[Stage1.Output.Measurement2.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_03',
    ROUND(MAX(ABS([Stage1.Output.Measurement3.U.Actual] -[Stage1.Output.Measurement3.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_04',
    ROUND(MAX(ABS([Stage1.Output.Measurement4.U.Actual] -[Stage1.Output.Measurement4.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_05',
    ROUND(MAX(ABS([Stage1.Output.Measurement5.U.Actual] -[Stage1.Output.Measurement5.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_06',
    ROUND(MAX(ABS([Stage1.Output.Measurement6.U.Actual] -[Stage1.Output.Measurement6.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_07',
    ROUND(MAX(ABS([Stage1.Output.Measurement7.U.Actual] -[Stage1.Output.Measurement7.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_08',
    ROUND(MAX(ABS([Stage1.Output.Measurement8.U.Actual] -[Stage1.Output.Measurement8.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_09',
    ROUND(MAX(ABS([Stage1.Output.Measurement9.U.Actual] -[Stage1.Output.Measurement9.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_10',
    ROUND(MAX(ABS([Stage1.Output.Measurement10.U.Actual] -[Stage1.Output.Measurement10.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_11',
    ROUND(MAX(ABS([Stage1.Output.Measurement11.U.Actual] -[Stage1.Output.Measurement11.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_12',
    ROUND(MAX(ABS([Stage1.Output.Measurement12.U.Actual] -[Stage1.Output.Measurement12.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_13',
    ROUND(MAX(ABS([Stage1.Output.Measurement13.U.Actual] -[Stage1.Output.Measurement13.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 1','Measurement_14',
    ROUND(MAX(ABS([Stage1.Output.Measurement14.U.Actual] -[Stage1.Output.Measurement14.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_00',
    ROUND(MAX(ABS([Stage2.Output.Measurement0.U.Actual] -[Stage2.Output.Measurement0.U.Setpoint])),3) AS MAX_Deviation
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_01',
    ROUND(MAX(ABS([Stage2.Output.Measurement1.U.Actual] -[Stage2.Output.Measurement1.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_02',
    ROUND(MAX(ABS([Stage2.Output.Measurement2.U.Actual] -[Stage2.Output.Measurement2.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_03',
    ROUND(MAX(ABS([Stage2.Output.Measurement3.U.Actual] -[Stage2.Output.Measurement3.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_04',
    ROUND(MAX(ABS([Stage2.Output.Measurement4.U.Actual] -[Stage2.Output.Measurement4.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_05',
    ROUND(MAX(ABS([Stage2.Output.Measurement5.U.Actual] -[Stage2.Output.Measurement5.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_06',
    ROUND(MAX(ABS([Stage2.Output.Measurement6.U.Actual] -[Stage2.Output.Measurement6.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_07',
    ROUND(MAX(ABS([Stage2.Output.Measurement7.U.Actual] -[Stage2.Output.Measurement7.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_08',
    ROUND(MAX(ABS([Stage2.Output.Measurement8.U.Actual] -[Stage2.Output.Measurement8.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
   'Stage 2','Measurement2_09',
    ROUND(MAX(ABS([Stage2.Output.Measurement9.U.Actual] -[Stage2.Output.Measurement9.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_10',
    ROUND(MAX(ABS([Stage2.Output.Measurement10.U.Actual] -[Stage2.Output.Measurement10.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_11',
    ROUND(MAX(ABS([Stage2.Output.Measurement11.U.Actual] -[Stage2.Output.Measurement11.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_12',
    ROUND(MAX(ABS([Stage2.Output.Measurement12.U.Actual] -[Stage2.Output.Measurement12.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_13',
    ROUND(MAX(ABS([Stage2.Output.Measurement13.U.Actual] -[Stage2.Output.Measurement13.U.Setpoint])),3)
FROM manufacturing_process_optimization
UNION ALL

SELECT
    'Stage 2','Measurement2_14',
    ROUND(MAX(ABS([Stage2.Output.Measurement14.U.Actual] -[Stage2.Output.Measurement14.U.Setpoint])),3)
FROM manufacturing_process_optimization
)
--Top 3 maximum quality devaition points
SELECT TOP (3)
Stage,Measurement,MAX_Deviation 
FROM Quality_deviation_max
ORDER BY MAX_Deviation DESC;

/*
Business Insight:
• Top 3 points showing maximum deviation from setpoint are:
---Stage 1 (point 4):40.239
---Stage 2 (point 4):31.36
---Stage 1 (point 1):25.873
*/
