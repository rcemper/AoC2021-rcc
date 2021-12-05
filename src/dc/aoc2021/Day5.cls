Class dc.aoc2021.Day5 [ Language = python ]
{

// d ##class(dc.aoc2021.Day5).Run()

ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris
from collections import defaultdict

class Line:
    def __init__(self, x1, y1, x2, y2):
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2

    def is_orthogonal(self):
        return self.x1 == self.x2 or self.y1 == self.y2

    def points(self):
        xs = range(min(self.x1, self.x2), max(self.x1, self.x2) + 1)
        ys = range(min(self.y1, self.y2), max(self.y1, self.y2) + 1)
        if self.x1 == self.x2:
            return [(self.x1, y) for y in ys]
        if self.y1 == self.y2:
            return [(x, self.y1) for x in xs]
        if self.x1 > self.x2:
            xs = reversed(xs)
        if self.y1 > self.y2:
            ys = reversed(ys)
        return [(x, y) for x, y in zip(xs, ys)]
  
if test==1:
    data='tst5.txt'
else:
    data='input5.txt'

file = iris.cls('dc.aoc2021.base').aocdir(data)
print('\t'+file)

with open(file) as f:
    lines = [line.split(' -> ') for line in f]
    lines = [[*start.split(','), *end.split(',')] for start, end in lines]
    lines = [Line(*(int(x) for x in line)) for line in lines]

orthogonal_overlaps = defaultdict(int)
overlaps = defaultdict(int)
for line in lines:
    for point in line.points():
        overlaps[point] += 1
        if line.is_orthogonal():
            orthogonal_overlaps[point] += 1
p1=sum(overlap > 1 for overlap in orthogonal_overlaps.values())
p2=sum(overlap > 1 for overlap in overlaps.values())

if part != 2 :
    print('Part 1 : ',p1)

if part != 1 :
    print('Part 2 : ',p2)
}

}
