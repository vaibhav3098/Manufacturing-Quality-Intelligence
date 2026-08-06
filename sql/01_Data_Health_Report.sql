/*===========================================================
PROJECT : Manufacturing Quality Optimization

FILE    : 01_Data_Health_Report.sql

OBJECTIVE:
Understand the overall health and characteristics of the
manufacturing dataset before performing quality analysis.

AUTHOR  : Vaibhav Sharma
===========================================================*/
USE Manufacturing_Quality_Optimization;
GO

/*-----------------------------------------------------------
Question 1: How many production records are available?
-----------------------------------------------------------*/

SELECT COUNT(*) AS Total_Production_Records
FROM manufacturing_process_optimization;

/*
Business Insight:
The dataset contains 14,088 production records collected from the
manufacturing process. This provides sufficient observations for
statistical analysis and process monitoring.
*/

/*-----------------------------------------------------------
Question 2: What time period does the dataset cover?
-----------------------------------------------------------*/
SELECT
    MIN(time_stamp) AS Start_Time,
    MAX(time_stamp) AS End_Time,
    DATEDIFF(HOUR, MIN(time_stamp), MAX(time_stamp)) AS Duration_Hours
FROM manufacturing_process_optimization;

/*
Business Insight:
• Data covers one production shift (~4 hours).
• Suitable for short-term process analysis.
• Not suitable for long-term trend analysis.
*/

/*-----------------------------------------------------------
Question 3:  What is the distribution of manufacturing process variables across different stages and machines?
-----------------------------------------------------------*/
SELECT
    CASE
        WHEN COLUMN_NAME LIKE 'AmbientConditions.%'
            THEN 'Ambient Conditions'

        WHEN COLUMN_NAME LIKE 'Machine1.%'
            THEN 'Machine 1'

        WHEN COLUMN_NAME LIKE 'Machine2.%'
            THEN 'Machine 2'

        WHEN COLUMN_NAME LIKE 'Machine3.%'
            THEN 'Machine 3'

        WHEN COLUMN_NAME LIKE 'Machine4.%'
            THEN 'Machine 4'

        WHEN COLUMN_NAME LIKE 'Machine5.%'
            THEN 'Machine 5'

        WHEN COLUMN_NAME LIKE 'Stage1.Output.Measurement%.U.Actual'
            THEN 'Stage 1 Actual'

        WHEN COLUMN_NAME LIKE 'Stage1.Output.Measurement%.U.Setpoint'
            THEN 'Stage 1 Setpoint'

        WHEN COLUMN_NAME LIKE 'Stage2.Output.Measurement%.U.Actual'
            THEN 'Stage 2 Actual'

        WHEN COLUMN_NAME LIKE 'Stage2.Output.Measurement%.U.Setpoint'
            THEN 'Stage 2 Setpoint'

        ELSE 'Other'
    END AS Category,

    COUNT(*) AS Total_Columns

FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='manufacturing_process_optimization'

GROUP BY
CASE
        WHEN COLUMN_NAME LIKE 'AmbientConditions.%'
            THEN 'Ambient Conditions'

        WHEN COLUMN_NAME LIKE 'Machine1.%'
            THEN 'Machine 1'

        WHEN COLUMN_NAME LIKE 'Machine2.%'
            THEN 'Machine 2'

        WHEN COLUMN_NAME LIKE 'Machine3.%'
            THEN 'Machine 3'

        WHEN COLUMN_NAME LIKE 'Machine4.%'
            THEN 'Machine 4'

        WHEN COLUMN_NAME LIKE 'Machine5.%'
            THEN 'Machine 5'

        WHEN COLUMN_NAME LIKE 'Stage1.Output.Measurement%.U.Actual'
            THEN 'Stage 1 Actual'

        WHEN COLUMN_NAME LIKE 'Stage1.Output.Measurement%.U.Setpoint'
            THEN 'Stage 1 Setpoint'

        WHEN COLUMN_NAME LIKE 'Stage2.Output.Measurement%.U.Actual'
            THEN 'Stage 2 Actual'

        WHEN COLUMN_NAME LIKE 'Stage2.Output.Measurement%.U.Setpoint'
            THEN 'Stage 2 Setpoint'

        ELSE 'Other'
END;

/*
Business Insight:
• The dataset contains measurements from multiple manufacturing stages,five machines, ambient conditions, and quality measurements.
• Stage 1 and Stage 2 each record both Actual and Setpoint values,enabling process capability and deviation analysis.
• The dataset provides complete coverage of process inputs and quality outputs.
*/


/*-----------------------------------------------------------
Question 4:  How many Quality Measurements (Actual) and Target Setpoints are monitored?
-----------------------------------------------------------*/
SELECT
    SUM(
        CASE
            WHEN COLUMN_NAME LIKE 'Stage%.Output.Measurement%.U.Actual'
            THEN 1
            ELSE 0
        END
    ) AS Total_Quality_Actual,

    SUM(
        CASE
            WHEN COLUMN_NAME LIKE 'Stage%.Output.Measurement%.U.Setpoint'
            THEN 1
            ELSE 0
        END
    ) AS Total_Quality_Setpoints

FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='manufacturing_process_optimization';

/*
Business Insight:
• The dataset contains 30 quality setpoints and 30 corresponding actual quality measurements, enabling quality deviation analysis.
*/

/*-----------------------------------------------------------
Question 5:  How many process parameters are monitored for each machine?
-----------------------------------------------------------*/
SELECT
    CASE
        WHEN COLUMN_NAME LIKE 'Machine1.%' THEN 'Machine 1'
        WHEN COLUMN_NAME LIKE 'Machine2.%' THEN 'Machine 2'
        WHEN COLUMN_NAME LIKE 'Machine3.%' THEN 'Machine 3'
        WHEN COLUMN_NAME LIKE 'Machine4.%' THEN 'Machine 4'
        WHEN COLUMN_NAME LIKE 'Machine5.%' THEN 'Machine 5'
    END AS Machine,

    COUNT(*) AS Total_Process_Parameters

FROM INFORMATION_SCHEMA.COLUMNS

WHERE TABLE_NAME='manufacturing_process_optimization'

AND (
COLUMN_NAME LIKE 'Machine1.%'
OR COLUMN_NAME LIKE 'Machine2.%'
OR COLUMN_NAME LIKE 'Machine3.%'
OR COLUMN_NAME LIKE 'Machine4.%'
OR COLUMN_NAME LIKE 'Machine5.%'
)

GROUP BY
CASE
        WHEN COLUMN_NAME LIKE 'Machine1.%' THEN 'Machine 1'
        WHEN COLUMN_NAME LIKE 'Machine2.%' THEN 'Machine 2'
        WHEN COLUMN_NAME LIKE 'Machine3.%' THEN 'Machine 3'
        WHEN COLUMN_NAME LIKE 'Machine4.%' THEN 'Machine 4'
        WHEN COLUMN_NAME LIKE 'Machine5.%' THEN 'Machine 5'
END

ORDER BY Machine;
/*
Business Insight:
• Machine 1–3 include raw material property measurements in addition to process parameters, resulting in a higher number of monitored variables.

• Machine 4–5 monitor only downstream process parameters sinceraw material characteristics have already been verified earlier.
*/