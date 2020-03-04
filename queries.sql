#Determine which concession item sells best
SELECT CONC_NAME, MAX(REVENUE) FROM CONCESSIONS;
#

#Determine which player's jersey contributes the most revenue to the franchise
SELECT NAME, MAX(REVENUE) FROM JERSEY;
#

#Determine the overall profit a team makes in a total season.
SELECT NAME, TOTALREVENUE FROM TEAM;
#

# Determine ratio amount of stadium workers in comparison to tickets sold when tickets sold is above 17000.
SELECT GAME_NO, ((TICKETSOLD) / (COUNT(WORKERID))) AS RATIO FROM GAME, STADIUMWORKER WHERE TICKETSOLD>17000;
#

#List players receiving x<3000000 of money per season
SELECT NAME, SALARY FROM PLAYER WHERE SALARY<3000000 ORDER BY SALARY DESC;
#

#List players receiving x>7000000 of money per season
SELECT NAME, SALARY FROM PLAYER WHERE SALARY>7000000 ORDER BY SALARY DESC;
#

#Determine games when the stadium attendance was over 75%
SELECT GAME_NO, (ATTENDANCE/CAPACITY) FROM GAME, STADIUM WHERE (ATTENDANCE/CAPACITY)>.75;
#

#List the average amount of money spent per person on concessions at the games throughout the season in descending order
SELECT GAME_NO, ((ATTENDANCE/CONCESSION_REVENUE)*100) AS AVG_SPENT FROM GAME ORDER BY AVG_SPENT DESC; 
#