# processing-sketches
This is my collection of sketches in Java Processing.
I do these sketches purely as a timed exercise to keep my skills sharp;
as a result,
- The code isn't the most beautiful or elegant code ever written.
- The code is definitely not bug-free.
- This repository will keep growing and changing as I add new sketches and edit old ones.
- If you want to, you are free to copy/modify/steal the code at anytime.

## Screenshots and brief explanation.

### `ca`
![ca](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/ca/frame.png)
This is an implementation of Wolfram's Cellular Automata in processing.  You can change the rule number however you like,
and the cellular automata generated will reflect that rule.  Shown in this screenshot is rule 18.

### `colorrings`
![colorrings](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/colorrings/frame.png)
In this sketch, perlin rings, with color based on a gradient, are drawn across the screen,
giving the impression of motion and change as it moves from left to right.

### `flowfield`
![flowfield](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/flowfield/frame.png)
This is the classic Perlin Flow Field with a twist; the velocities of the particles are slightly randomized when the
particles are within a letter, giving the impression of the particles "writing" the text on the screen.

### `particlelines`
![particlelines](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/particlelines/frame.png)
A very simple implementation of some moving dots and connections drawn in between them.  This still gives some very
nice-looking behavior and interplay between the particles.

### `ripples`
![ripples](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/ripples/frame.png)
Still using perlin noise, a series of concentric yet gradually changing perlin rings are drawn on the screen.
The end result to me looks something like ripples in fabric or water; it has a very organic feel to it.

### `dotfield`
![dotfield](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/dotfield/frame.png)
More perlin noise, this time making a plane of dots that undulates in three dimensions.

