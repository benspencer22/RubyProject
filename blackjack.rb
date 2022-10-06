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

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

dealer = [CARDS[rand(0..12)], CARDS[rand(0..12)]]
player = [CARDS[rand(0..12)], CARDS[rand(0..12)]]

def checkHand(hand)

	bust = true
	
	bustnum = 0 
	
	for card in hand
		bustnum = bustnum + card
	end
	
	if bustnum > 21 then
		if hand.include? 11
			hand[hand.index(11)] = 1
			bustnum - 10
		else 
			puts "You busted!"
			bust = false
		end
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
	print "Player: "
	for card in hand
		print "%s ".chomp % [card]
	end
end

def printDealerFirst(hand)
	print "Dealer: %s ?" % hand[0]
end

def printDealer(hand)
	print "Dealer: "
	for card in hand
		print "%s ".chomp % [card]
	end
end

def printTableFirst(player, dealer)

	puts "                 DEALER"
	puts " ___________________________________________"
	puts "|            ____      ____                 |  "
	puts "|           |    |    |    |                |  "

	if dealer[0] >= 10
		puts "|           | %s |    |  ? |                |  " % [dealer[0], dealer[1]]
	else
		puts "|           |  %s |    |  ? |                |  " % [dealer[0], dealer[1]]
	end

	puts "|           |____|    |____|                |  "
	puts "|                                           |  "
	puts "|            ____      ____                 |  "
	puts "|           |    |    |    |                |  "
	if player[0] >= 10 && player[1] >= 10
		puts "|           | %s |    | %s |                |  " % [player[0], player[1]]
	elsif player[0] < 10 && player[1] >= 10
		puts "|           |  %s |    | %s |                |  " % [player[0], player[1]]
	elsif player[0] >= 10 && player[1] < 10
		puts "|           | %s |    |  %s |                |  " % [player[0], player[1]]
	else
		puts "|           |  %s |    |  %s |                |  " % [player[0], player[1]]
	end
	puts "|           |____|    |____|                |  "
	puts "|___________________________________________|  "
	puts "                 PLAYER "
	
end

def printTable(player, dealer)

	# Dealer half of table
	puts "                 DEALER"
	puts " ___________________________________________"
	puts "\t ____      ____                   "
	puts "\t|    |    |    |                  "

	if dealer[0] >= 10
		puts "\t| %s |    |  ? |                  " % [dealer[0]]
	else
		puts "\t|  %s |    |  ? |                  " % [dealer[0]]
	end

	puts "\t|____|    |____|                  "
	puts "                                             "

	# Player Half after drawing more cards

	print "\t"
	for card in player
		print " ____     "
	end
	print "\n\t"
	for card in player
		print "|    |    "
	end
	print "\n\t"
	count = 0
	for card in player
		if player[count] >= 10
			print "| %s |    " % [player[count]]
		else
			print "|  %s |    " % [player[count]]
		end
		count += 1
	end
	
	print "\n\t"
	for card in player
		print "|____|    "
	end
	print "\n"
	puts "___________________________________________  "
	puts "                 PLAYER "
	
end

def printTable2(player, dealer)




	# Player Half after drawing more cards

	print "\t"
	for card in player
		print " ____     "
	end
	print "\n\t"
	for card in player
		print "|    |    "
	end
	print "\n\t"
	count = 0
	for card in player
		if player[count] >= 10
			print "| %s |    " % [player[count]]
		else
			print "|  %s |    " % [player[count]]
		end
		count += 1
	end
	
	print "\n\t"
	for card in player
		print "|____|    "
	end
end


def playGame(player, dealer)
	
	player2 = [10, 11, 12]
	printTable(player, dealer)
	

	check = true
	bust = false
	while check do
		puts"Which action do you want to perform: Hit(H) Stay(S) Double Down(D)"

		action = gets.chomp

		if action == "H" || action == 'h'
			player << CARDS[rand(0..12)]
			printTable(player, dealer)
		end
		if action == "D" || action == 'd'
			player << CARDS[rand(0...12)]
			check = false
			printTable(player, dealer)
		end
		
		check = checkHand(player)
		bust = !check
		if action == "S" || action == 's'
			check = false
		end 
		
		
	end

	dealerBust = false
	if bust != true

		while dealerBust == false && checkTotal(dealer) < 17
			dealer << CARDS[rand(0..12)]
		end
	end

	printHand(player)
	print "= "
	print checkTotal(player)
	puts''
	printDealer(dealer)
	print "= "
	print checkTotal(dealer)
	puts''

	outcome = 0
	if dealerBust == false
		
		if checkTotal(player) > checkTotal(dealer) && checkTotal(player) < 22 || checkTotal(dealer) > 21
			puts "You won $$$!"
			outcome = 1
		elsif checkTotal(player) < checkTotal(dealer) && checkTotal(dealer) < 22 || checkTotal(player) > 21
			puts "You lost :("
			outcome = -1
		else
			puts "You pushed this hand :/"
		end
			
	end
	return outcome
end

continue = true
money = 10000

while continue == true 

	puts "How much do you want to bet on this hand?"
	print "You chip count: "
	puts "%d".chomp % [money]
	puts "Enter a bet amount or Quit(Q): "
	
	action = gets.chomp
	

	if action == "Q" || action == "q"
		break
	end

	outcome = 0
	dealer.clear()
	player.clear()
	dealer = [CARDS[rand(0..12)], CARDS[rand(0..12)]]
	player = [CARDS[rand(0..12)], CARDS[rand(0..12)]]
	outcome = playGame(player, dealer)
	
	action = action.to_i
	puts action
	
	if outcome == -1
		money = money - action
	elsif outcome == 1
		money = action + money
	end
end