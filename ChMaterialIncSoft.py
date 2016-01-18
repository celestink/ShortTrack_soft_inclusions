# -*- coding: mbcs -*-
from part import *
from material import *
from section import *
from assembly import *
from step import *
from interaction import *
from load import *
from mesh import *
from optimization import *
from job import *
from sketch import *
from visualization import *
from connectorBehavior import *
incllmat=100000.0
m=[[0,12],[12,12],[24,3],[36,3],[48,3],[60,3],[72,3],[84,3],[96,12],[108,3],[120,3],[132,3],[144,3],[156,3],[168,3]]
#m=[[j+12,k] for j in range(15) for k in [12,12,3,3,3,3,3,3,12,3,3,3,3,3,3]
#nm=12
for p in range(15):
	for k in range(m[p][0],m[p][0]+m[p][1]):

		mdb.ModelFromInputFile(inputFileName=
			'C:\Users\celestink\Documents\TestingStation\models\ShortModIncl\ShortTrack_no_Inclusions/SimTrack1_k_'+str(k)+'.inp'
				, name='SimTrack1_k_'+str(k))
		mdb.models['SimTrack1_k_'+str(k)'].materials['steel inclusion'].elastic.setValues(
				table=((inclmat, 0.3), ))
# Save by celestink on 2015_10_19-13.13.30; build 6.13-4 2014_01_03-19.03.49 126873
		mdb.Job(atTime=None, contactPrint=OFF, description='', echoPrint=OFF, 
			explicitPrecision=SINGLE, getMemoryFromAnalysis=True, historyPrint=OFF, 
			memory=90, memoryUnits=PERCENTAGE, model='SimTrack1_k_'+str(k), modelPrint=OFF, 
			multiprocessingMode=DEFAULT, name='SimTrack1_k_'+str(k), nodalOutputPrecision=
			SINGLE, numCpus=1, numGPUs=0, queue=None, scratch='', type=ANALYSIS, 
			userSubroutine='', waitHours=0, waitMinutes=0)