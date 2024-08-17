#WORKUNIT('name', 'hpcc-viz-BarChart');
IMPORT $;
IMPORT STD;
IMPORT Visualizer;

// Count the size of each dataset
dsSizes := DATASET([ {'Adolescent',375,345,720},
                     {'Children', 1372,854,2226},
                     {'Young', 116,266,382},
                     {'Adult', 128,287,415}],
                     {STRING ClassImbalance, INTEGER4 Autistic, INTEGER4 Controlled,INTEGER4 total});

OUTPUT(dsSizes, NAMED('ClassImbalance'));
 
Visualizer.MultiD.Step('Step', /*datasource*/, 'ClassImbalance', /*mappings*/, /*filteredBy*/, /*dermatologyProperties*/ );
