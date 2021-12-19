Class dc.aoc2021.Day19 [ Language = python ]
{

// d ##class(dc.aoc2021.Day19).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
import itertools 

def rotations(x,y,z):
  def spin_right(x,y,z):
    return y,-x,z
  
  def turn_right(x,y,z):
    return z, y, -x
    
  def turn_up(x,y,z):
    return x,z,-y
  
  for _ in range(4):
    yield x,y,z
    x,y,z = spin_right(x,y,z)
    yield x,y,z
  
    x,y,z = spin_right(x,y,z)
    yield x,y,z
  
    x,y,z = spin_right(x,y,z)
    yield x,y,z
  
    x,y,z = spin_right(x,y,z)
    x,y,z = turn_right(x,y,z)
  
  x,y,z = turn_up(x,y,z)
  yield x,y,z
  
  x,y,z = spin_right(x,y,z)
  yield x,y,z

  x,y,z = spin_right(x,y,z)
  yield x,y,z

  x,y,z = spin_right(x,y,z)
  yield x,y,z

  x,y,z = spin_right(x,y,z)
  
  x,y,z = turn_up(x,y,z)
  x,y,z = turn_up(x,y,z)
  yield x,y,z
  
  x,y,z = spin_right(x,y,z)
  yield x,y,z

  x,y,z = spin_right(x,y,z)
  yield x,y,z

  x,y,z = spin_right(x,y,z)
  yield x,y,z

file=iris.cls("dc.aoc2021.File").Get(19,test)
if len(file)==0:
  return

sections = [sec.strip() for sec in open(file).read().split('\n\n')]
pts_sets = []

for section in sections:
  hdr, body = section.split(' ---\n')
  snum = hdr.split(' ')[2]
  lines = [l.split(',') for l in body.split('\n')]
  pt_set = set()
  for x,y,z in lines:
    pt_set.add( (int(x),int(y),int(z)) )
  pts_sets.append(pt_set)

absloc = set()
for pt in pts_sets[0]:
  absloc.add(pt)

unal = pts_sets[1:]

soff = [(0,0,0)]
while unal:
  for align in list(absloc):
    for unar in list(unal):
      rotpos = list(zip(*[list(rotations(x,y,z)) for x,y,z in unar]))
      rotpos = [set(x) for x in rotpos]
      for i in range(24):
        porot = rotpos[i]
        for cand in porot:
          dx = cand[0] - align[0]
          dy = cand[1] - align[1]
          dz = cand[2] - align[2]
          posrot = {(x-dx, y-dy, z-dz) for x,y,z in porot}
          overlap = len(posrot.intersection(absloc))
          if overlap >= 12:
             print('>',end='')
             soff += [(dx, dy, dz)]
             absloc.update(posrot)
             unal.remove(unar)
             break

p1=len(absloc)
p2 = 0               

for one, two in itertools.combinations(soff, 2):
  md = abs(one[0]-two[0]) + abs(one[1]-two[1]) + abs(one[2]-two[2])
  p2 = max(p2, md)
 
if part != 2 :
    print('\nPart 1 : ',p1,end='')

if part != 1 :
    print('\nPart 2 : ',p2,end='')
}

}
