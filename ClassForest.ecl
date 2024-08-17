IMPORT $;
IMPORT ML_Core.Preprocessing;
IMPORT ML_Core;
IMPORT LearningTrees AS LT;
IMPORT ML_Core.Discretize;

DiscreteField := ML_Core.Types.DiscreteField;
NumericField := ML_Core.Types.NumericField;

// Load the dataset
ASDDS := $.File__AllData.ASDDS;

// Define the record structure for the dataset
ASDRec := RECORD
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
    REAL8 Sex;
    REAL8 Jaundice;
    REAL8  Family_mem_with_ASD;
    REAL8 Who_completed_the_test;
    REAL8 Age_Years_Normalized;
    REAL8 ASD_traits;
END;

recn:=RECORD(ASDRec)
UNSIGNED rnd;
END;

// Project the dataset into the defined record structure
NewASDDS := PROJECT(ASDDS, ASDRec);
OUTPUT(NewASDDS, NAMED('NewASDDS'));

tab1:=PROJECT(ASDDS,TRANSFORM(recn,SELF.rnd:=RANDOM(),SELF:=LEFT));
tab1s:=SORT(tab1,rnd);
//OUTPUT(tab1,NAMED('tab1'));
//OUTPUT(tab1s,NAMED('tab1SORT'));

train := PROJECT(tab1s[1..2500], ASDRec);
test := PROJECT(tab1s[2501..3743], ASDRec);
//OUTPUT(train, NAMED('train'));
//OUTPUT(test, NAMED('test'));

// Append sequential IDs to the training and testing datasets
ML_Core.AppendSeqID(train, id, trainid);
ML_Core.AppendSeqID(test, id, testid);

// Output the datasets to verify the sequential IDs
OUTPUT(trainid, NAMED('Train'));
OUTPUT(testid, NAMED('Test'));

ML_Core.ToField(trainid,trainNF);
ML_Core.ToField(testid,testNF);
OUTPUT(trainNF, NAMED('trainNF'));
OUTPUT(testNF, NAMED('testNF'));

indtrainData:= trainNF(number<16);
deptrainData:=PROJECT(trainNF(number=16),
                    TRANSFORM(RECORDOF(left),
                              SELF.number:= 1,
                              SELF:=LEFT));
indtestData:=testNF(number<16);
deptestData:=PROJECT(testNF(number=16),
                    TRANSFORM(RECORDOF(left),
                              SELF.number:=1,
                              SELF:=LEFT));

indtrainData;
deptrainData;
indtestData;
deptestData;

//Convert the NumericField records for the dependent data containing class labels into DiscreteField records
depTrainDataDF := Discretize.ByRounding(depTrainData);
depTestDataDF := Discretize.ByRounding(depTestData);
		OUTPUT(depTrainDataDF,NAMED('depTrainDataDF'));
		OUTPUT(depTestDataDF,NAMED('depTestDataDF'));
    
learner := LT.ClassificationForest();
modelC := learner.GetModel(indTrainData, depTrainDataDF); // *second param uses the DiscreteField dataset
predictedClasses := learner.Classify(modelC, indTestData);
assesmentC := ML_Core.Analysis.Classification.Accuracy(predictedClasses, depTestDataDF); // Both params are DF dataset
		OUTPUT(assesmentC,NAMED('assesmentC'));

fi := learner.FeatureImportance(modelC);
		OUTPUT(fi,NAMED('Feature_Importance'));
confusion := learner.ConfusionMatrix(modelC, depTestDataDF, indTestData);
		OUTPUT(confusion,NAMED('Confusion_matrix'));    