#OPTION('obfuscateOutput',TRUE);
IMPORT $;
IMPORT $, LogisticRegression,ML_Core;

ASDDS := $.File__AllData.ASDDS;

ASDRec:= RECORD
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
   STRING1 Sex;
   STRING1 Jaundice;
   STRING1 Family_mem_with_ASD;
   STRING50 Who_completed_the_test;
   REAL8 Age_Years_Normalized;
   STRING8 ASD_traits;
END;

NewASDDS := PROJECT(ASDDS,ASDRec);
OUTPUT(NewASDDS,NAMED('NewASDDS'));


recn:=RECORD(ASDRec)
UNSIGNED rnd;
END;

tab1:=PROJECT(NewASDDS,TRANSFORM(recn,SELF.rnd:=RANDOM(),SELF:=LEFT));
tab1s:=SORT(tab1,rnd);
OUTPUT(tab1s,NAMED('SORT'));


train:= PROJECT(tab1s[1..3000],ASDRec);
test:=PROJECT(tab1s[3000..3743],ASDRec);
OUTPUT(train,NAMED('train'));
OUTPUT(test,NAMED('test'));
//numeric field matrix conversion

ML_Core.AppendSeqID(train, id, trainid);
ML_Core.AppendSeqID(test, id, testid);

ML_Core.ToField(trainid,trainNF);
ML_Core.ToField(testid,testNF);

indtrainNF:= trainNF(number<16);
deptrainNF:=PROJECT(trainNF(number=16),
                    TRANSFORM(ML_Core.Types.DiscreteField,
                              SELF.number:= 1,
                              SELF:=LEFT));
indtestNF:=testNF(number<16);
deptestNF:=PROJECT(testNF(number=16),
                    TRANSFORM(ML_Core.Types.DiscreteField,
                              SELF.number:=1,
                              SELF:=LEFT));


//OUTPUT(indtrainNF,NAMED('indtrainNF'));
//OUTPUT(deptrainNF,NAMED('deptrainNF'));
//OUTPUT(indtestNF,NAMED('indtestNF'));
//OUTPUT(deptestNF,NAMED('deptestNF'));

mylearner:= LogisticRegression.BinomialLogisticRegression();
mymodel:=mylearner.getModel(indtrainNF,deptrainNF);
mypredict:=mylearner.Classify(mymodel,indtestNF);
OUTPUT(mypredict,NAMED('PREDICT'));


myconfmatrix:=LogisticRegression.Confusion(deptestNF,mypredict);
OUTPUT(myconfmatrix,NAMED('CONFUSION'));

myconfacc:=LogisticRegression.BinomialConfusion(myconfmatrix);
OUTPUT(myconfacc,NAMED('ACCURACY'));


mybeta:=LogisticRegression.ExtractBeta(mymodel);
OUTPUT(mybeta,NAMED('BETAS'));


myscores:=LogisticRegression.LogitScore(mybeta,indtestNF);

OUTPUT(myscores,NAMED('SCORES'));

mydeviance:=LogisticRegression.Deviance_Detail(deptestNF,myscores);
OUTPUT(mydeviance,NAMED('DEVIANCEvalues'));

myaic:=LogisticRegression.Model_Deviance(mydeviance,mybeta);
OUTPUT(myaic,NAMED('DEVIATION'));


