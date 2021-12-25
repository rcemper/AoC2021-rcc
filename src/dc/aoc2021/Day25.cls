Class dc.aoc2021.Day25 [ Language = python ]
{

// d ##class(dc.aoc2021.Day25).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
from itertools import count
  
file=iris.cls("dc.aoc2021.File").Get(25,test)
if len(file)==0:
	return

with open(file) as f:
    d = {(x, y): c for y, line in enumerate(f.read().strip().split("\n")) for x, c in enumerate(line)}

X = max(x for x, y in d) + 1
Y = max(y for x, y in d) + 1
for step in count(1):
    flag = False
    d_ = d.copy()
    for x, y in d:
        x_ = (x + 1) % X
        y_ = y
        if d[x, y] == '>' and d[x_, y_] == '.':
            d_[x, y] = '.'
            d_[x_, y_] = '>'
            flag = True

    d = d_
    d_ = d.copy()
    for x, y in d:
        x_ = x
        y_ = (y + 1) % Y
        if d[x, y] == 'v' and d[x_, y_] == '.':
            d_[x, y] = '.'
            d_[x_, y_] = 'v'
            flag = True
    d = d_
    if not flag:
        p1=step
        break

if part != 2 :
    print('Part 1 : ',p1)

if part != 1 :
    p2 = "Congratulations!" 
    p2 += "\n\tYou've finished every puzzle in Advent of Code 2021"
    print('Part 2 : ',p2)
}

}
