Class dc.aoc2021.Day18 [ Language = python ]
{

// d ##class(dc.aoc2021.Day18).Run()

ClassMethod Run(
	part = 0,
	test = -1) As %Integer [ Language = python ]
{
import iris
import itertools
import math
from functools import reduce
  
file=iris.cls("dc.aoc2021.File").Get(18,test)
if len(file)==0:
	return

def add_left(x, n):
    if n is None:
        return x
    if isinstance(x, int):
        return x + n
    return [add_left(x[0], n), x[1]]

def add_right(x, n):
    if n is None:
        return x
    if isinstance(x, int):
        return x + n
    return [x[0], add_right(x[1], n)]

def explode(x, n=4):
    if isinstance(x, int):
        return False, None, x, None
    if n == 0:
        return True, x[0], 0, x[1]
    a, b = x
    exp, left, a, right = explode(a, n - 1)
    if exp:
        return True, left, [a, add_left(b, right)], None
    exp, left, b, right = explode(b, n - 1)
    if exp:
        return True, None, [add_right(a, left), b], right
    return False, None, x, None

def split(x):
    if isinstance(x, int):
        if x >= 10:
            return True, [x // 2, math.ceil(x / 2)]
        return False, x
    a, b = x
    change, a = split(a)
    if change:
        return True, [a, b]
    change, b = split(b)
    return change, [a, b]

def add(a, b):
    x = [a, b]
    while True:
        change, _, x, _ = explode(x)
        if change:
            continue
        change, x = split(x)
        if not change:
            break
    return x

def magnitude(x):
    if isinstance(x, int):
        return x
    return 3 * magnitude(x[0]) + 2 * magnitude(x[1])

with open(file) as f:
    lines = list(map(eval, f.read().splitlines()))
        
if part != 2 :
    p1 = magnitude(reduce(add, lines))
    print('Part 1 : ',p1)

if test>1: return

if part != 1 :
    p2 = max(magnitude(add(a, b)) for a, b in itertools.permutations(lines, 2))
    print('Part 2 : ',p2)
}

}
