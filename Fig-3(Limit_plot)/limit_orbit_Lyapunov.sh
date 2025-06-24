datafile1 = 'datafile_1.dat'
datafile2 = 'datafile_2.dat'
datafile3 = 'datafile_3.dat'
datafile4 = 'datafile_4.dat'
datafile5 = 'datafile_5.dat'

Lya = 'Lyapunov_cumulant_with_time.dat'

skip_start = 2
skip_end = 400000

set terminal postscript eps size 8,6 enhanced color font 'Times-New-Roman,22' linewidth 1.5
set output 'Limit_Lyapunov_K_F=0.8.eps'

# Set up the terminal and output settings for the first plot
#set terminal pngcairo size 1600,1200 enhanced font 'Times-New-Roman,28' linewidth 1.5

#set terminal postscript eps size 9, 6 enhanced color font 'Times-New-Roman,18' linewidth 1
#set output 'Limit_Lyapunov_K_F=0.8.png'
set border linewidth 1

set multiplot layout 2,2 	#title "Phase plots and Lyapunov exponent at {K_F=0.8}"

#set output 'limit_me_x.png'

#set label 1 'Y1' at graph 0.2,0.8 font 'Verdana,12' tc rgb 1
#set label 2 'Y2' at graph 0.8,0.2 font 'Verdana,12' tc rgb 2
#set label 3 'Y3' at graph 0.5,0.5 font 'Verdana,12' tc rgb 3
#set label 4 'Y1' at graph 0.2,0.8 font 'Verdana,12' tc rgb 4
#set label 5 'Y2' at graph 0.8,0.2 font 'Verdana,12' tc rgb 5
#set label 6 'Y3' at graph 0.5,0.5 font 'Verdana,12' tc rgb 6
#set label 7 'Y1' at graph 0.2,0.8 font 'Verdana,12' tc rgb 7
#set label 8 'Y2' at graph 0.8,0.2 font 'Verdana,12' tc rgb 8
#set label 9 'Y3' at graph 0.5,0.5 font 'Verdana,12' tc rgb 9
#set label 10 'Y3' at graph 0.5,0.5 font 'Verdana,12' tc rgb 10
#set key at graph 0.25, 0.35 center top vertical spacing 1.2 box
set label 1 "(a)" at graph 0.025, 0.94
#set title 'Limit cycle in x'
set xlabel 'x' offset 1.5,0
set ylabel 'v_x' offset 1.5,0
unset key
#set grid
set xtics 5
set ytics 0.5
set yrange[-1.05:1.05]
# Plot the points before the skip range
plot datafile1 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $6 : NaN) with linespoints lt 1 lw 1 pt 1 ps 2 lc rgb 'pink' title 'Starting', \
     datafile1 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $6 : NaN) with lines lt 1 lw 0.05 lc rgb 'pink' title 'Limit Cycle', \
     datafile2 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $6 : NaN) with linespoints lt 1 lw 1 pt 2 ps 2 lc rgb 'blue' title 'Starting' , \
     datafile2 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $6 : NaN) with lines lt 1 lw 0.04 lc rgb 'blue' title 'Limit Cycle', \
     datafile3 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $6 : NaN) with linespoints lt 1 lw 1 pt 3 ps 2 lc rgb 'green' title 'Starting', \
     datafile3 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $6 : NaN) with lines lt 1 lw 0.03 lc rgb 'green' title 'Limit Cycle' , \
     datafile4 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $6 : NaN) with linespoints lt 1 lw 1 pt 4 ps 2 lc rgb 'brown' title 'Starting', \
     datafile4 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $6 : NaN) with lines lt 1 lw 0.02 lc rgb 'brown'  title 'Limit Cycle', \
     datafile5 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $6 : NaN) with linespoints lt 1 lw 1 pt 6 ps 2 lc rgb 'red' title 'Starting', \
     datafile5 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $6 : NaN) with lines lt 1 lw 0.1 lc rgb 'red' title 'Limit Cycle',\
     
unset label 1

set label 2 "(b)" at graph 0.025, 0.94
#set title 'Limit cycle in y'
set xlabel 'y' offset 1.5,0
set ylabel 'v_y' offset 1.5,0
unset key
#set grid
set xtics 5
set ytics 0.5
set yrange[-1.05:1.05]

