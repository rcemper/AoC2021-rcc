Class dc.aoc2021.Day23 [ Language = python ]
{

// d ##class(dc.aoc2021.Day23).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
from functools import lru_cache
  
file=iris.cls("dc.aoc2021.File").Get(23,test)
if len(file)==0:
	return

A,B,C,D = 'ABCD'
INF = float('inf')
engy  = {
    A:1,
    B:10,
    C:100,
    D:1000,
}
hdoor = {
    1:2,
    2:4,
    3:6,
    4:8
}
door = {2,4,6,8}
targ = dict(zip('ABCD',(2,4,6,8)))

def moves(state):
    for i in range(1,5):
        top = 0
        try:
            while state[i][top] is None: top+=1
        except IndexError:
            continue 
        muts = list(map(list,state))
        amp = muts[i][top]
        if targ[amp]==(-1,2,4,6,8)[i] and all(
            amp==other for other in state[i][top:]):
            continue 
        steps = top
        muts[i][top]=None
        possible_locations = []
        for j in range(hdoor[i]):
            if j not in door:
                possible_locations.append(j)
            if muts[0][j] is not None:
                possible_locations.clear()
        for j in range(hdoor[i],11):
            if muts[0][j] is not None:
                break
            if j not in door:
                possible_locations.append(j)
        semi = list(map(tuple,muts))
        hall = state[0]
        for p in possible_locations:
            mut_hall = list(hall)
            mut_hall[p]=amp
            semi[0]=tuple(mut_hall)
            yield tuple(semi),((1+steps+abs(p-hdoor[i]))*engy[amp])

    for j,amp in enumerate(state[0]):
        if amp is None: continue
        room = ' ABCD'.index(amp)
        room_set = set(state[room])
        room_set.discard(None)

        if room_set and {amp} != room_set:
            continue 
        if j<targ[amp]:
            sl = slice(j+1,targ[amp]+1)
        else:
            sl = slice(targ[amp],j)

        for t in state[0][sl]:
            if t is not None: 
                break
        else: 
            steps = abs(j-targ[amp])
            muts = list(map(list,state))
            muts[0][j] = None  
            room_list = muts[room]
            for top,val in reversed(list(enumerate(room_list))):
                if val is None: break
            assert room_list[top] is None  
            room_list[top]=amp
            steps+=1+top
            yield tuple(map(tuple,muts)),steps*engy[amp]

@lru_cache(maxsize=None)
def final(state):
    if state==target_state: return 0
    p_engy = [INF]
    for new,cost in moves(state):
        p_engy.append(cost+final(new))
    return min(p_engy)

with open(file) as f:
    data = f.read()
letters = [c for c in data if c.isalpha()]
rows = letters[:4],letters[4:]
state1 = (
    (None,)*11,
) + tuple(zip(*rows))

size = len(state1[1])
target_state = (
    (None,)*11,
    (A,)*size,
    (B,)*size,
    (C,)*size,
    (D,)*size
)
if part != 2 :
    p1=final(state1)
    print('Part 1 : ',p1)

if part == 1 :
    return

folded = (
	(D,D),
	(C,B),
	(B,A),
	(A,C)
)

state2 = (
    (None,)*11,
) + tuple((a,b,c,d) for (a,d),(b,c) in zip(state1[1:],folded))

size = len(state2[1])
target_state = (
    (None,)*11,
    (A,)*size,
    (B,)*size,
    (C,)*size,
    (D,)*size
)
p2=final(state2)
print('Part 2 : ',p2)
}

}
