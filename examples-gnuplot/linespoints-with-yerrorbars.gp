##############################################
# Shows how to plot linespoints with yerrorbars
# 
# Original Name: ICE-vs-IC-1m-64kio
# Context: compare ICE vs IC in secure proxy
#
##############################################

set terminal postscript eps enhanced color
set output "linespoints-with-yerrorbars.eps"
set xlabel "Read-to-Write Ratio (n:m)" font "Times-Roman, 26" offset 0,-0.4
set ylabel "Relative Speed: ICE over IC (%)" font "Times-Roman, 26" offset -0.5,-1.6
set style data linespoints
#set style histogram errorbars gap 1 lw 2
set style fill solid border -1
#set grid ytics
set title ''
set boxwidth 0.8
set tics font "Times-Roman, 24"
set yrange [80:120]
set xtics offset 0,-0.4,0
set ytics 80,10 offset 0,0.4,0
set bmargin 4

set key autotitle columnheader
set key at 6.8,119 spacing 3.5 font "Times-Roman, 24"
set size 1,0.7

set style line 1 lt 1 lc rgb "red" pt 3 ps 3 lw 5
set style line 2 lt 1 lc rgb "violet" pt 5 lw 5 ps 3
set style line 3 lt 1 lc rgb "green" pt 7 lw 5 ps 3
set style line 4 lt 1 lc rgb "blue" pt 9 lw 5 ps 3

set arrow from 0,100 to 8,100 nohead lc rgb "black" lt 2 lw 10 front

# std -> confidence interval
CI=3.04

plot "linespoints-with-yerrorbars.dat" using 11:xtic(1) w linespoints ls 1 notitle, \
  "linespoints-with-yerrorbars.dat" using 11:($12 * CI):xtic(1) w yerrorbar ls 1 title "30ms", \
  "linespoints-with-yerrorbars.dat" using 8:xtic(1) w linespoints ls 2 notitle, \
  "linespoints-with-yerrorbars.dat" using 8:($9 * CI):xtic(1) w yerrorbar ls 2 title "20ms", \
  "linespoints-with-yerrorbars.dat" using 5:xtic(1) w linespoints ls 3 notitle, \
  "linespoints-with-yerrorbars.dat" using 5:($6 * CI):xtic(1) w yerrorbar ls 3 title "10ms", \
  "linespoints-with-yerrorbars.dat" using 2:xtic(1) w linespoints ls 4 notitle, \
  "linespoints-with-yerrorbars.dat" using 2:($3 * CI):xtic(1) w yerrorbar ls 4 title "0ms"
