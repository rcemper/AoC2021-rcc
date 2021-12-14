Class dc.aoc2021.Day14 [ Language = python ]
{

// d ##class(dc.aoc2021.Day14).Run()

ClassMethod Run(
	part = 0,
	test = 0) As %Integer [ Language = python ]
{
import iris
from collections import Counter, defaultdict

def calc_1(template, between, steps):
    n = len(template)
    pair_counts = defaultdict(int)
    single_counts = Counter(template)
 
    for i in range(1, n):
        pair_counts[template[i - 1] + template[i]] += 1
 
    for _ in range(steps):
        new_pair_counts = defaultdict(int)
 
        for pair in list(pair_counts):
            if pair_counts[pair] == 0:
                continue
 
            if pair in between:
                single_counts[between[pair]] += pair_counts[pair]
                new_pair_counts[pair[0] + between[pair]] += pair_counts[pair]
                new_pair_counts[between[pair] + pair[1]] += pair_counts[pair]
 
        pair_counts = new_pair_counts                
 
    return max(single_counts.values()) - min(single_counts.values())
 
def calc_2(template, between, steps):
    return calc_1(template, between, steps)
   
if test==1:
    data='tst14.txt'
else:
    data='input14.txt'

file = iris.cls('dc.aoc2021.base').aocdir(data)
print('\t'+file)

with open(file) as f:
    template, rules = f.read().split('\n\n')
    template = template.strip()
    between = {}

    for rule in rules.split('\n'):
        pair, char = rule.split(' -> ')
        between[pair] = char

print(calc_1(template, between, 10))
print(calc_2(template, between, 40))

if part != 2 :
    p1 = calc_1(template, between, 10)
    print('Part 1 : ',p1)

if part != 1 :
    p2 =calc_2(template, between, 40)
    print('Part 2 : ',p2)
}

}