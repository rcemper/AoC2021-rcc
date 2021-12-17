Class dc.aoc2021.Day6 [ Language = python ]
{

// d ##class(dc.aoc2021.Day6).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
import re
from collections import defaultdict

def Solve(rounds):
    d = defaultdict(int)
    for f in fish:
        d[f] += 1
    for r in range(0, rounds):
        zeros = d[0]
        for i in range(1, 8 + 1):
            d[i - 1] = d[i]
        d[6] += zeros
        d[8] = zeros

    return sum(d.values())
  
file=iris.cls("dc.aoc2021.File").Get(6,test)
if len(file)==0:
	return

inp = [line.strip() for line in open(file, 'r')]
fish = list(map(int, re.findall(r'\d+', inp[0])))

if part != 2 :
    p1 = Solve(80)
    print('Part 1 : ',p1)

if part != 1 :
    p2 = Solve(256)
    print('Part 2 : ',p2)
}

}
