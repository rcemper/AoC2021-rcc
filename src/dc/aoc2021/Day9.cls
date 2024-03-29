Class dc.aoc2021.Day9 [ Language = python ]
{

// d ##class(dc.aoc2021.Day9).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
from bisect import insort
from collections import deque
from itertools import product
from math import prod

def get_adjacent(data, i, j):
    adjacent = []
    for dy, dx in (-1, 0), (1, 0), (0, -1), (0, 1):
        i1, j1 = i + dy, j + dx
        if 0 <= i1 < len(data) and 0 <= j1 < len(data[0]):
            adjacent.append((i1, j1))
    return adjacent


def bfs(data, i, j):
    visited = [(i, j)]
    queue = deque(((i, j),))
    while queue:
        i, j = queue.pop()
        for i1, j1 in get_adjacent(data, i, j):
            if (i1, j1) not in visited and data[i1][j1] != 9:
                queue.appendleft((i1, j1))
                visited.append((i1, j1))
    return len(visited)

file=iris.cls("dc.aoc2021.File").Get(9,test)
if len(file)==0:
	return

with open(file) as f:
    data = [[int(value) for value in line.strip()] for line in f]

risks = []
basins = []
for i, j in product(range(len(data)), range(len(data[0]))):
    adjacent = get_adjacent(data, i, j)
    if all(data[i][j] < data[i1][j1] for (i1, j1) in adjacent):
        risks.append(data[i][j] + 1)
        insort(basins, bfs(data, i, j))

p1=sum(risks)
p2=prod(basins[-3:])
if part != 2 :
    print('Part 1 : ',p1)

if part != 1 :
    print('Part 2 : ',p2)

return
}

}
