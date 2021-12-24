Class dc.aoc2021.Day24 [ Language = python ]
{

// d ##class(dc.aoc2021.Day24).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
  
file=iris.cls('dc.aoc2021.File').Get(24,test)
if len(file)==0:
	return

with open(file) as f:
    data = f.read().split('inp w\n')[1:]

z = []
max = [0] * 14
min = [0] * 14
for i, chunk in enumerate(data):
    lines = chunk.split('\n')
    pop = int(lines[3][-2:]) == 26 
    x_add = int(lines[4].split()[-1])
    y_add = int(lines[14].split()[-1])

    if not pop:
        z.append((i, y_add))
    else: 
        j, y_add = z.pop()
        diff = x_add + y_add
        if diff < 0:
            max[i] = 9 + diff
            max[j] = 9
            min[i] = 1
            min[j] = 1 - diff
        elif diff > 0:
            max[i] = 9
            max[j] = 9 - diff
            min[i] = 1 + diff
            min[j] = 1
        else:
            max[i] = max[j] = 9
            min[i] = min[j] = 1

if part != 2 :
    p1 = ''.join(map(str, max))
    print('Part 1 : ',p1)

if part != 1 :
    p2 = ''.join(map(str, min))
    print('Part 2 : ',p2)

}

}
