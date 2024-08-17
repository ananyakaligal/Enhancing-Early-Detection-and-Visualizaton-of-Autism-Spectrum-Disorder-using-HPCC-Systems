#WORKUNIT('name', 'hpcc-viz-ColumnChart');
IMPORT $;
IMPORT STD;
IMPORT Visualizer;

AdolescentDS := $.File__AllData.AdolescentDS;
//OUTPUT(AdolescentDS,NAMED('Adolescent'));

ChildrenDS := $.File__AllData.ChildrenDS;
//OUTPUT(ChildrenDS,NAMED('Children'));

YoungDS := $.File__AllData.YoungDS;
//OUTPUT(YoungDS,NAMED('Young'));

AdultDS := $.File__AllData.AdultDS;
//OUTPUT(AdultDS,NAMED('Adult'));

// Count the size of each dataset
dsSizes := DATASET([ {'Adolescent', COUNT(AdolescentDS)},
                     {'Children', COUNT(ChildrenDS)},
                     {'Young', COUNT(YoungDS)},
                     {'Adult', COUNT(AdultDS)}],
                     {STRING datasetName, INTEGER4 size});

// Output the sizes dataset, giving it a "known" name so the visualization can locate the data
OUTPUT(dsSizes, NAMED('DatasetSizesViz'));

Visualizer.MultiD.column('myChart', /*datasource*/, 'DatasetSizesViz', /*mappings*/, /*filteredBy*/, /*dermatologyProperties*/ );