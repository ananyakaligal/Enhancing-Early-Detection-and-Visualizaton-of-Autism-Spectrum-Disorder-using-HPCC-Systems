EXPORT File__AllData := MODULE

EXPORT adolescent := RECORD
   REAL8 slno,
   REAL8 A1;
   REAL8 A2;
   REAL8 A3;
   REAL8 A4;
   REAL8 A5;
   REAL8 A6;
   REAL8 A7;
   REAL8 A8;
   REAL8 A9;
   REAL8 A10;
   REAL8 Age_Years;
   STRING1 Sex;
   STRING50 Ethnicity;
   STRING1 Jaundice;
   STRING1 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   STRING8 ASD_traits;
   STRING A1_Advice;           // Updated advice columns to STRING
STRING A2_Advice;
STRING A3_Advice;
STRING A4_Advice;
STRING A5_Advice;
STRING A6_Advice;
STRING A7_Advice;
STRING A8_Advice;
STRING A9_Advice;
STRING A10_Advice;
STRING Advice;   

END; 
EXPORT AdolescentDS := DATASET('~ak::adolescent_asd_final.csv',adolescent,CSV(HEADING(1)));

EXPORT children := RECORD
   REAL8 slno,
   REAL8 A1;
   REAL8 A2;
   REAL8 A3;
   REAL8 A4;
   REAL8 A5;
   REAL8 A6;
   REAL8 A7;
   REAL8 A8;
   REAL8 A9;
   REAL8 A10;
   REAL8 Age_Years;
   STRING1 Sex;
   STRING50 Ethnicity;
   STRING1 Jaundice;
   STRING1 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   STRING8 ASD_traits;
   STRING A1_Advice;           // Updated advice columns to STRING
STRING A2_Advice;
STRING A3_Advice;
STRING A4_Advice;
STRING A5_Advice;
STRING A6_Advice;
STRING A7_Advice;
STRING A8_Advice;
STRING A9_Advice;
STRING A10_Advice;
STRING Advice;   

END; 
EXPORT ChildrenDS := DATASET('~ak::children_asd_final.csv',children,CSV(HEADING(1)));

EXPORT young := RECORD
   REAL8 slno,
   REAL8 A1;
   REAL8 A2;
   REAL8 A3;
   REAL8 A4;
   REAL8 A5;
   REAL8 A6;
   REAL8 A7;
   REAL8 A8;
   REAL8 A9;
   REAL8 A10;
   REAL8 Age_Years;
   STRING1 Sex;
   STRING50 Ethnicity;
   STRING1 Jaundice;
   STRING1 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   STRING8 ASD_traits;
   STRING A1_Advice;           // Updated advice columns to STRING
STRING A2_Advice;
STRING A3_Advice;
STRING A4_Advice;
STRING A5_Advice;
STRING A6_Advice;
STRING A7_Advice;
STRING A8_Advice;
STRING A9_Advice;
STRING A10_Advice;
STRING Advice;   

END; 
EXPORT YoungDS := DATASET('~ak::young_asd_final.csv',young,CSV(HEADING(1)));

EXPORT adult := RECORD
   REAL8 slno,
   REAL8 A1;
   REAL8 A2;
   REAL8 A3;
   REAL8 A4;
   REAL8 A5;
   REAL8 A6;
   REAL8 A7;
   REAL8 A8;
   REAL8 A9;
   REAL8 A10;
   REAL8 Age_Years;
   STRING1 Sex;
   STRING50 Ethnicity;
   STRING1 Jaundice;
   STRING1 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   STRING8 ASD_traits;
   STRING A1_Advice;           // Updated advice columns to STRING
STRING A2_Advice;
STRING A3_Advice;
STRING A4_Advice;
STRING A5_Advice;
STRING A6_Advice;
STRING A7_Advice;
STRING A8_Advice;
STRING A9_Advice;
STRING A10_Advice;
STRING Advice;   

END; 
EXPORT AdultDS := DATASET('~ak::adult_asd_final.csv',adult,CSV(HEADING(1)));

EXPORT ASD := RECORD
   REAL8 slno,
   REAL8 A1;
   REAL8 A2;
   REAL8 A3;
   REAL8 A4;
   REAL8 A5;
   REAL8 A6;
   REAL8 A7;
   REAL8 A8;
   REAL8 A9;
   REAL8 A10;
   REAL8 Age_Years;
   STRING1 Sex;
   STRING1 Jaundice;
   STRING1 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   STRING8 ASD_traits;
   STRING Advice;
   REAL8 Age_Years_Normalized;

END; 
EXPORT ASDDS := DATASET('~ak::asd_final2.csv',ASD,CSV(HEADING(1)));

END;