#OPTION('obfuscateOutput',TRUE);

IMPORT $;
IMPORT STD;

//Importing datasets

AdolescentDS := $.File__AllData.AdolescentDS;
//OUTPUT(AdolescentDS,NAMED('Adolescent'));

ChildrenDS := $.File__AllData.ChildrenDS;
//OUTPUT(ChildrenDS,NAMED('Children'));

YoungDS := $.File__AllData.YoungDS;
//OUTPUT(YoungDS,NAMED('Young'));

AdultDS := $.File__AllData.AdultDS;
//OUTPUT(AdultDS,NAMED('Adult'));

AdolescentRec:= RECORD
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
   STRING A1_Advice; 
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

NewAdolescentDS := PROJECT(AdolescentDS,AdolescentRec);
OUTPUT(NewAdolescentDS,NAMED('NewAdolescentDS'));

ChildrenRec:= RECORD
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
   STRING A1_Advice; 
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

NewChildrenDS := PROJECT(ChildrenDS,ChildrenRec);
OUTPUT(NewChildrenDS,NAMED('NewChildrenDS'));


YoungRec:= RECORD
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
   STRING A1_Advice; 
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

NewYoungDS := PROJECT(YoungDS,YoungRec);
OUTPUT(NewYoungDS,NAMED('YoungDS'));


AdultRec:= RECORD
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
   STRING A1_Advice; 
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

NewAdultDS := PROJECT(AdultDS,AdultRec);
OUTPUT(NewAdultDS,NAMED('NewAdultDS'));