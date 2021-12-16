Class dc.aoc2021.Day16 [ Language = python ]
{

// d ##class(dc.aoc2021.Day16).Run()

ClassMethod Run(
	part = 0,
	test = 0) As %Integer [ Language = python ]
{
import iris
from collections import defaultdict
from pprint import pprint
import math

if (test>0) & (test<16):
	file='../aoc/tst16'+str(test)+'.txt'
	part=1+int(test>7)
else:
	file='../aoc/input16.txt'

print('\t'+file)

with open(file) as f:
	line = f.readline()
	content = [int(x,16) for x in line.strip()]
	
if len(line)<50: print('part='+str(part)+'\tline = '+line)

bits = ""
for c in content:
 bits += format(c, "04b")

if len(bits)<60: print(bits)
# VVVTTTAAAAABBBBBCCCCC

versions = []

def parse(bits, pos=0):
    version = bits[pos:pos+3]
    versions.append(version)
    pos += 3
    type = bits[pos:pos+3]
    pos += 3
    if type == '100':
        readbits = True
        out = ""
        while readbits:
            v = bits[pos:pos+5]
            pos += 5
            check = v[0]
            v = v[1:]
            if check == '0':
                readbits = False
            out += v
        return pos, int(out, 2)
    else:
        i = bits[pos]
        pos += 1
        subpackets = []
        if i == '0':
            l = bits[pos:pos+15]
            pos += 15
            limit = pos + int(l, 2)
            while pos < limit:
                pos, v = parse(bits, pos)
                subpackets.append(v)
        else:
            l = bits[pos:pos+11]
            pos += 11
            for p in range(int(l, 2)):
                pos, v = parse(bits, pos)
                subpackets.append(v)

        out = ""
        type = int(type, 2)
        if type == 0:
            out = sum(subpackets)
        elif type == 1:
            out = math.prod(subpackets)
        elif type == 2:
            out = min(subpackets)
        elif type == 3:
            out = max(subpackets)
        elif type == 5:
            a, b = subpackets
            if a > b:
                out = 1
            else:
                out = 0
        elif type == 6:
            a, b = subpackets
            if a < b:
                out = 1
            else:
                out = 0
        elif type == 7:
            a, b = subpackets
            if a == b:
                out = 1
            else:
                out = 0

        return pos, out

pos, values = parse(bits)
s = [int(x, 2) for x in versions]

if part != 2 :
	p1 = sum(s)
	print('Part 1 : ',p1)

if part != 1 :
	p2 = values
	print('Part 2 : ',p2)
}

}
