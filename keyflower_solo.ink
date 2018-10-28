//Keyflower solo interactive automa
VAR turn_number = 0
LIST turn_description = Spring=1, Summer=2, Fall=3, Winter=4
# author: Adapted from Dale Buonocore (Elad at boardgamegeek.com). Original post found here.

-> start

=== start === 

# CLASS: important
SETUP

1. Place all non-green workers in the bag. 
2. Place green workers to the side.
3. Sort resources and place to the side.
4. Draw 8 workers for you and 8 for the AP. 
5. Sort season tiles.
6. Randomly select home tile for you and AP. 
7. Place 2 boat tiles in play area.
8. Place the turn order tile in play area.
9. Place 6 Spring tiles in play area.
10. Draw 3 Winter tiles, look at them.
11. Deal 3 random Winter tiles face-down.
12. You are the Start Player in Spring.
13. The game proceeds as in regular Keyflower.

-> new_turn

=== new_turn ===
//4 turns
~ turn_number = turn_number + 1
{ turn_number > 4:
	-> end
}
# CLASS: separator
# CLASS: turn 
Turn {turn_number} ({turn_description(turn_number)})

+ [It's automa's turn?] -> turn


=== turn ===
//on spring only center tiles!
{ turn_number == 1:
    -> center_tile
- else:
    -> random_choose
}

=== random_choose ===

Automa randomizes ... { shuffle:
	- (D6:1) -> center_tile
	- (D6:2) -> center_tile
	- (D6:3) -> center_tile
	- (D6:4) -> center_tile
	- (D6:5) -> village_tile
	- (D6:6) -> village_tile
}


=== center_tile ===

# CLASS: important
Center tiles: he prioritizes his “main” choices as follows:

1) Bidding on an open tile, with the Turn Order tile as the last option; 
2) Outbidding you on one of the tiles;
3) “Using” a tile, first prioritizing “his” (i.e., one where he currently has the highest bid), then shifting to "yours" if needed; 
4) “Over-using” a tile (i.e., placing workers on one which already has at least one worker on it from a previous use) -- again, "his" first, then "yours" if needed. 

Within these “main” choices, his “particular” choices among otherwise equivalent options are determined by the following “priority-tree”: 
1) the option which requires the smallest number of workers; 
2) the option involving the worker color of which he currently has the most; 
3) if there’s still a tie, use the D6 to make the final choice. Note that this “priority-tree” will similarly determine his “particular” choices when he is acting in your Home Village, below. 

-> choices

=== village_tile ===

#CLASS: important
Village tiles - the priorities for his “main” choices are as follows:

1) “Using” a tile. When there are more than 6 viable (i.e., empty and usable) tiles, I typically use the D6 by considering my Home tile as 1, then moving to the first ring of adjacent tiles, starting at the top and going clockwise, then to the second ring if necessary. (Another option would be to use a D10 or larger, and just "count down" each column going from left to right -- or even drawing a card from a straight deck would work, as this would provide a random number from 1-13);
2) “Over-using” a tile, as described previously.

-> choices

=== choices ===
+ [New automa turn] -> turn

+ [No more keyples/actions] -> new_turn


=== end ===

# CLASS: separator
# CLASS: endgame
End of game

Calculate points and post on BGG: https:\/\/boardgamegeek.com/thread/944605/keyflower-solitaire

+ New game?
    # RESTART
    -> END
    
    

