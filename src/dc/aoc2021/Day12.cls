Class dc.aoc2021.Day12 [ Language = python ]
{

// d ##class(dc.aoc2021.Day12).Run()

ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris,re
from collections import defaultdict  

def dfs(last, seen, edges, repeats):
    if last == 'end':
        return 1
    paths = 0
    for edge in edges[last]:
        if not (edge.islower() and edge in seen):
            paths += dfs(edge, seen | {edge}, edges, repeats)
        elif edge.islower() and edge in seen and repeats:
            paths += dfs(edge, seen | {edge}, edges, False)
    return paths
  
if test==1:
    file='../aoc/tst121.txt'
elif test==2:
    file='../aoc/tst122.txt'
elif test==3:
    file='../aoc/tst123.txt'
else:
    file='../aoc/input12.txt'

print('\t'+file)

with open(file) as f:
    data = re.findall(r'(.*)-(.*)\n', f.read())

edges = defaultdict(list)
for v1, v2 in data:
    if v2 != 'start':
        edges[v1].append(v2)
    if v1 != 'start':
        edges[v2].append(v1)

if part != 2 :
    p1=dfs('start', set(), edges, False)
    print('Part 1 : ',p1)

if part != 1 :
    p2=dfs('start', set(), edges, True)
    print('Part 2 : ',p2)

return
}

}
