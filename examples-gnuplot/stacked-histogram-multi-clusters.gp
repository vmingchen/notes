##############################################
# Shows how to plot stacked histogram with multiple clusters
# 
# Original Name: fs-nfs-ops
# Context: Sigmetrics paper file server figure
#
##############################################

set terminal postscript eps enhanced color
set output "stacked-histogram-multi-clusters.eps"
set xlabel "Injected Network Delay" font "Times-Roman, 26" offset 0,-1
set ylabel "#Requests (million)" font "Times-Roman, 26"

set style data histograms
set style histogram rowstacked
set style fill pattern border -1

set xtics nomirror
set ytics 2 nomirror
set tics font "Times-Roman, 24"

set size 1,0.7

set boxwidth 0.7

set key autotitle columnheader

set style line 1 lc rgb 'red' lt -1 lw 1
set style line 2 lc rgb 'green' lt -1 lw 1
set style line 3 lc rgb 'blue' lt -1 lw 1
set style line 4 lc rgb 'pink' lt -1 lw 1
set style line 5 lc rgb 'purple' lt -1 lw 1
set style line 6 lc rgb 'orange' lt -1 lw 1
set style line 7 lc rgb 'grey' lt -1 lw 1
set style line 8 lc rgb 'light-blue' lt -1 lw 1
set style line 9 lc rgb 'black' lt -1 lw 1

set termoption enhanced

plot \
  newhistogram "{/=24 0ms}", \
    'stacked-histogram-multi-clusters-0ms.dat' using 2:xticlabels(1) fillstyle pattern 1 ls 1, \
    '' using 3:xticlabels(1) fillstyle pattern 2 ls 2, \
    '' using 4:xticlabels(1) fillstyle pattern 5 ls 3, \
    '' using 5:xticlabels(1) fillstyle pattern 7 ls 4, \
    '' using 6:xticlabels(1) fillstyle pattern 4 ls 5, \
    '' using 7:xticlabels(1) fillstyle pattern 6 ls 6, \
    '' using 8:xticlabels(1) fillstyle pattern 2 ls 7, \
    '' using 9:xticlabels(1) fillstyle pattern 3 ls 8, \
    '' using 10:xticlabels(1) fillstyle pattern 4 ls 9, \
  newhistogram "{/=24 10ms}", \
    'stacked-histogram-multi-clusters-10ms.dat' using 2:xticlabels(1) fillstyle pattern 1 ls 1 title '', \
    '' using 3:xticlabels(1) fillstyle pattern 2 ls 2 title '', \
    '' using 4:xticlabels(1) fillstyle pattern 5 ls 3 title '', \
    '' using 5:xticlabels(1) fillstyle pattern 7 ls 4 title '', \
    '' using 6:xticlabels(1) fillstyle pattern 4 ls 5 title '', \
    '' using 7:xticlabels(1) fillstyle pattern 6 ls 6 title '', \
    '' using 8:xticlabels(1) fillstyle pattern 2 ls 7 title '', \
    '' using 9:xticlabels(1) fillstyle pattern 3 ls 8 title '', \
    '' using 10:xticlabels(1) fillstyle pattern 4 ls 9 title ''
