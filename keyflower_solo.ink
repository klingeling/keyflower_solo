//Keyflower solo interactive automa
VAR turn_number = 0
LIST turn_description = 春季=1, 夏季=2, 秋季=3, 冬季=4
# author: Adapted from Dale Buonocore (Elad at boardgamegeek.com). Original post found here.

-> start

=== start === 

# CLASS: important
设置

1. 将所有非绿色工人放置到布袋中。
2. 将绿色工人放置在游戏区域的一旁。
3. 将资源指示物按类型分类形成公共补给堆，并放置在游戏区域的一旁。
4. 你和自动机各抽取8个工人。
5. 将六边形板块按季节分类。
6. 你和自动机随机获得一块家园板块。
7. 将2块船只板块放置在游戏区域中。
8. 将回合顺序板块放置在游戏区域中。
9. 将6块春季板块放置在游戏区域中。
10. 抽取三块冬季板块，然后查看它们。
11. 随机分发3块面朝下的冬季板块。
12. 你是春季的初始玩家。
13. 游戏进行方式如同常规奇伍德花季号。

-> new_turn

=== new_turn ===
//4 turns
~ turn_number = turn_number + 1
{ turn_number > 4:
	-> end
}
# CLASS: separator
# CLASS: turn 
回合 {turn_number} ({turn_description(turn_number)})

+ [轮到自动机了？] -> turn


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
中央板块: 他对“主要”选择的优先顺序如下:

1) 对公开的板块进行竞标，将“回合顺序”板块作为最后选择; 
2) 在其中一块板块上高于你竞标;
3) “使用”一块板块，首先优先考虑“他的”(比如他目前出价最高的板块)，然后在需要时转向“你的”; 
4) “过度使用”一块板块(即将工人放置在之前使用过的至少有一个工人的板块上)——同样，首先是“他的”，如果需要，然后是“你的”。

在这几个“主要”选择中，对于其他条件都相同的情况下，他会在这些“特定”选项中做出选择，而他的选择则是由以下这个“优先性树”所决定的: 
1) 需要最少工人数量的选项;
2) 涉及他当前拥有最多的工人颜色的选项; 
3) 如果仍然平局，则使用D6来做出最终选择。请注意，这个“优先树”同样会在他在你的家园村庄行动时来决定他的特殊选择，下面将详细解释。

-> choices

=== village_tile ===

#CLASS: important
村庄板块 - 他对“主要”选择的优先顺序如下:

1) “使用”一块板块。当有超过6个可供选择(即为空且可用)的磁砖时，我通常使用D6(六面骰) ，将我的家园板块视为1，然后从第一圈的相邻板块开始，从顶部开始并按顺时针方向移动，如果必要，再到第二圈。(另一个选项是可以使用D10或更大的骰子，从左到右"向下数"每一列; 甚至从一副连续的的牌中抽一张牌也可以，因为这样可以提供一个1-13的随机数);
2) “过度使用”一块板块，如前所述。

-> choices

=== choices ===
+ [新的自动机回合] -> turn

+ [没有更多米宝/行动] -> new_turn


=== end ===

# CLASS: separator
# CLASS: endgame
游戏结束

计算积分并发布在 BGG 上: https:\/\/boardgamegeek.com/thread/944605/keyflower-solitaire

+ 新游戏?
    # RESTART
    -> END
    
    

