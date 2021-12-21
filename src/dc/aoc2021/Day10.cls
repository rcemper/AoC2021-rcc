Class dc.aoc2021.Day10 [ Language = python ]
{

// d ##class(dc.aoc2021.Day10).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
from bisect import insort

def get_mismatches(line):
    brackets = {'(': ')', '[': ']', '<': '>', '{': '}'}
    stack = []
    for i, char in enumerate(line):
        if char in brackets:
            stack.append(i)
        if char in brackets.values():
            if brackets[line[stack.pop()]] != char:
                return [char]
    return [brackets[line[i]] for i in reversed(stack)]
      
file=iris.cls("dc.aoc2021.File").Get(10,test)
if len(file)==0:
	return

with open(file) as f:
    data = list(f)

# studio dislikes closing curly brackets chr(125)
mismatch_weights = {')': 3, ']': 57, chr(125): 1197, '>': 25137}
closing_weights = {')': 1, ']': 2, chr(125): 3, '>': 4}

mismatch_score = 0
scores = []
for line in data:
    mismatches = get_mismatches(line)
    if len(mismatches) == 1:
        mismatch_score += mismatch_weights[mismatches[0]]
    else:
        partial = 0
        for bracket in mismatches:
            partial = partial * 5 + closing_weights[bracket]
        insort(scores, partial)

if part != 2 :
    p1 = mismatch_score
    print('Part 1 : ',p1)

if part != 1 :
    p2 =scores[len(scores) // 2]
    print('Part 2 : ',p2)
}

}
