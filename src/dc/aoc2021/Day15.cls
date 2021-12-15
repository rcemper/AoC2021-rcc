Class dc.aoc2021.Day15 [ Language = python ]
{

// d ##class(dc.aoc2021.Day15).Run()

ClassMethod Run(
	part = 0,
	test = 0) As %Integer [ Language = python ]
{
import iris
import heapq

def get_adjacent(data, i, j):
    for dy, dx in ((-1, 0), (1, 0), (0, -1), (0, 1)):
        i1, j1 = i + dy, j + dx
        if 0 <= i1 < len(data) and 0 <= j1 < len(data[0]):
            yield i1, j1


def search(grid, width, height):
    pq = [(0, (0, 0))]
    visited = {(0, 0)}
    while pq:
        dist, (i, j) = heapq.heappop(pq)
        if i == height - 1 and j == width - 1:
            return dist
        for i1, j1 in get_adjacent(grid, i, j):
            if (i1, j1) not in visited:
                heapq.heappush(pq, (dist + grid[i1][j1], (i1, j1)))
                visited.add((i1, j1))

if test==1:
    file='../aoc/tst15.txt'
else:
    file='../aoc/input15.txt'

print('\t'+file)

with open(file) as f:
    data = [[int(x) for x in line] for line in f.read().splitlines()]

width = len(data[0])
height = len(data)

if part != 2 :
    p1 = search(data, width, height)
    print('Part 1 : ',p1)

if part != 1 :
	new_map = [line * 5 for line in data * 5]
	for i in range(height * 5):
		for j in range(width * 5):
			new_map[i][j] = (new_map[i][j] + i // height + j // width - 1) % 9 + 1
    
	p2 =search(new_map, width * 5, height * 5)
	print('Part 2 : ',p2)
}

}