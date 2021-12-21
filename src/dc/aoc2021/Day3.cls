Class dc.aoc2021.Day3 [ Language = python ]
{
// d ##class(dc.aoc2021.Day3).Run()

ClassMethod Run(part = 0, test = -1) As %Integer [ Language = python ]
{
import iris
  
file=iris.cls("dc.aoc2021.File").Get(3,test)
if len(file)==0:
    return

with open(file) as f:
    data = [int(x, 2) for x in f]
    bits = max(x.bit_length() for x in data)

gamma = 0
for i in range(bits):
    gamma_bit = sum((x >> i) & 1 for x in data) > len(data) // 2
    gamma |= gamma_bit << i

o2, co2 = [*data], [*data]
for i in range(bits - 1, -1, -1):
    o2_bit = sum((x >> i) & 1 for x in o2) >= len(o2) / 2
    o2 = [x for x in o2 if (x >> i) & 1 == o2_bit] or o2

for i in range(bits - 1, -1, -1):
    co2_bit = sum((x >> i) & 1 for x in co2) < len(co2) / 2
    co2 = [x for x in co2 if (x >> i) & 1 == co2_bit] or co2

if part != 2 :
    p1 = gamma * (2 ** bits - 1 ^ gamma)
    print('Part 1 : ',p1)

if part != 1 :
    p2 = o2[0] * co2[0]
    print('Part 2 : ',p2)
}

}
