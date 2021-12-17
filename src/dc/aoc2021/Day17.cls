Class dc.aoc2021.Day17 [ Language = python ]
{

// d ##class(dc.aoc2021.Day17).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris

file=iris.cls("dc.aoc2021.File").Get(17,test)
if len(file)==0:
	return
	
with open(file) as f:
    minx, maxx, miny, maxy = sum([[int(y) for y in x.split('=')[1].split('..')] for x in f.read().split(', ')], [])

count, best = 0, 0
for tx in range(1, maxx + 1):
    for ty in range(miny, -maxy + maxx):
        x, y, h = 0, 0, 0
        vx, vy = tx, ty
        while vx > 0 or y > miny:
            x, y, h = x + vx, y + vy, max(h,y)
            vx, vy = max(0, vx - 1), vy - 1
            if minx <= x <= maxx and miny <= y <= maxy:
                count += 1
                best = max(best, h)
                break

if part != 2 :
	p1 = best
	print('Part 1 : ',p1)

if part != 1 :
	p2 = count
	print('Part 2 : ',p2)
}

}
Class dc.aoc2021.Day17 [ Language = python ]
{

// d ##class(dc.aoc2021.Day17).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris

file=iris.cls("dc.aoc2021.File").Get(17,test)
if len(file)==0:
	return
	
with open(file) as f:
    minx, maxx, miny, maxy = sum([[int(y) for y in x.split('=')[1].split('..')] for x in f.read().split(', ')], [])

count, best = 0, 0
for tx in range(1, maxx + 1):
    for ty in range(miny, -maxy + maxx):
        x, y, h = 0, 0, 0
        vx, vy = tx, ty
        while vx > 0 or y > miny:
            x, y, h = x + vx, y + vy, max(h,y)
            vx, vy = max(0, vx - 1), vy - 1
            if minx <= x <= maxx and miny <= y <= maxy:
                count += 1
                best = max(best, h)
                break

if part != 2 :
	p1 = best
	print('Part 1 : ',p1)

if part != 1 :
	p2 = count
	print('Part 2 : ',p2)
}

}