### `asciify`
```
-..........-----............................----+@###############@.       +
........----++++----....................-----++@@@##@@@@@+++++++@+.       -
---...........--................-----+++@@@@@@@@++++-----.....----.......-+
++++-----------..........----++++@@@@@@@+++-----.........----............--
@@@@@@@@+-++-...-++--++++@@@@@@@+++-----...............-------......-------
++++++@++++-    .+++++@+@@@@@@+--+++++--------..........------.----+++++++-
-++++++++++-     -+++++++++++++++@@@@+++@@++++++++---+++----+@@@@@#########
+++++++++++.     -+++++++++++++++++++++++++++++++++++@@@-   -##############
------------....-------++++++++++++@@++++++++++-+++++@@@.   .@###########@@
--------------------+++@@@@++@@@@@@##@@@@###@@+-----++@@.. .-@#######@@@+-.
--...-----------...--++@@@@@##########@###@#####@----++@@@@@@####@@@@@@@+++
.........------.....--++@@#####@##@##############@---++@@@@@@@@@@@@@@@@@@@@
..     ......---....--++@##############@@@#######+.-+++++++++++++@@@@@@@@@@
---....--.....--....--+@############@++-++++++@@+-..-.--++++++++++@@@@@@@@@
+++----+++------------+#########@@@+--..........-+-....--+++++++++@@@++++++
@@+--++@@@@-.---..----+##########@+---...........---------+++++++++@++++@@@
@++----@@@#+----..----+@########@+---++@@@@+...-+@@++---------+-+++@+++@@+@
@@++++@@@@@@++@@+--+--++########+---+++--+++-..-+++#@+--++-..-----++@@@@+-+
@@@@+@@++++@@@#@@+@@+++@@######@+-----+-++----..+@+@@++@++-...++-...+@@@+--
@@@@@@--+++@@@+++++@++++@@@+@@##+---........--..------++@@+---+--..-++-++--
#####@+-+++++++++++++-++@+-.-++#@+--.......--........-+++@++++-........---+
@#####@-+++++++++++++-++++-..--+@++--... ..------...-+@@@@@@++-        ..+@
@@@@@@@++@@@@@@@@+-++@++++------+++---.....--------+++@@@@@++--.   ..----+@
@@@@@@@@@@@@@@@@@++++@#@++++++-@++++----.-++----+--++@@@@@@++--.---++++-+@@
##@@@@@@@@@@@@@@@@@#+++++@@@+@@+@@+++---------..--..----+++++++@@#####@+@##
#@@@@@@@@@@@@@@@@@++++--++-.-+++++@++++++--------.......-+++++@@@@###@+@@##
####@@@@@@@@@@@@+---++-----++++---++@@+@++---..---+@@@@@@@++++@@@@@@@+++@##
######@@@@@@@@++-+---+----@@@@+----+++++@@++-..-@@@@@@@@@@@@@@@@@@@@@@@+@@@
#######@@@@@@+-+++++--+---++@++--..---++---+..  -@@@@@@@@@@@@@@@@@@@@@@@@@@
########@##@+-----+++++++----++--...-------+..  .-+@@@@@@@@@@@@@@@@@@@@#@@+
##########@+--------++++++-----------------@.. .----++@@@@@@@@@@@@@@@@@#@@+
#########++----------++++++---.----------+++..-+----++++@@@@@@@@@@@@@@@@@@@
########@+++++++-------++++++--..---++++++++-++++++++++++@@@@@@@@@@@@@@#@@@
########@@@@@+++++++++++++++@+++--.---++++++++++++++++++++@@@@@@@@@@@@@####
#########++++-+++++++++++++++@@++++-----.-++++++++++@++++++@@@@@@@@@@@@####
########+++++-+--++++@@@@@@@@@@@@++++++---++@@@@++++@@++++++@@@@@@@@@@@@###
#######+++++++---+++++++@@@@@@@@@@@@@@@@++@+@@@@++++@@++++++@@@@@@@@@#@@@@#
######@+++++++++++++++++++@@@@@@@@@#@@@@@@@@@@+++++++@++++++@########@+++++
#####@++++++++++++++++++++@@@@@@@@@@@@@@@@@+@@+++++++@+++++++@########++++-
#####@+++++++++++++++++@@@@@@@@@@@@@@+@@@@@+@@+@++-----+++++++########@@@@@
@####@+++++++@++@@@@+++++@@@@@@@@++@@+@@@@@@@@+@+-------+@++++@########@@++
@@@##++++++++@@@@@@#@@@++@@@@@@@@@@@@+@@@@@@@@@@+--------@+++++#######@++++
@@###+++++++++@@@@@@#@@@@++@@@@@@@@@@@@@@@@@@@@@-------++@@++++@@@@+++-----
@@##@+++++++++@@@@@@@#@@@@@@@@@@@@@@@@@@#@@##@@@--------++++++-++------... 
@@##@+++++++@@@@@@@@@@#@@@@@@@@@@@@@@@@##@###@@++-------++--------....     
@@@@@++++++@@@@@@@@@@@##@@@@@@@@@@@@@@@#####@++++--------+----...         .
###@@+++++@@@@@@@@@@@@###@@@@@@@@@@@#@@####++-++-----+---....         .--+@
###@@++++++@@@@@@@@@#@####@@@@@@@@####@###@--+-+++---..            .-+@@@@@
###@@+@@@@+++@@@@@@@######@@-.--+@##@@--.++-+++--..            .-+@#@@@@@@@
@@@@@+@@@@@@@@@@@@@@@@###@-.....--+@++---++-+-.           ..-+@@#@@@@@@@+++
--++@++@@@@@@@@@##@@@@@#+...........-++--++++-.       ..--+@@##@@@@@@++++++
--++@@@@@@@@@@@@@@###@++-.   ............-@+++-     .-+@@#@@@@@@@+++++++++-
---+++@@@@@@@@@@@@@@+---.    ..--..---.  .+@+++.    +@@@@@@@@+++--+++--+---
+...---++@@@@@@@@@@--...-.   ......--......@+++-.   .++++@++++---++--+-----
@.......---++@@@+-..-...... .........  .   .@+++-    .-+-+-----+-----------
+..........---. .--.-..........   ........  -@+++.    -+-------------------
```
Convert images to ascii art.

### `swirlportrait`
![swirlportrait](https://raw.githubusercontent.com/brandon-gong/processing-sketches/master/swirlportrait/frame.png)
Convert images into swirly, weird things.  The swirl gets thicker and thinner to reflect the darkness of the
picture.  The further you stand and look at it, the clearer you see the image.

