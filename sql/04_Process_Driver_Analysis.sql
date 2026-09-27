/*==========================================================
PROJECT : Manufacturing Quality Optimization

FILE    : 03_Root_Cause_Analysis.sql

OBJECTIVE:
Identify the key process parameters responsible for the highest quality deviation observed during manufacturing.

AUTHOR  : Vaibhav Sharma
==========================================================*/
/*-----------------------------------------------------------
RCA Strategy

• Quality analysis identified Stage 2 Measurement 4 as the largest source of quality deviation.

• Process analysis shortlisted the highest variability process parameters.

• RCA evaluates whether operating levels of these shortlisted parameters are associated with changes in Stage 2 Measurement 4
  quality deviation.
-----------------------------------------------------------*/

/*-----------------------------------------------------------
Business Objective 1:

Evaluate whether different operating levels of Machine 1 Raw Material Property 3 are associated with variation in
Stage 2 Measurement 4 quality deviation.
-----------------------------------------------------------*/

WITH RM3_RCA AS
(
    SELECT
        CASE NTILE(3) OVER (ORDER BY [Machine1.RawMaterial.Property3] )
            WHEN 1 THEN 'Low'
            WHEN 2 THEN 'Medium'
            WHEN 3 THEN 'High'
        END AS Operating_Range,
        [Machine1.RawMaterial.Property3] AS RM3,
        ABS([Stage2.Output.Measurement4.U.Actual]-[Stage2.Output.Measurement4.U.Setpoint]) AS Quality_Deviation
    FROM manufacturing_process_optimization
)

SELECT
    Operating_Range,
    COUNT(*) AS Production_Records,
    ROUND(MIN(RM3),2) AS Min_Value,
    ROUND(MAX(RM3),2) AS Max_Value,
    ROUND(AVG(RM3),2) AS Avg_Value,
    ROUND(AVG(Quality_Deviation),2) AS Avg_Quality_Deviation,
    ROUND(STDEV(Quality_Deviation),2) AS Std_Deviation
FROM RM3_RCA
GROUP BY Operating_Range
ORDER BY CASE Operating_Range
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
END;

/*-----------------------------------------------------------
Business Insight:
• Increasing Machine 1 Raw Material Property 3 from the low operating range to medium/high operating ranges is associated with an 
increase in average quality deviation.
• However, the low operating range exhibits substantially higher variability (Std Dev = 13.14), indicating inconsistent process performance, 
whereas the medium and high operating ranges show consistently high deviation with lower variability.
• This suggests that lower RM Property 3 values produce more unpredictable quality, while higher values consistently result in poorer 
quality performance.
-----------------------------------------------------------*/

/*-----------------------------------------------------------
Business Objective 2:

Evaluate whether different operating levels of Machine 1 Motor current are associated with variation in
Stage 2 Measurement 4 quality deviation.
-----------------------------------------------------------*/

WITH M1_motor_current_RCA AS
(
    SELECT CASE NTILE(3) OVER(ORDER BY [Machine1.MotorAmperage.U.Actual])
            WHEN 1 THEN 'Low'
            WHEN 2 THEN 'Medium'
            WHEN 3 THEN 'High'
        END AS Operating_Range,
        [Machine1.MotorAmperage.U.Actual] AS M1_motor_current,
        ABS([Stage2.Output.Measurement4.U.Actual]-[Stage2.Output.Measurement4.U.Setpoint]) AS Quality_Deviation
 FROM manufacturing_process_optimization
)

SELECT
    Operating_Range,
    COUNT(*) AS Production_Records,
    ROUND(MIN(M1_motor_current),2) AS Min_Value,
    ROUND(MAX(M1_motor_current),2) AS Max_Value,
    ROUND(AVG(M1_motor_current),2) AS Avg_Value,
    ROUND(AVG(Quality_Deviation),2) AS Avg_Quality_Deviation,
    ROUND(STDEV(Quality_Deviation),2) AS Std_Deviation
FROM M1_motor_current_RCA
GROUP BY Operating_Range
ORDER BY CASE Operating_Range
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
END;

/*-----------------------------------------------------------
Business Insight:
• Low and medium motor current operating ranges exhibit similar average quality deviation (~31 units), indicating comparable
  quality performance under these operating conditions.
• The high motor current operating range shows a lower average quality deviation (23.79 units), but with substantially higher
  variability (Std Dev = 13.10), indicating less predictable process performance.
• Motor current alone does not exhibit a monotonic relationship with quality deviation and is therefore unlikely to be the
  primary root cause. It should be evaluated together with other process parameters.
-----------------------------------------------------------*/

/*-----------------------------------------------------------
Business Objective 3:
Evaluate whether different operating levels of Machine 1 Motor current are associated with variation in Stage 2 Measurement 4 
quality deviation.
-----------------------------------------------------------*/

WITH M1_RM_feeder_RCA AS
(
    SELECT CASE NTILE(3) OVER(ORDER BY [Machine1.RawMaterialFeederParameter.U.Actual])
            WHEN 1 THEN 'Low'
            WHEN 2 THEN 'Medium'
            WHEN 3 THEN 'High'
        END AS Operating_Range,
        [Machine1.RawMaterialFeederParameter.U.Actual] AS M1_RM_feeder,
         ABS([Stage2.Output.Measurement4.U.Actual]-[Stage2.Output.Measurement4.U.Setpoint]) AS Quality_Deviation
    FROM manufacturing_process_optimization
)

