#!/usr/bin/python

import sys
import argparse
from collections import defaultdict

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", help = "Input list")
parser.add_argument("-o", "--output", help = "Output file")
options = parser.parse_args()

### store windown in dictionary 
dict_reg = defaultdict(dict)
### store table name
list_file = []
with open(options.input) as input_file:
    for line in input_file:
        line = line.rstrip()
        list_file.append(line)
        with open(line) as meth_file:
            for methl in meth_file:
	        if methl.startswith("#"):
		    continue
                methl = methl.rstrip()
                ele = methl.split("\t")
                win_key = '\t'.join(ele[0:3])
                #print '\t'.join(ele[7:])
                dict_reg[win_key][line] = '\t'.join(ele[3:])

print dict_reg

dict_mer = {} # defaultdict(dict)
for key in dict_reg:
    for sam in list_file: ### file name <=> second level key
        ## judge whether the window exists in the file
        if sam not in  dict_reg[key]:
            dict_reg[key][sam]="NA\tNA\tNA\tNA"

        ## 
        if key not in dict_mer:
	    dict_mer[key] = [dict_reg[key][sam]]
        else:
	    dict_mer[key].append(dict_reg[key][sam])

print dict_reg
print dict_mer

with open(options.output, 'w') as output_file:
    for mer_key in dict_mer:
        out = '\t'.join(dict_mer[mer_key])
        output_file.write(mer_key+"\t"+out+"\n")
