/*===========================================================
PROJECT : Manufacturing Quality Optimization

FILE    : 03_Process_Analysis.sql

OBJECTIVE:
Analyse critical manufacturing process parameters to identify
potential causes of quality variation.

AUTHOR  : Vaibhav Sharma
===========================================================*/

USE Manufacturing_Quality_Optimization;
GO

/*-----------------------------------------------------------
Business Objective 1: Evaluate the stability of ambient operating conditions before production begins.
-----------------------------------------------------------*/

SELECT 'Ambient Humidity' AS Parameter,
MAX([AmbientConditions.AmbientHumidity.U.Actual]) AS Maximum,
ROUND(AVG([AmbientConditions.AmbientHumidity.U.Actual]),2) AS Average,
MIN([AmbientConditions.AmbientHumidity.U.Actual]) AS Minimum,
ROUND(STDEV([AmbientConditions.AmbientHumidity.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([AmbientConditions.AmbientHumidity.U.Actual])/AVG([AmbientConditions.AmbientHumidity.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'Ambient Temperature' AS Parameter,
MAX([AmbientConditions.AmbientTemperature.U.Actual]) AS Maximum,
ROUND(AVG([AmbientConditions.AmbientTemperature.U.Actual]),2) AS Average,
MIN([AmbientConditions.AmbientTemperature.U.Actual]) AS Minimum,
ROUND(STDEV([AmbientConditions.AmbientTemperature.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([AmbientConditions.AmbientTemperature.U.Actual])/AVG([AmbientConditions.AmbientTemperature.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:

• Ambient temperature remained highly stable (CV = 1.57%), while ambient humidity showed comparatively higher variation (CV = 7.76%).

• Overall, environmental conditions remained reasonably controlled, making process parameters more likely contributors to quality
  deviations than ambient conditions.
*/

/*-----------------------------------------------------------
Business Objective 2: Assess the consistency of incoming raw material properties before entering the manufacturing process.
-----------------------------------------------------------*/

SELECT 'M1_RM_Property 1' AS Property,
MAX([Machine1.RawMaterial.Property1]) AS Maximum,
ROUND(AVG([Machine1.RawMaterial.Property1]),2) AS Average,
MIN([Machine1.RawMaterial.Property1]) AS Minimum,
ROUND(STDEV([Machine1.RawMaterial.Property1]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.RawMaterial.Property1])/AVG([Machine1.RawMaterial.Property1]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M1_RM_Property 2',
MAX([Machine1.RawMaterial.Property2]) AS Maximum,
ROUND(AVG([Machine1.RawMaterial.Property2]),2) AS Average,
MIN([Machine1.RawMaterial.Property2]) AS Minimum,
ROUND(STDEV([Machine1.RawMaterial.Property2]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.RawMaterial.Property2])/AVG([Machine1.RawMaterial.Property2]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M1_RM_Property 3',
MAX([Machine1.RawMaterial.Property3]) AS Maximum,
ROUND(AVG([Machine1.RawMaterial.Property3]),2) AS Average,
MIN([Machine1.RawMaterial.Property3]) AS Minimum,
ROUND(STDEV([Machine1.RawMaterial.Property3]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.RawMaterial.Property3])/AVG([Machine1.RawMaterial.Property3]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M1_RM_Property 4',
MAX([Machine1.RawMaterial.Property4]) AS Maximum,
ROUND(AVG([Machine1.RawMaterial.Property4]),2) AS Average,
MIN([Machine1.RawMaterial.Property4]) AS Minimum,
ROUND(STDEV([Machine1.RawMaterial.Property4]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.RawMaterial.Property4])/AVG([Machine1.RawMaterial.Property4]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2_RM_Property 1',
MAX([Machine2.RawMaterial.Property1]) AS Maximum,
ROUND(AVG([Machine2.RawMaterial.Property1]),2) AS Average,
MIN([Machine2.RawMaterial.Property1]) AS Minimum,
ROUND(STDEV([Machine2.RawMaterial.Property1]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.RawMaterial.Property1])/AVG([Machine2.RawMaterial.Property1]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2_RM_Property 2',
MAX([Machine2.RawMaterial.Property2]) AS Maximum,
ROUND(AVG([Machine2.RawMaterial.Property2]),2) AS Average,
MIN([Machine2.RawMaterial.Property2]) AS Minimum,
ROUND(STDEV([Machine2.RawMaterial.Property2]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.RawMaterial.Property2])/AVG([Machine2.RawMaterial.Property2]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2_RM_Property 3',
MAX([Machine2.RawMaterial.Property3]) AS Maximum,
ROUND(AVG([Machine2.RawMaterial.Property3]),2) AS Average,
MIN([Machine2.RawMaterial.Property3]) AS Minimum,
ROUND(STDEV([Machine2.RawMaterial.Property3]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.RawMaterial.Property3])/AVG([Machine2.RawMaterial.Property3]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2_RM_Property 4',
MAX([Machine2.RawMaterial.Property4]) AS Maximum,
ROUND(AVG([Machine2.RawMaterial.Property4]),2) AS Average,
MIN([Machine2.RawMaterial.Property4]) AS Minimum,
ROUND(STDEV([Machine2.RawMaterial.Property4]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.RawMaterial.Property4])/AVG([Machine2.RawMaterial.Property4]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3_RM_Property 1',
MAX([Machine3.RawMaterial.Property1]) AS Maximum,
ROUND(AVG([Machine3.RawMaterial.Property1]),2) AS Average,
MIN([Machine3.RawMaterial.Property1]) AS Minimum,
ROUND(STDEV([Machine3.RawMaterial.Property1]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.RawMaterial.Property1])/AVG([Machine3.RawMaterial.Property1]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3_RM_Property 2',
MAX([Machine3.RawMaterial.Property2]) AS Maximum,
ROUND(AVG([Machine3.RawMaterial.Property2]),2) AS Average,
MIN([Machine3.RawMaterial.Property2]) AS Minimum,
ROUND(STDEV([Machine3.RawMaterial.Property2]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.RawMaterial.Property2])/AVG([Machine3.RawMaterial.Property2]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3_RM_Property 3',
MAX([Machine3.RawMaterial.Property3]) AS Maximum,
ROUND(AVG([Machine3.RawMaterial.Property3]),2) AS Average,
MIN([Machine3.RawMaterial.Property3]) AS Minimum,
ROUND(STDEV([Machine3.RawMaterial.Property3]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.RawMaterial.Property3])/AVG([Machine3.RawMaterial.Property3]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3_RM_Property 4',
MAX([Machine3.RawMaterial.Property4]) AS Maximum,
ROUND(AVG([Machine3.RawMaterial.Property4]),2) AS Average,
MIN([Machine3.RawMaterial.Property4]) AS Minimum,
ROUND(STDEV([Machine3.RawMaterial.Property4]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.RawMaterial.Property4])/AVG([Machine3.RawMaterial.Property4]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:

• Machine 1 Raw Material Property 3 shows the highest variability (CV = 13.31%), indicating comparatively inconsistent incoming material.

• Machine 2 raw material properties remain highly stable (CV below 3.5%), suggesting consistent material quality.

• Machine 3 Property 2 (CV = 7.96%) should be monitored as it exhibits relatively higher variation than the remaining properties.

*/

/*-----------------------------------------------------------
Business Objective 3: Evaluate the stability of raw material feed supplied to the production line.
-----------------------------------------------------------*/
SELECT 'M1_RM_Feeder_Property ' AS Parameter,
MAX([Machine1.RawMaterialFeederParameter.U.Actual]) AS Maximum,
ROUND(AVG([Machine1.RawMaterialFeederParameter.U.Actual]),2) AS Average,
MIN([Machine1.RawMaterialFeederParameter.U.Actual]) AS Minimum,
ROUND(STDEV([Machine1.RawMaterialFeederParameter.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.RawMaterialFeederParameter.U.Actual])/AVG([Machine1.RawMaterialFeederParameter.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL
SELECT 'M2_RM_Feeder_Property ',
MAX([Machine2.RawMaterialFeederParameter.U.Actual]) AS Maximum,
ROUND(AVG([Machine2.RawMaterialFeederParameter.U.Actual]),2) AS Average,
MIN([Machine2.RawMaterialFeederParameter.U.Actual]) AS Minimum,
ROUND(STDEV([Machine2.RawMaterialFeederParameter.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.RawMaterialFeederParameter.U.Actual])/AVG([Machine2.RawMaterialFeederParameter.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL
SELECT 'M3_RM_Feeder_Property ',
MAX([Machine3.RawMaterialFeederParameter.U.Actual]) AS Maximum,
ROUND(AVG([Machine3.RawMaterialFeederParameter.U.Actual]),2) AS Average,
MIN([Machine3.RawMaterialFeederParameter.U.Actual]) AS Minimum,
ROUND(STDEV([Machine3.RawMaterialFeederParameter.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.RawMaterialFeederParameter.U.Actual])/AVG([Machine3.RawMaterialFeederParameter.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;


/*
Business Insight:
• All three raw material feeders exhibit comparable relative variability (CV ≈ 7.5–7.7%), indicating similar proportional process stability.

• However, Machine 1 feeder shows the largest absolute variation (Std Dev = 95.85), substantially higher than Machines 2 and 3.
*/

/*-----------------------------------------------------------
Business Objective 4: Evaluate temperature stability across all heating zones throughout the manufacturing process.
-----------------------------------------------------------*/
SELECT 'M1 ' AS Machine,'Zone_1' as Temp_zone,
MAX([Machine1.Zone1Temperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine1.Zone1Temperature.C.Actual]),2) AS Average,
MIN([Machine1.Zone1Temperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine1.Zone1Temperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.Zone1Temperature.C.Actual])/AVG([Machine1.Zone1Temperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M1 ' AS Machine,'Zone_2' as Temp_zone,
MAX([Machine1.Zone2Temperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine1.Zone2Temperature.C.Actual]),2) AS Average,
MIN([Machine1.Zone2Temperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine1.Zone2Temperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.Zone2Temperature.C.Actual])/AVG([Machine1.Zone2Temperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2 ' AS Machine,'Zone_1' as Temp_zone,
MAX([Machine2.Zone1Temperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine2.Zone1Temperature.C.Actual]),2) AS Average,
MIN([Machine2.Zone1Temperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine2.Zone1Temperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.Zone1Temperature.C.Actual])/AVG([Machine2.Zone1Temperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2 ' AS Machine,'Zone_2' as Temp_zone,
MAX([Machine2.Zone2Temperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine2.Zone2Temperature.C.Actual]),2) AS Average,
MIN([Machine2.Zone2Temperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine2.Zone2Temperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.Zone2Temperature.C.Actual])/AVG([Machine2.Zone2Temperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3 ' AS Machine,'Zone_1' as Temp_zone,
MAX([Machine3.Zone1Temperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine3.Zone1Temperature.C.Actual]),2) AS Average,
MIN([Machine3.Zone1Temperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine3.Zone1Temperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.Zone1Temperature.C.Actual])/AVG([Machine3.Zone1Temperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3 ' AS Machine,'Zone_2' as Temp_zone,
MAX([Machine3.Zone2Temperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine3.Zone2Temperature.C.Actual]),2) AS Average,
MIN([Machine3.Zone2Temperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine3.Zone2Temperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.Zone2Temperature.C.Actual])/AVG([Machine3.Zone2Temperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:

• Heating zone temperatures remain highly stable across Machines 1–3, with all temperature sensors exhibiting CV values below 1%.

• The controlled temperature profile indicates that heating is unlikely to be a primary source of process variation.
*/

/*-----------------------------------------------------------
Business Objective 5: Assess motor operating stability during production.
-----------------------------------------------------------*/
SELECT 'M1 ' AS Machine,'Motor_Ampere' as Parameter,
MAX([Machine1.MotorAmperage.U.Actual]) AS Maximum,
ROUND(AVG([Machine1.MotorAmperage.U.Actual]),2) AS Average,
MIN([Machine1.MotorAmperage.U.Actual]) AS Minimum,
ROUND(STDEV([Machine1.MotorAmperage.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.MotorAmperage.U.Actual])/AVG([Machine1.MotorAmperage.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2 ','Motor_Ampere',
MAX([Machine2.MotorAmperage.U.Actual]) AS Maximum,
ROUND(AVG([Machine2.MotorAmperage.U.Actual]),2) AS Average,
MIN([Machine2.MotorAmperage.U.Actual]) AS Minimum,
ROUND(STDEV([Machine2.MotorAmperage.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.MotorAmperage.U.Actual])/AVG([Machine2.MotorAmperage.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3 ','Motor_Ampere',
MAX([Machine3.MotorAmperage.U.Actual]) AS Maximum,
ROUND(AVG([Machine3.MotorAmperage.U.Actual]),2) AS Average,
MIN([Machine3.MotorAmperage.U.Actual]) AS Minimum,
ROUND(STDEV([Machine3.MotorAmperage.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.MotorAmperage.U.Actual])/AVG([Machine3.MotorAmperage.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M1 ' AS Machine,'Motor_RPM',
MAX([Machine1.MotorRPM.C.Actual]) AS Maximum,
ROUND(AVG([Machine1.MotorRPM.C.Actual]),2) AS Average,
MIN([Machine1.MotorRPM.C.Actual]) AS Minimum,
ROUND(STDEV([Machine1.MotorRPM.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.MotorRPM.C.Actual])/AVG([Machine1.MotorRPM.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2 ','Motor_RPM',
MAX([Machine2.MotorRPM.C.Actual]) AS Maximum,
ROUND(AVG([Machine2.MotorRPM.C.Actual]),2) AS Average,
MIN([Machine2.MotorRPM.C.Actual]) AS Minimum,
ROUND(STDEV([Machine2.MotorRPM.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.MotorRPM.C.Actual])/AVG([Machine2.MotorRPM.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3 ','Motor_RPM',
MAX([Machine3.MotorRPM.C.Actual]) AS Maximum,
ROUND(AVG([Machine3.MotorRPM.C.Actual]),2) AS Average,
MIN([Machine3.MotorRPM.C.Actual]) AS Minimum,
ROUND(STDEV([Machine3.MotorRPM.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.MotorRPM.C.Actual])/AVG([Machine3.MotorRPM.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:
• Machine 1 motor current (CV = 7.86%) and RPM (CV = 5.74%) show the highest operating variation, indicating comparatively
less stable motor performance.
• Machines 2 and 3 exhibit significantly lower variability,suggesting more stable motor operations during production.
*/

/*-----------------------------------------------------------
Business Objective 6: Evaluate the stability of material flow conditions during processing.
-----------------------------------------------------------*/
SELECT 'M1 ' AS Machine,'Pressure' as Material_Parameter,
MAX([Machine1.MaterialPressure.U.Actual]) AS Maximum,
ROUND(AVG([Machine1.MaterialPressure.U.Actual]),2) AS Average,
MIN([Machine1.MaterialPressure.U.Actual]) AS Minimum,
ROUND(STDEV([Machine1.MaterialPressure.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.MaterialPressure.U.Actual])/AVG([Machine1.MaterialPressure.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2 ','Pressure',
MAX([Machine2.MaterialPressure.U.Actual]) AS Maximum,
ROUND(AVG([Machine2.MaterialPressure.U.Actual]),2) AS Average,
MIN([Machine2.MaterialPressure.U.Actual]) AS Minimum,
ROUND(STDEV([Machine2.MaterialPressure.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.MaterialPressure.U.Actual])/AVG([Machine2.MaterialPressure.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3 ','Pressure',
MAX([Machine3.MaterialPressure.U.Actual]) AS Maximum,
ROUND(AVG([Machine3.MaterialPressure.U.Actual]),2) AS Average,
MIN([Machine3.MaterialPressure.U.Actual]) AS Minimum,
ROUND(STDEV([Machine3.MaterialPressure.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.MaterialPressure.U.Actual])/AVG([Machine3.MaterialPressure.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M1 ','Temperature',
MAX([Machine1.MaterialTemperature.U.Actual]) AS Maximum,
ROUND(AVG([Machine1.MaterialTemperature.U.Actual]),2) AS Average,
MIN([Machine1.MaterialTemperature.U.Actual]) AS Minimum,
ROUND(STDEV([Machine1.MaterialTemperature.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.MaterialTemperature.U.Actual])/AVG([Machine1.MaterialTemperature.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2 ','Temperature',
MAX([Machine2.MaterialTemperature.U.Actual]) AS Maximum,
ROUND(AVG([Machine2.MaterialTemperature.U.Actual]),2) AS Average,
MIN([Machine2.MaterialTemperature.U.Actual]) AS Minimum,
ROUND(STDEV([Machine2.MaterialTemperature.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.MaterialTemperature.U.Actual])/AVG([Machine2.MaterialTemperature.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3 ','Temperature',
MAX([Machine3.MaterialTemperature.U.Actual]) AS Maximum,
ROUND(AVG([Machine3.MaterialTemperature.U.Actual]),2) AS Average,
MIN([Machine3.MaterialTemperature.U.Actual]) AS Minimum,
ROUND(STDEV([Machine3.MaterialTemperature.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.MaterialTemperature.U.Actual])/AVG([Machine3.MaterialTemperature.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:
• Machine 1 material pressure shows the highest variability (CV = 5.01%), indicating greater fluctuations in material flow.
• Material temperatures remain well controlled across all machines (CV below 3%), suggesting consistent thermal conditions
during material transfer.
*/

/*-----------------------------------------------------------
Business Objective 7: Compare exit temperature consistency across all production machines
-----------------------------------------------------------*/

SELECT 'M1' AS Machine,'Temp_exit' AS Parameter,
MAX([Machine1.ExitZoneTemperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine1.ExitZoneTemperature.C.Actual]),2) AS Average,
MIN([Machine1.ExitZoneTemperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine1.ExitZoneTemperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine1.ExitZoneTemperature.C.Actual])/AVG([Machine1.ExitZoneTemperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M2','Temp_exit',
MAX([Machine2.ExitZoneTemperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine2.ExitZoneTemperature.C.Actual]),2) AS Average,
MIN([Machine2.ExitZoneTemperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine2.ExitZoneTemperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine2.ExitZoneTemperature.C.Actual])/AVG([Machine2.ExitZoneTemperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M3','Temp_exit',
MAX([Machine3.ExitZoneTemperature.C.Actual]) AS Maximum,
ROUND(AVG([Machine3.ExitZoneTemperature.C.Actual]),2) AS Average,
MIN([Machine3.ExitZoneTemperature.C.Actual]) AS Minimum,
ROUND(STDEV([Machine3.ExitZoneTemperature.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine3.ExitZoneTemperature.C.Actual])/AVG([Machine3.ExitZoneTemperature.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M4','Temp_exit',
MAX([Machine4.ExitTemperature.U.Actual]) AS Maximum,
ROUND(AVG([Machine4.ExitTemperature.U.Actual]),2) AS Average,
MIN([Machine4.ExitTemperature.U.Actual]) AS Minimum,
ROUND(STDEV([Machine4.ExitTemperature.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.ExitTemperature.U.Actual])/AVG([Machine4.ExitTemperature.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_exit',
MAX([Machine5.ExitTemperature.U.Actual]) AS Maximum,
ROUND(AVG([Machine5.ExitTemperature.U.Actual]),2) AS Average,
MIN([Machine5.ExitTemperature.U.Actual]) AS Minimum,
ROUND(STDEV([Machine5.ExitTemperature.U.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.ExitTemperature.U.Actual])/AVG([Machine5.ExitTemperature.U.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:
• Machines 4 and 5 exhibit substantially higher exit temperature variation, with Machine 4 showing the highest instability
(CV = 12.64%).
• Machines 1–3 maintain relatively stable exit temperatures, indicating more consistent downstream thermal control.
*/

/*-----------------------------------------------------------
Business Objective 8: Assess the stability of heating temperatures in Machines 4 and 5, along with the pressure stability of Machine 4.
-----------------------------------------------------------*/

SELECT 'M4' AS Machine,'Temp_1' AS Parameter,
MAX([Machine4.Temperature1.C.Actual]) AS Maximum,
ROUND(AVG([Machine4.Temperature1.C.Actual]),2) AS Average,
MIN([Machine4.Temperature1.C.Actual]) AS Minimum,
ROUND(STDEV([Machine4.Temperature1.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.Temperature1.C.Actual])/AVG([Machine4.Temperature1.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M4','Temp_2',
MAX([Machine4.Temperature2.C.Actual]) AS Maximum,
ROUND(AVG([Machine4.Temperature2.C.Actual]),2) AS Average,
MIN([Machine4.Temperature2.C.Actual]) AS Minimum,
ROUND(STDEV([Machine4.Temperature2.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.Temperature2.C.Actual])/AVG([Machine4.Temperature2.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M4','Pressure',
MAX([Machine4.Pressure.C.Actual]) AS Maximum,
ROUND(AVG([Machine4.Pressure.C.Actual]),2) AS Average,
MIN([Machine4.Pressure.C.Actual]) AS Minimum,
ROUND(STDEV([Machine4.Pressure.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.Pressure.C.Actual])/AVG([Machine4.Pressure.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M4','Temp_3',
MAX([Machine4.Temperature3.C.Actual]) AS Maximum,
ROUND(AVG([Machine4.Temperature3.C.Actual]),2) AS Average,
MIN([Machine4.Temperature3.C.Actual]) AS Minimum,
ROUND(STDEV([Machine4.Temperature3.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.Temperature3.C.Actual])/AVG([Machine4.Temperature3.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M4','Temp_4',
MAX([Machine4.Temperature4.C.Actual]) AS Maximum,
ROUND(AVG([Machine4.Temperature4.C.Actual]),2) AS Average,
MIN([Machine4.Temperature4.C.Actual]) AS Minimum,
ROUND(STDEV([Machine4.Temperature4.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.Temperature4.C.Actual])/AVG([Machine4.Temperature4.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M4','Temp_5',
MAX([Machine4.Temperature5.C.Actual]) AS Maximum,
ROUND(AVG([Machine4.Temperature5.C.Actual]),2) AS Average,
MIN([Machine4.Temperature5.C.Actual]) AS Minimum,
ROUND(STDEV([Machine4.Temperature5.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine4.Temperature5.C.Actual])/AVG([Machine4.Temperature5.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_1',
MAX([Machine5.Temperature1.C.Actual]) AS Maximum,
ROUND(AVG([Machine5.Temperature1.C.Actual]),2) AS Average,
MIN([Machine5.Temperature1.C.Actual]) AS Minimum,
ROUND(STDEV([Machine5.Temperature1.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.Temperature1.C.Actual])/AVG([Machine5.Temperature1.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_2',
MAX([Machine5.Temperature2.C.Actual]) AS Maximum,
ROUND(AVG([Machine5.Temperature2.C.Actual]),2) AS Average,
MIN([Machine5.Temperature2.C.Actual]) AS Minimum,
ROUND(STDEV([Machine5.Temperature2.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.Temperature2.C.Actual])/AVG([Machine5.Temperature2.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_3',
MAX([Machine5.Temperature3.C.Actual]) AS Maximum,
ROUND(AVG([Machine5.Temperature3.C.Actual]),2) AS Average,
MIN([Machine5.Temperature3.C.Actual]) AS Minimum,
ROUND(STDEV([Machine5.Temperature3.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.Temperature3.C.Actual])/AVG([Machine5.Temperature3.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_4',
MAX([Machine5.Temperature4.C.Actual]) AS Maximum,
ROUND(AVG([Machine5.Temperature4.C.Actual]),2) AS Average,
MIN([Machine5.Temperature4.C.Actual]) AS Minimum,
ROUND(STDEV([Machine5.Temperature4.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.Temperature4.C.Actual])/AVG([Machine5.Temperature4.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_5',
MAX([Machine5.Temperature5.C.Actual]) AS Maximum,
ROUND(AVG([Machine5.Temperature5.C.Actual]),2) AS Average,
MIN([Machine5.Temperature5.C.Actual]) AS Minimum,
ROUND(STDEV([Machine5.Temperature5.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.Temperature5.C.Actual])/AVG([Machine5.Temperature5.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization

UNION ALL

SELECT 'M5','Temp_6',
MAX([Machine5.Temperature6.C.Actual]) AS Maximum,
ROUND(AVG([Machine5.Temperature6.C.Actual]),2) AS Average,
MIN([Machine5.Temperature6.C.Actual]) AS Minimum,
ROUND(STDEV([Machine5.Temperature6.C.Actual]),2) AS Std_Dev,
ROUND(100*STDEV([Machine5.Temperature6.C.Actual])/AVG([Machine5.Temperature5.C.Actual]),2) AS Coeff_of_Varaition_percent
FROM manufacturing_process_optimization;

/*
Business Insight:

• Heating temperatures in Machines 4 and 5 remain highly stable, with most temperature sensors exhibiting CV values below 1.2%.

• Machine 4 pressure shows comparatively higher variation (CV = 5.46%) than its heating temperatures, indicating pressure
control may require closer monitoring.

• Machine 5 demonstrates excellent thermal stability, with all temperature sensors exhibiting CV values below 0.7%.
*/