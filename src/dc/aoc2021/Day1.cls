Class dc.aoc2021.Day1 [ Language = python ]
{
// d ##class(dc.aoc2021.Day1).Run()
ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris
  
if test==1:
    file='../aoc/tst1.txt'
else:
    file='../aoc/input1.txt'

print('\t'+file)

with open(file) as f:
    data = [int(x) for x in f.read().splitlines()]

if part != 2 :
    p1 = sum(x < y for x, y in zip(data, data[1:]))
    print('Part 1 : ',p1)

if part != 1 :
    sum3 = [sum(data[i:i + 3]) for i in range(len(data) - 2)]
    p2 = sum(x < y for x, y in zip(sum3, sum3[1:]))
    print('Part 2 : ',p2)
}

}
