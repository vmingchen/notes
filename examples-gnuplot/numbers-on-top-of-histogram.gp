##############################################
# Shows how to plot linespoints with yerrorbars
# 
# Original Name: ws-100th-ops_per_sec
# Context: Sigmetrics webserver figure
#
##############################################

set terminal postscript eps enhanced color
set size 1, 0.65
set output "numbers-on-top-of-histogram.eps"
set xlabel "Injected Network Delay (ms)" font "Times-Roman, 26"
set ylabel "Throughput (Kops/s)" font "Times-Roman, 26" offset -2
set style data histogram
set style histogram errorbars gap 1 lw 2
set style fill solid
#set grid ytics
set title ''
set boxwidth 0.8
set tics font "Times-Roman, 24"
set yrange [1:*]
set key right bottom spacing 2.5 font "Times-Roman, 24"
#set logscale y 10
#set format y "10^{%L}"
set key autotitle columnheader
#set key left bmargin font "Time-Roman, 20"
#set key right top at -0.8,1195
set key right top
set key font "Times-Roman, 24" spacing 2.4 width .5 height 0.75 Right
set size 1,0.6

set style line 1 lc rgb 'red' lt -1 lw 1
set style line 2 lc rgb 'blue' lt -1 lw 1

# standard deviation:
#FACTOR=1
# 95% confidence interval:
FACTOR=3.04

plot "numbers-on-top-of-histogram.dat" using 2:($3*FACTOR):xticlabels(1) w histogram fillstyle pattern 1 ls 1 title "V3",\
	 "" using ($0-0.19):($2+12):2  with labels t '' font "Time-Roman, 12", \
	 "" using 4:($5*FACTOR):xticlabels(1) w histogram fillstyle pattern 7 ls 2 title "V4.1p",\
	 "" using ($0+0.16):($4+12):4  with labels t '' font "Time-Roman, 12"
