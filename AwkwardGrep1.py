#To search and edit substitution per site rate files for input into mathematica.

import sys
import re 
import os

for MyArg in sys.argv:
	print MyArg
	
Usage="""
To find and replace specific strings of text in substitution per site rate files which
are output from TAPIR. """

PSGDirectory = "/Users/Princess/Documents/Research/Acanthomorpha/Manuscript2/Analyses/SignalNoise_TESTFOLDER/"

if len(sys.argv)<5000:
	#print Usage
  for path, dirs, files in os.walk(PSGDirectory):
    print path
    print dirs
    print files

  def process(filename):
	f = open("filename", "r")
	f.close()
	f= open("filenname", "w")
	
        return re.compile(ur'(.)(\D\D\D\D\D..........)')
 
  for root, dirs, files in os.walk(PSGDirectory):
 	for filename in files:
 		fullpath = os.path.join(root,filename)
 		print process (fullpath)
 		
