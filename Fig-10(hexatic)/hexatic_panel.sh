reset
#set terminal pngcairo enhanced size 800,800 font 'Arial,10'
#set output 'order_param_with_insets.png'

set terminal postscript eps size 7,10 enhanced color font 'Times-New-Roman,42' linewidth 1.5
set output 'order_param_with_insets.eps'

set multiplot layout 2,1 #title "Order Parameter and Susceptibility with Insets"
# === Constants (edit these for each dataset) ===
susc_peak_kf1 = 0.686
am_zero_kf1   = 0.729
data1 = 'averaged_data_2.dat'

susc_peak_kf2 = 0.498
am_zero_kf2   = 0.515
data2         ='averaged_data_1.dat'


# === Styles ===
# Common styling
set border linewidth 1
#set tics
#set grid
set lmargin 7
set rmargin 2
set style line 1 lc rgb 'blue' pt 7 ps 1.5 lt 1 lw 2  # order param
set style line 2 lc rgb 'red'  pt 5 ps 1   lt 1 lw 2  # susceptibility
set style line 99 lc rgb 'gray' lw 1 dt 2             # vertical lines


# === Plot 1 ===
set label 1 "(a)" at graph 0.92, 0.08
set xlabel "{K_F}"
set ylabel "{/Symbol y}_6" offset 1.5, 0
#set title "Dataset 1"
#set grid
set xrange [0.5:0.83]
set xtics 0.05
set ytics 0.2
set arrow from susc_peak_kf1, graph 0 to susc_peak_kf1, graph 1 nohead lw 2 lc rgb "red" dt 2
set arrow from am_zero_kf1, graph 0 to am_zero_kf1, graph 1 nohead lw 2 lc rgb "red" dt 2
#set label 2 "Peak Susc." at susc_peak_kf1 + 0.005, graph 0.9 tc rgb "red"

plot data1 using 1:2:3 with yerrorlines ls 1 notitle

# Inset for Plot 1
unset xtics
unset ytics
unset title
unset xlabel
unset ylabel
unset key
unset arrow
unset label 2
unset label 1
unset grid
set origin 0.1, 0.755
set size 0.5, 0.23
set xtics 0.08 offset 0, 0.65 font "Times, 24"
set ylabel "{/Symbol c}" offset 4.6, 0.0 font "Times, 24"
set xlabel "K_F" offset 0, 1.5 font "Times, 24"
set border 1+2+4+8
set ytics 0.02 offset 0.65, 0.0 font "Times, 24"
plot data1 using 1:4 with linespoints ls 2 notitle

# === Plot 2 ===
unset origin
unset xtics
unset ytics
unset xlabel
unset ylabel

set label 3 "(b)" at graph 0.92, 0.08
#set origin 0,0
#set size 0.35,0.35
set xlabel "{K_F}"
set ylabel "{/Symbol y}_6" offset 1.5, 0
#set title "Dataset 2"
#set grid
#set tics
#set xrange [0.4:0.605]
set xtics 0.02
set ytics 0.2
set arrow from susc_peak_kf2, graph 0 to susc_peak_kf2, graph 1 nohead lw 2 lc rgb "red" dt 2
set arrow from am_zero_kf2, graph 0 to am_zero_kf2, graph 1 nohead lw 2 lc rgb "red" dt 2
#set label 2 "Peak Susc." at susc_peak_kf2 + 0.005, graph 0.9 tc rgb "red"
#set xtics 0.02
set xrange [0.41:0.56]
plot data2 using 1:2:3 with yerrorlines ls 1 notitle "Order Parameter"

# Inset for Plot 2
unset xtics
unset ytics
unset title
unset xlabel
unset ylabel
unset key
unset arrow
unset label 3
unset grid
set origin 0.1, 0.255
set size 0.5, 0.23
set xtics 0.04 offset 0, 0.65 font "Times, 24"
set ylabel "{/Symbol c}" offset 4.6 font "Times, 24"
set xlabel "K_F" offset 0, 1.5 font "Times, 24"
set border 1+2+4+8
set ytics 0.02 offset 0.65, 0.0 font "Times, 24"
set xrange [0.41:0.57]
plot data2 using 1:4 with linespoints ls 2 notitle

unset multiplot

