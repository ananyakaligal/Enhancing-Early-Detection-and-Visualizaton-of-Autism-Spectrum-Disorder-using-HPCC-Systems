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
CleanASD := DATASET('~ak::out::asd_cleanedData2', ASD, FLAT);

// Create an index for querying the dataset based on A1 to A10 parameters
ASD_IDX := INDEX(CleanASD, 
                 {A1, A2, A3, A4, A5, A6, A7, A8, A9, A10}, 
                 {CleanASD}, 
                 '~ak::idx::asd::asd_cleanedData2');

// Function to query the ASD dataset and return ASD_traits and Advice
EXPORT Play_query( LookAtPeople, EyeContact,PointToIndicate,PointToShare,PretendPlay,FollowLooking,ComfortSomeone,SpeakFirstWords,SimpleGestures,StareAtNothing) := FUNCTION
    // Perform the query based on the given parameters
    MyASD := OUTPUT(ASD_IDX(A1 = LookAtPeople AND 
                           A2 = EyeContact AND 
                           A3 = PointToIndicate AND 
                           A4 = PointToShare AND 
                           A5 = PretendPlay AND 
                           A6 = FollowLooking AND 
                           A7 = ComfortSomeone AND 
                           A8 = SpeakFirstWords AND 
                           A9 = SimpleGestures AND 
                           A10 = StareAtNothing));

    RETURN MyASD;
END;
