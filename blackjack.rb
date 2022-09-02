#
#
# CS430 Ruby Project
#
# Author: Ben Spencer
#
# Simulated Blackjack Game
#
#
#

#Constants for the cards

CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

dealer = [CARDS[rand(0..13)], CARDS[rand(0..13)]]
player = [CARDS[rand(0..13)], CARDS[rand(0..13)]]

def checkHand(hand)

	bust = true
	
	bustnum = 0 
	
	for card in hand
		bustnum = bustnum + card
	end
	
	if bustnum > 21 then
		puts "You busted!"
		bust = false
	end
	
	return bust
end

def checkTotal(hand)
	
	bustnum = 0 
	
	for card in hand
		bustnum = bustnum + card
	end
	
	return bustnum
end

def printHand(hand)

	for card in hand
		print "%s ".chomp % [card]
	end
	puts ''
end

def printDealer(hand)

	print "%s ?" % [hand[0]]
	puts ''
end

printHand(player)
printDealer(dealer)

check = true

while check do
	puts"Which action do you want to perform: Hit(H) Stay(S)"

	action = gets.chomp

	if action == "H" || action == 'h'
		player << CARDS[rand(0..13)]
	end
	check = checkHand(player)
	if action == "S" || action == 's'
		check = false
	end 
	printHand(player)
	printDealer(dealer)
	
end

print CARDS[13]






