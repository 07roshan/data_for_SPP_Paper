#set terminal pngcairo size 1600,2000 enhanced font 'Times-New-Roman,44' linewidth 2
#set output 'plot_N=7_19.png'

set terminal postscript eps size 7,10 enhanced color font 'Times-New-Roman,42' linewidth 1.5
set output 'plot_N=7_19.eps'

set multiplot layout 2,1 title

# Common styling
set border linewidth 1
set tics
#set grid
set lmargin 6
set rmargin 2
set style line 1 lt 1 lw 2 pt 2 ps 1.5 lc rgb 'blue'
set style line 2 lt 1 lw 2 pt 5 ps 1.5 lc rgb 'red'

### --- Subplot (a): N = 7 ---
datafile1 = 'filtered_data_N=7.dat'
set label 1 "(a)" at graph 0.025, 0.94
set xlabel "{K_F}"
set ylabel "{/Symbol w}" offset 1.5,0
set key at 1.0913, 0.8 right top box opaque
set xrange [0.755:1.1]
set yrange [-0.05: 1.1]
#set title "Angular frequency vs coupling constant for N = 7"

plot \
    datafile1 using 9:1:2 with errorbars ls 1 title "Inner", \
    '' using 9:1 smooth csplines ls 1 notitle, \
    '' using 9:3:4 with errorbars ls 2 title "Outer Ring", \
    '' using 9:3 smooth csplines ls 2 notitle


unset label 1
### --- Subplot (b): N = 19 ---
datafile2 = 'filtered_data_N=19.dat'
set label 2 "(b)" at graph 0.025, 0.96
set xlabel "{K_F}"
set ylabel "{/Symbol w}" offset 1.5,0
set key at 0.5585, 0.32 right top box opaque
set xrange [0.506:0.56]
set yrange [-0.01:0.45]
set ytics 0.1
#set title "Angular frequency vs coupling constant for N = 19"

plot \
    datafile2 using 9:1:2 with errorbars ls 1 title "Inner", \
    '' using 9:1 smooth csplines ls 1 notitle, \
    '' using 9:3:4 with errorbars ls 2 title "Outer Rings", \
    '' using 9:3 smooth csplines ls 2 notitle

unset multiplot

