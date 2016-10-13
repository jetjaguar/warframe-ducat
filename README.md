# warframe-ducat
Scrape program implemented to help pick out most valuable reward in specific mode of the Warframe video game

#Foremost

The management company for Warframe, Digital Extremes, has updated the game to include a system superior to this tool to the base game, so no one should use this repo as anything other than a code exercise.

# How to run program:

0) Prerequisites:

     0.a) Repository is downloaded

     0.b) Web Browser is installed

1) Run 'step1.bat' program from directory. This scrapes the Warframe wiki page for the most current values and configurations of all rewards and generates a .js file

2) Open 'index.html' in your preferred web browser

3) Select the level of mission you are running and it should display a color coded list of ducat values for the various rewards in the tier. The rewards should be arranged in descending order based on the value of the part in ducats.

# Possible bugs:
1) Spaces in directory names in path of step1.bat (e.g. "My Documents"), did some testing after encountered the first time, but if you're having difficulty  running the program, and this is possible try this first

2) Relic tiers (Axi, Meso, etc) are hard coded in, so if in the future more tiers are added, this will affect the program negatively

#Explanation of Program

This is a tool for the popular third person action game, Warframe. Warframe is set in outer space where the player controls a "cyborg ninja suit" or Warframe to fight various enemies. One system in the game is the acquisition of superior  Warframes, Guns, & other weapons from a pocket dimension. In order to acquire said loot, the player acquires a "relic," or simply put a locked box, then completes one of the various missions to open said relic. At the end of the mission, the player opens their relic and may copy their teammate's reward, should they desire. 

There is an computer controlled character in the game that buys the contents of relics at differing prices (to make sure the market isn't saturated with duplicate rewards). Before DE implemented the prices on the copying screen in the game, this tool was a way for the player to see, at a glance, what the most valuable rewards were without having to memorize the table nor scramble to find the answer online in the ~10 seconds they had to choose.