plot datafile1 using ($0 < skip_start ? $5 : NaN):($0 < skip_start ? $7 : NaN) with linespoints lt 1 lw 1 pt 1 ps 2 lc rgb 'pink' title 'Starting', \
     datafile1 using ($0 > skip_end ? $5 : NaN):($0 > skip_end ? $7 : NaN) with lines lt 1 lw 0.01 lc rgb 'pink' title 'Limit Cycle', \
     datafile2 using ($0 < skip_start ? $5 : NaN):($0 < skip_start ? $7 : NaN) with linespoints lt 1 lw 1 pt 2 ps 2 lc rgb 'blue' title 'Starting' , \
     datafile2 using ($0 > skip_end ? $5 : NaN):($0 > skip_end ? $7 : NaN) with lines lt 1 lw 0.01 lc rgb 'blue' title 'Limit Cycle', \
     datafile3 using ($0 < skip_start ? $5 : NaN):($0 < skip_start ? $7 : NaN) with linespoints lt 1 lw 1 pt 3 ps 2 lc rgb 'green' title 'Starting', \
     datafile3 using ($0 > skip_end ? $5 : NaN):($0 > skip_end ? $7 : NaN) with lines lt 1 lw 0.01 lc rgb 'green' title 'Limit Cycle' , \
     datafile4 using ($0 < skip_start ? $5 : NaN):($0 < skip_start ? $7 : NaN) with linespoints lt 1 lw 1 pt 4 ps 2 lc rgb 'brown' title 'Starting', \
     datafile4 using ($0 > skip_end ? $5 : NaN):($0 > skip_end ? $7 : NaN) with lines lt 1 lw 0.01 lc rgb 'brown'  title 'Limit Cycle', \
     datafile5 using ($0 < skip_start ? $5 : NaN):($0 < skip_start ? $7 : NaN) with linespoints lt 1 lw 1 pt 6 ps 2 lc rgb 'red' title 'Starting', \
     datafile5 using ($0 > skip_end ? $5 : NaN):($0 > skip_end ? $7 : NaN) with lines lt 1 lw 0.1 lc rgb 'red' title 'Limit Cycle'
unset label 2

set label 3 "(c)" at graph 0.025, 0.94
#set title 'Relative R from geometrical center vs V (Limit cycle)'
set xlabel 'R' offset 1.5,0
set ylabel 'V' offset 1.5,0
unset key
#set grid
unset yrange
set xtics 5
set ytics 0.04
     
plot datafile1 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $3 : NaN) with linespoints lt 1 lw 1.5 pt 1 ps 2 lc rgb 'pink' title 'Starting', \
     datafile1 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $3 : NaN) with lines lt 1 lw 0.01 lc rgb 'pink' title 'Limit Cycle', \
     datafile2 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $3 : NaN) with linespoints lt 1 lw 1 pt 2 ps 2 lc rgb 'blue' title 'Starting' , \
     datafile2 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $3 : NaN) with lines lt 1 lw 0.01 lc rgb 'blue' title 'Limit Cycle', \
     datafile3 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $3 : NaN) with linespoints lt 1 lw 1 pt 3 ps 2 lc rgb 'green' title 'Starting', \
     datafile3 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $3 : NaN) with lines lt 1 lw 0.01 lc rgb 'green' title 'Limit Cycle' , \
     datafile4 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $3 : NaN) with linespoints lt 1 lw 0.5 pt 4 ps 2 lc rgb 'brown' title 'Starting', \
     datafile4 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $3 : NaN) with lines lt 1 lw 0.01 lc rgb 'brown'  title 'Limit Cycle', \
     datafile5 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $3 : NaN) with linespoints lt 1 lw 1.5 pt 6 ps 2 lc rgb 'red' title 'Starting', \
     datafile5 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $3 : NaN) with lines lt 1 lw 0.01 lc rgb 'red' title 'Limit Cycle'
unset label 3

set label 4 "(d)" at graph 0.025, 0.94
#set title 'Cumulative Lyapunov exponent'
set lmargin 8
set xlabel 't' offset 1.5,0
set ylabel '{/Symbol l}' offset 3,0
unset key
unset grid
set xtics 0, 500, 3000
#set ytics rotate by 90
#set ytics format "10^{%T}"     # Use scientific notation for y-axis tics
#set ytics 5 
#set format y "%.tx10^{%L}"
#set yrange [-1e-6:-5e-9]
set ytics -1e-6, 2e-7, -9e-10
#set format y "10^{%T}"
#set format y "%1.2e"
#set ytics 5
#set format y "%.t" 
#unset xtics
#unset ytics
#set format x "%.1tx10^{%L}"
set format x "%.1tx10^{%L}"
set xtics font ",20"
#set bmargin 5

set format y "%.tx10^{%L}"
set ytics font ",18"
#set format y "%.1t"
# Set the grid for better visualization
#set grid
set yrange [-1e-6:-9e-10]
     
plot Lya using 1:2 with linespoints lt 1.3 lw 1.5 pt 6 ps 1 lc rgb 'red' title 'Cumulative Lyapunov exponent', \

unset label 4

unset multiplot
