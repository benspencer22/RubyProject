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

dealer = [rand(12-1), rand(12-1)]
player = [rand(12-1), rand(12-1)]

def checkHand(hand)

	bust = false
	
	bustnum = hand[0] + hand[1]
	
	if bustnum > 21 then
		puts "You busted!"
	else
		bust = true
	end
	
end

puts "%s %s" % [player[0], player[1]]
puts "%s %s" % [dealer[0], dealer[1]]

puts"Which action do you want to perform: Hit(H) Stay(S) 



