Class dc.aoc2021.Day4 [ Language = python ]
{

// d ##class(dc.aoc2021.Day4).Run()

ClassMethod Run(part = 0, test = 0) As %Integer [ Language = python ]
{
import iris , re

def mark_cards(cards, number):
    for card in cards:
        for row_index, row in enumerate(card):
            card[row_index] = [x if x != number else None for x in row]
    return cards

def check_for_winner(cards):
    winners = set()
    for card_num, card in enumerate(cards):
        row_winner = False
        for row in card:
            if len(set(row)) == 1:
                winners.add(card_num)
                row_winner = True
                break

        if row_winner:
            continue

        for col_index in range(len(card[0])):
            column = []
            for row in card:
                column.append(row[col_index])

            if len(set(column)) == 1:
                winners.add(card_num)
                break

    return winners

if test==1:
    file='../aoc/tst4.txt'
else:
    file='../aoc/input4.txt'

print('\t',file)

with open(file, 'r') as aoc_input:
    sections = aoc_input.read().strip().split('\n\n')

balls = [int(x) for x in sections[0].split(',')]

cards = []
for junk in sections[1:]:
    cards.append([])
    for row in junk.split('\n'):
        cards[-1].append([int(x) for x in re.findall(r'\d\d?', row)])

completed_cards = []
for ball in balls:
    cards = mark_cards(cards, ball)

    winning_indicies = check_for_winner(cards)
    if winning_indicies:
        for index in sorted(winning_indicies, reverse=True):
            completed_cards.append((cards[index], ball))
            del cards[index]

        if len(cards) == 0:
            break
#p1
winning_card, winning_ball = completed_cards[0]
winning_sum = sum([sum([x for x in row if x != None]) for row in winning_card])
#p2
losing_card, losing_ball = completed_cards[-1]
losing_sum = sum([sum([x for x in row if x != None]) for row in losing_card])

if part != 2 :
    p1 = winning_sum * winning_ball
    print('Part 1 : ',p1)
if part != 1 :
    p2 =losing_sum * losing_ball
    print('Part 2 : ',p2)
}

}
