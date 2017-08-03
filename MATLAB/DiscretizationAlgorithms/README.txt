This file is intended to explain the contents of the MATLAB\DiscretizationAlgorithms folder from the 2017 summer brain project
Authors: Katherine Thai & Luke Wohlford
For questions regarding this software please contact Luke Wohlford at lwohlford@email.arizona.edu

FOLDER CONTENTS
Bin_Methods - contains the 8 binarization methods adopted from GEDTools for MATLAB functionality. NOTE: gallo function does not match GEDTool gallo method.
	    - All methods except for maxxmax and topx simple take in a .csv file directory as an input and will output the binarized .csv data set with 
	      the same root name and "_method" appended.
	    - maxxmax and topx take the X value as a second input
Concat_inorder_2 - contains results of TEDIE analysis of 2-scan concatenations by condition in scans' chronological order (n = 94)
Concat_inorder_4 - contains results of TEDIE analysis of 4-scan concatenations in scans' chronological order (n = 94)
Concat_unordered_2 - contains results of TEDIE analysis of 2-scan concatenations by condition in scans' alphabetical order (n = 94)
Concat_unordered_4 - contains results of TEDIE analysis of 4-scan concatenations in scans' alphabetical order (n = 94)
Data - contains various data sets from preliminary tests of the TEDIE method
Mult_Test - contains results from testing ranges of X values for the maxxmax and topX methods
oldTEDIE - contains a copy of the original TEDIE scripts and files written by Yuezhe Li
simTB_data - contains results of TEDIE analysis of simTB simulated scans (n = 100)
Testing - contains results from testing the MATLAB versions of binarizations against the GEDTool version of binarizations. 

FILES
All_TEDIE_Results.xlsx - contains all the results from the TEDIE analyses performed this summer, each on their own sheets.
diffnumber.txt - provided method names to test multiple X values in maxxmax and topx binarizations.
methods.txt - a required file to run TEDIE on a .csv file, provides the names of the binarization methods to be appended to the file name and performed.

SCRIPTS FOR MODIFIED VERSION OF TEDIE
benchmark.m - synthesizes outputs of prebenchmark.m to return an average Area Between Curves value for a data-set (unchanged from Li)
*****
Use this function to perform TEDIE on a single .csv file:
BinAll.m - uses methods listed in method.txt file to binarize .csv data sets (plus keeping an original set) by strfinding the methods appended from 
	   methods.txt to match a dataset to a binarization method. The binarized sets + original are then fed into the TEDIE analysis.
*****
main_TEDIE.m - if binarized .csv files are appropriately named, along with a file in the form of  "root_original", then the TEDIE analysis is 
	       performed for a set of files pertaining to one original dataset in a given directory. This is the script that produces the .mat objects
	       "allRes" and "posRes" containing all TEDIE results for the methods and the results for methods that passed the signtest, respectively.
prebenchmark.m - calculates the ABC value given two consecutive measurements of both normalized original data and binarized data
runall.m - if the alldata.m file is appropriately constructed in main_TEDIE.m or RunMult_TEDIE.m, then the TEDIE analysis is performed for each of the 
	   methods in the alldata.m file. The results are put in a MATLAB table and that table is returned. 
RunMult_BinAll.m - a version of BinAll.m adapted to perform TEDIE analysis on multiple .csv files in a directory. 
*****
Use this function to perform TEDIE analysis on multiple .csv files in a directory:
RunMult_main.m - Takes all .csv files in a directory, binarizes them according to the methods specified in methods.txt, then returns the binarized 
		 datasets and the TEDIE results to a folder named for the root of the .csv file.
***
RunMult_runall.m - a version of runall.m adapted to perform TEDIE analysis on multiple .csv files in a directory.
RunMult_TEDIE.m - a version of main_TEDIE.m adapted to perform TEDIE analysis on multiple .csv files in a directory. 
TEDIE.m - performs TEDIE analysis on an alldata.mat file, as described in runall.m. Returns a table of the TEDIE results.

SUPPLEMENTARY SCRIPTS

testMultXValues.m - allowed us to test multiple X values in the maxxmax or topx methods, given that these files were already produced by the BinAll.m
		    script or writecsv4bin using the methods.txt file (or an alternate text file) to specify the methods and X values.
writecsv4bin.m - simply produces copies of original .csv files in a directory with "_XXX.csv" appended according to the methods specified in the 
		 diffnumbers.txt file.
nounderscore.m - having any underscores in the root name of .csv files being binarized in RunMult_main.m or BinAll.m will result in an error, so this 
		 function will remove (or replace with hyphens if specified) any underscores in .csv file names in the specified directory. 


