Class dc.aoc2021.Day8 [ Language = python ]
{

// d ##class(dc.aoc2021.Day8).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
from collections import defaultdict
  
file=iris.cls("dc.aoc2021.File").Get(8,test)
if len(file)==0:
	return

input = list()

def part_1(input):
    result = 0
    for line in input:
        _, out = line.strip().split(' | ')
        out = out.split()
        for d in out:
            if len(d) == 2:
                result += 1
            elif len(d) == 4:
                result += 1
            elif len(d) == 3:
                result += 1
            elif len(d) == 7:
                result += 1
    return result

def part_2(input):
    result = 0
    for line in input:
        inp, out = line.strip().split(' | ')
        inp = inp.split()
        out = out.split()
        res = ''
        code = defaultdict(str)
        for d in inp:
            if len(d) == 2:
                code['1'] = d
            elif len(d) == 4:
                code['4'] = d
            elif len(d) == 3:
                code['7'] = d
            elif len(d) == 7:
                code['8'] = d
        for d in inp:
            if len(d) == 6:
                if len(''.join(set(code['4']).intersection(d))) == 4:
                    code['9'] = d
                elif len(''.join(set(code['7']).intersection(d))) == 3:
                    code['0'] = d
                else:
                    code['6'] = d
            elif len(d) == 5:
                if len(''.join(set(code['7']).intersection(d))) == 3:
                    code['3'] = d
                elif len(''.join(set(code['4']).intersection(d))) == 3:
                    code['5'] = d
                else:
                    code['2'] = d
        assert len(code) == 10
        for d in out:
            for k in code:
                if sorted(code[k]) == sorted(d):
                    res += k
                    break
        result += int(res, 10)
    return result

with open(file) as f:
    input = f.readlines()
    
if part != 2 :
    p1=part_1(input)
    print('Part 1 : ',p1)

if part != 1 :
    p2=part_2(input)
    print('Part 2 : ',p2)

return
}

}
