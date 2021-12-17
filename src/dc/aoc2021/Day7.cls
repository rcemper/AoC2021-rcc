Class dc.aoc2021.Day7 [ Language = python ]
{

// d ##class(dc.aoc2021.Day7).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
  
file=iris.cls("dc.aoc2021.File").Get(7,test)
if len(file)==0:
	return
	
with open(file) as f:
        data = [int(x) for x in f.read().split(',')]

linear_weights = [0] * len(data)
quadratic_weights = [0] * len(data)
for i in range(len(data)):
    for position in data:
        move = abs(position - i)
        linear_weights[i] += move
        quadratic_weights[i] += move * (move + 1) // 2

if part != 2 :
    p1=min(linear_weights)
    print('Part 1 : ',p1)

if part != 1 :
    p2=min(quadratic_weights)
    print('Part 2 : ',p2)
}

}
