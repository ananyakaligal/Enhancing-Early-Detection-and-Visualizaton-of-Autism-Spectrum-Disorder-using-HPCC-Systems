IMPORT $, STD;

UpperIt(STRING txt) := Std.Str.ToUpperCase(txt);

// Define the record structure for ASD data
ASD := RECORD
   UNSIGNED3 A1;
   UNSIGNED3 A2;
   UNSIGNED3 A3;
   UNSIGNED3 A4;
   UNSIGNED3 A5;
   UNSIGNED3 A6;
   UNSIGNED3 A7;
   UNSIGNED3 A8;
   UNSIGNED3 A9;
   UNSIGNED3 A10;
   UNSIGNED3 Age_Years;
   STRING1 Sex;
   STRING50 Ethnicity;
   STRING3 Jaundice;
   STRING3 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   STRING50 ASD_traits;
   STRING255 Advice;
END; 

// Define the dataset
ASDDS := DATASET('~ak::asd_advice', ASD,CSV(HEADING(1)));

// Write the dataset to a new file
WriteASD := OUTPUT(ASDDS,,'~ak::out::asd_cleanedData2',OVERWRITE,NAMED('CleanedASD'));

CleanASD:= DATASET('~ak::out::asd_cleanedData2',ASD,FLAT);

// Create an index for querying the dataset based on A1 to A10 parameters
ASD_IDX := INDEX(CleanASD,{A1, A2, A3, A4, A5, A6, A7, A8, A9, A10}, {CleanASD}, '~ak::idx::asd::asd_cleanedData2');

// Build the index
Build_ASDIDX := BUILD(ASD_IDX,OVERWRITE,NAMED('A1toA2IDX'));

// Execute the actions sequentially
SEQUENTIAL(WriteASD, Build_ASDIDX);

