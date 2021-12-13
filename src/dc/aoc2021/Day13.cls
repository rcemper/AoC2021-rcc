Class dc.aoc2021.Day13 [ Language = python ]
{

// d ##class(dc.aoc2021.Day13).Run()

ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris
  
if test==1:
    data='tst13.txt'
else:
    data='input13.txt'

def parseA(point):
    a, b = point.split(",")
    return (int(a),int(b))
def parseB(cmd):
    a, b = cmd.split("=")
    return (a[-1], int(b))

def dbg(points):
    w, h = 50, 6
    paper = [0] * w * h
    for x, y in points:
        if x < w and y < h: paper[y*w+x] = 1
    for y in range(0, h):
        for x in range(0, w):
            print("#" if paper[y*w+x] else " ", end="")
        print()

def fold(points, cmd):
    direction, coord = cmd
    newpoints = set()
    for x, y in points:
        if direction == "y":
            if y > coord: y = coord - (y-coord)
        else:
            if x > coord: x = coord - (x-coord)
        newpoints.add((x,y))
    return newpoints
    
file = iris.cls('dc.aoc2021.base').aocdir(data)
print('\t'+file)

f = file
a, b = open(f).read().split("\n\n")
points = set([parseA(l.rstrip()) for l in a.strip().split("\n")])
cmds = [parseB(l.rstrip()) for l in b.strip().split("\n")]


points = fold(points, cmds[0])
if part != 2 :
    p1 = len(points)
    print('Part 1 : ',p1)

if part != 1 :
  p2=''
  print('Part 2 : ',p2)
  for cmd in cmds[1:]:
      points = fold(points, cmd)
  dbg(points)
}

}
