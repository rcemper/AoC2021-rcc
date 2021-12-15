Class dc.aoc2021.Day0 [ Language = python ]
{
// for d=0:1:15 do $classmethod("dc.aoc2021.Day"_d,"Run",0,0) r !,y:1
// d ##class(dc.aoc2021.Day0).Run()

ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris
  
if test==1:
    file='../aoc/tst0.txt'
else:
    file='../aoc/input0.txt'

print('\t'+file)

with open(file) as f:
    data = [int(x) for x in f.read().splitlines()]

if part != 2 :
    p1 = 'p0.1'
    print('Part 1 : ',p1)

if part != 1 :
    p2 ='p0.2'
    print('Part 2 : ',p2)

}

}
