# SignalNoise
***Scripts to calculate Signal/Noise in UCE data


These are the skeletal components of the my signal to noise pipeline. The first series of scripts (python) need to take nexus.rates files that TAPIR makes and strip them of information that I need to feed into Mathematica. These text files will then be read by Mathematica and the pertinent bits of information will be stored and used to calculate signal/ noise. The pertinent bits of information are:

1)The six substitution matrix values
2)The four base pair frequeies
3)The list of site rate values
4)The root branch length
5)The age of the node of interest
