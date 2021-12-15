Class dc.aoc2021.Day11 [ Language = python ]
{

// d ##class(dc.aoc2021.Day11).Run()

ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris
import itertools

def neighbors(coord):
    x, y = coord
    for xd in (-1, 0, 1):
        for yd in (-1, 0, 1):
            if xd == 0 and yd == 0:
                continue
            c = x + xd, y + yd
            if c in grid:
                yield c

def try_flash(k):
    if grid[k] <= 9 or k in flashed:
        return

    flashed.add(k)

    for n in neighbors(k):
        grid[n] += 1
        try_flash(n)

if test==1:
    file='../aoc/tst11.txt'
else:
    file='../aoc/input11.txt'

print('\t'+file)

with open(file) as f:
    grid = {}

    for y, line in enumerate(f.read().splitlines()):
        for x, c in enumerate(line):
            grid[x, y] = int(c)

    p1 = 0
    p2 = None

    for i in itertools.count(1):
        flashed = set()
        for k in grid:
            grid[k] += 1
        for k in grid:
            try_flash(k)
        for k, v in grid.items():
            if v > 9:
                grid[k] = 0
        if i <= 100:
            p1 += len(flashed)
        if p2 is None and len(flashed) == len(grid):
            p2 = i
        if i >= 100 and p2 is not None:
            break

if part != 2 :
    print('Part 1 : ',p1)

if part != 1 :
    print('Part 2 : ',p2)
}

}