SELECT
    Operating_Range,
    COUNT(*) AS Production_Records,
    ROUND(MIN(M1_RM_feeder),2) AS Min_Value,
    ROUND(MAX(M1_RM_feeder),2) AS Max_Value,
    ROUND(AVG(M1_RM_feeder),2) AS Avg_Value,
    ROUND(AVG(Quality_Deviation),2) AS Avg_Quality_Deviation,
    ROUND(STDEV(Quality_Deviation),2) AS Std_Deviation
FROM M1_RM_feeder_RCA
GROUP BY Operating_Range
ORDER BY CASE Operating_Range
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
END;

/*
Business Insight:
• Stage 2 Measurement 4 quality deviation remains relatively consistent across low, medium and high Machine 1 feeder operating ranges 
(27.61–29.13 units).
• No clear increasing or decreasing trend is observed, suggesting that Machine 1 feeder operating level alone is unlikely to be a 
dominant contributor to the observed quality deviation.
• The relatively similar quality performance across all operating ranges indicates that other process parameters should be investigated 
alongside feeder settings to explain the observed quality variation.
*/

/*-----------------------------------------------------------
Business Objective 4:
Evaluate whether different operating levels of Machine 4 pressure are associated with variation in Stage 2 Measurement 4 quality deviation.
-----------------------------------------------------------*/

WITH M4_Pressure_RCA AS
(
    SELECT CASE NTILE(3) OVER(ORDER BY [Machine4.Pressure.C.Actual])
            WHEN 1 THEN 'Low'
            WHEN 2 THEN 'Medium'
            WHEN 3 THEN 'High'
        END AS Operating_Range,
        [Machine4.Pressure.C.Actual] AS M4_Pressure,
         ABS([Stage2.Output.Measurement4.U.Actual]-[Stage2.Output.Measurement4.U.Setpoint]) AS Quality_Deviation
    FROM manufacturing_process_optimization
)

SELECT
    Operating_Range,
    COUNT(*) AS Production_Records,
    ROUND(MIN(M4_Pressure),2) AS Min_Value,
    ROUND(MAX(M4_Pressure),2) AS Max_Value,
    ROUND(AVG(M4_Pressure),2) AS Avg_Value,
    ROUND(AVG(Quality_Deviation),2) AS Avg_Quality_Deviation,
    ROUND(STDEV(Quality_Deviation),2) AS Std_Deviation
FROM M4_Pressure_RCA

GROUP BY Operating_Range
ORDER BY CASE Operating_Range
            WHEN 'Low' THEN 1
            WHEN 'Medium' THEN 2
            WHEN 'High' THEN 3
END;
/*
Business Insight:
• Average quality deviation increases progressively from the low (27.18) to high (30.44) Machine 4 pressure operating range.
• Higher Machine 4 pressure is associated with more consistent quality performance (Std Dev decreases from 10.44 to 5.14),
  but at a consistently higher deviation level.
• This indicates that elevated Machine 4 pressure may be a potential contributor to increased Stage 2 Measurement 4
  quality deviation and warrants further process optimization.
*/

/*-----------------------------------------------------------
Business Objective 5:
Evaluate whether different operating levels of Machine 1 material flow pressure are associated with variation in Stage 2 Measurement 4 quality deviation.
-----------------------------------------------------------*/

WITH M1_flow_Pressure_RCA AS
(
    SELECT CASE NTILE(3) OVER(ORDER BY [Machine1.MaterialPressure.U.Actual])
            WHEN 1 THEN 'Low'
            WHEN 2 THEN 'Medium'
            WHEN 3 THEN 'High'
        END AS Operating_Range,
        [Machine1.MaterialPressure.U.Actual] AS M1_flow_Pressure,
         ABS([Stage2.Output.Measurement4.U.Actual]-[Stage2.Output.Measurement4.U.Setpoint]) AS Quality_Deviation
    FROM manufacturing_process_optimization
)

SELECT
    Operating_Range,
    COUNT(*) AS Production_Records,
    ROUND(MIN(M1_flow_Pressure),2) AS Min_Value,
    ROUND(MAX(M1_flow_Pressure),2) AS Max_Value,
    ROUND(AVG(M1_flow_Pressure),2) AS Avg_Value,
    ROUND(AVG(Quality_Deviation),2) AS Avg_Quality_Deviation,
    ROUND(STDEV(Quality_Deviation),2) AS Std_Deviation
FROM M1_flow_Pressure_RCA

GROUP BY Operating_Range
ORDER BY CASE Operating_Range
            WHEN 'Low' THEN 1
            WHEN 'Medium' THEN 2
            WHEN 'High' THEN 3
END;
/*
Business Insight:
• Stage 2 Measurement 4 quality deviation decreases from the low to medium operating range and remains nearly unchanged in the
  high operating range.
• No progressive increase in quality deviation is observed with increasing material pressure.
• Machine 1 material pressure does not exhibit a clear monotonic relationship with Stage 2 Measurement 4 quality deviation,
  suggesting it is unlikely to be a dominant standalone root cause.
*/

/*==========================================================
Process driver analysis Summary

The following observations were obtained from SQL-based process driver analysis on the shortlisted high-variability process parameters.

Parameter                    Finding
----------------------------------------------------------
M1 RM Property 3        Strong Positive Association
M4 Pressure             Moderate Positive Association
M1 Motor Current        Weak / Inconsistent Association
M1 Material Pressure    No Positive Association
M1 RM Feeder            No Significant Association

Conclusion:

• Machine 1 Raw Material Property 3 and Machine 4 Pressure emerge as the strongest potential contributors to Stage 2
  Measurement 4 quality deviation.

• The remaining shortlisted parameters exhibit weak or inconsistent relationships and are therefore considered secondary contributors.

These findings will be further validated using predictive machine learning models in Python.
==========================================================*/
