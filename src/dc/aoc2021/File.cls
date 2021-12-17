Class dc.aoc2021.File [ Final ]
{

ClassMethod Get(
	num = 0,
	test = -1) As %String [ Language = python ]
{
import os
if test==0:
    file = '../aoc/alt/'+str(num)+'.txt'

elif test==1:
    file = '../aoc/tst'+str(num)+'.txt'

elif test>1:
    file = '../aoc/tst'+str(num)+str(test)+'.txt'

else:
    file = '../aoc/input'+str(num)+'.txt'

print('\t'+file)
if not(os.path.exists(file)):
    print('\tfile not found')
    file = ''

return file
}

}