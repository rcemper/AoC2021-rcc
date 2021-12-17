Class dc.aoc2021.Day2 [ Language = python ]
{
// d ##class(dc.aoc2021.Day2).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
  
file=iris.cls("dc.aoc2021.File").Get(2,test)
if len(file)==0:
	return

with open(file) as f:
    data = [line.split() for line in f]
    data = [(dir, int(delta)) for dir, delta in data]

x, y, y1 = 0, 0, 0
for dir, delta in data:
    if dir =='forward':
            x += delta
            y1 += y * delta
    if dir=='up':
            y -= delta
    if dir=='down':
            y += delta

if part != 2 :
    p1 = x * y
    print('Part 1 : ',p1)

if part != 1 :
    p2 = x * y1
    print('Part 2 : ',p2)
}

}