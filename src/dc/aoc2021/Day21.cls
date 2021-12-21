Class dc.aoc2021.Day21 [ Language = python ]
{

// d ##class(dc.aoc2021.Day21).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
from functools import lru_cache
  
file=iris.cls("dc.aoc2021.File").Get(21,test)
if len(file)==0:
	return

@lru_cache(maxsize=None)
def wins(cnt, loc, turn):
    if cnt[0] >= 21:
        return 1, 0
    if cnt[1] >= 21:
        return 0, 1

    pl1, pl2 = 0, 0
    for i in range(3):
        p = turn // 3
        pos = (loc[p] + i) % 10 + 1
        sc = cnt[p] + (turn % 3 == 2 and pos)
        w1, w2 = wins(
            (cnt[0], sc) if p == 1 else (sc, cnt[1]),
            (loc[0], pos) if p == 1 else (pos, loc[1]),
            (turn + 1) % 6,
        )
        pl1 += w1
        pl2 += w2
    return pl1, pl2


def core(pos):
    pos = list(pos)
    cnt = [0, 0]
    thr = 0
    while True:
        p = (thr // 3) % 2
        for _ in range(3):
            tw = thr % 100 + 1
            pos[p] = (pos[p] + tw - 1) % 10 + 1
            thr += 1
        cnt[p] += pos[p]
        if cnt[p] >= 1000:
            return cnt[1 - p] * thr

with open(file) as f:
    loc = tuple([int(line.split()[-1]) for line in f.read().splitlines()])
    p1=core(loc)
    p2=max(wins((0, 0), loc, 0))

if part != 2 :
    print('Part 1 : ',p1)

if part != 1 :
    print('Part 2 : ',p2)
}

}
