Class dc.aoc2021.Day20 [ Language = python ]
{

// d ##class(dc.aoc2021.Day20).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
  
file=iris.cls("dc.aoc2021.File").Get(20,test)
if len(file)==0:
	return

def steps(map, nbrs, itr=0):
    code = {'#':'1', '.':'0'}
    psave = '#'
    if key[0] == '#' and key[-1] == '.':
        if itr > 0 and (itr%2) == 0:
            code = {'#':'0', '.':'1'}
        else:
            psave = '.'
    newmap = set()
    newnbrs = set()
    for point in nbrs:
        num = ''
        x,y = point
        for dy in diff:
            for dx in diff:
                if (x+dx, y+dy) in map:
                    num += code['#']
                else:
                    num += code['.']
        if key[int(num,2)] == psave:
            newmap.add(point)
            for dy in diff:
                for dx in diff:
                    newnbrs.add((x+dx,y+dy))

    return newmap, newnbrs

diff = [-1,0,1]
key = None
map = set()
y = 0
f = open(file).read().splitlines()
for line in f:
    if not key:
        key = line
    elif len(line) > 0:
        for x in range(len(line)):
            if line[x] == '#':
                map.add((x,y))
        y += 1

nbrs = set()
for point in map:
    x,y = point
    for dx in diff:
        for dy in diff:
            nbrs.add((x+dx,y+dy))

for i in range(50):
    print('>',end='')		
    map, nbrs = steps(map, nbrs, itr = i+1)
    if (i+1) == 2:
        p1=len(map)
p2=len(map)

if part != 2 :
    print('\nPart 1 : ',p1,end='')
if part != 1 :
    print('\nPart 2 : ',p2)
}

}
