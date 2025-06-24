# Set terminal and output
set terminal postscript eps size 9,10 enhanced color font 'Times-New-Roman,48' linewidth 1.5
set output 'stacked_plot.eps'

# Vertical line positions
xline1 = 400
xline2 = 600

# Data files
file1 = 'MSD_N=10_Kf=0.7.dat'
file2 = 'MSD_N=10_Kf=0.73.dat'

set datafile separator whitespace
set key autotitle columnhead

stats file1 nooutput
lastcol = STATS_columns

# Set multiplot layout
set multiplot layout 2,1 title margins 0.1,0.95,0.1,0.95 spacing 0,0


set arrow 1 from first xline1, graph 0 to first xline1, graph 1 nohead lc rgb "black" dt 2 lw 2
set arrow 2 from first xline2, graph 0 to first xline2, graph 1 nohead lc rgb "black" dt 2 lw 2


set label 1 '{/Times-New-Roman Pe}{/Symbol \256}{/Symbol \245}' at graph 0.24, 0.93
set label 2 '{/Times-New-Roman Pe}=1' at graph 0.57, 0.93
set label 3 '{/Times-New-Roman Pe}=0.04' at graph 0.78, 0.93
set label 4 '(a)' at graph 0.05, 0.06

set xlabel ""     # No xlabel for top plot
set ylabel "L" offset 2
#set grid
unset xtics 
set ytics 4
set key top right
set yrange[-1.5:12]
plot file1 using lastcol:1 with lines lw 2 title '{K_F=0.70}' at graph 0.83, 0.06

unset label 1
unset label 2
unset label 3
unset label 4


set xtics
set label 4 '(b)' at graph 0.05, 0.06
set xlabel "t"
set ylabel "L" offset 1
set ytics 2
#set grid
#set key top right
set yrange[-1.0:6]
plot file2 using lastcol:1 with lines lw 2 lc rgb 'red' title '{K_F=0.73}' at graph 0.83, 0.07

unset multiplot