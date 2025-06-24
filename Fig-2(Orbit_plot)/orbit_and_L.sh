# Set the data file

datafile1='datafile_1.dat'
datafile2='datafile_2.dat'
datafile3='datafile_3.dat'
datafile4='datafile_4.dat'
datafile5='datafile_5.dat'
datafile6='datafile_6.dat'
datafile7='datafile_7.dat'

datafile10='datafile_10.dat'
datafile11='datafile_11.dat'
datafile12='datafile_12.dat'
datafile13='datafile_13.dat'

# Range of rows to skip
skip_start = 2
skip_end = 400000

# Set up the terminal and output settings for the first plot
#set terminal pngcairo size 1600,1700 enhanced font 'Times-New-Roman, 28' linewidth 2
#set output 'Trajectory_torque_K_F=0.8.png'
set terminal postscript eps size 8, 8 enhanced color font 'Times-New-Roman,22' linewidth 1.5
set output 'Trajectory_torque_K_F=0.8.eps'

#set terminal pdfcairo font "Times-New-Roman, 18" linewidth 1
#set output "plot.pdf"

set border linewidth 1.5

set multiplot layout 3,2
#set title "Trajectory, angular momentum and torque at {K_F=0.8}"

set origin 0.0, 0.52  # Position the first plot in the top-left corner
set label 1 "(a)" at graph 0.025, 0.94
set size ratio 1

set size 0.5, 0.5
set xrange [-19.5:19.5]
set yrange [-19.5:19.5]

unset xtics
unset ytics

fixed_points = "4 4\n6 6\n4 6\n6 4"

#set title 'Limiting orbit'
set xlabel 'x'
set ylabel 'y'
unset key

plot '-' using 1:2:(0.4) with circles lc rgb "black" fs solid 0.8 notitle,\
     datafile1 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 1 ps 2 lc rgb 'pink' title 'Starting', \
     datafile1 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.05 lc rgb 'pink' title 'Limit Cycle', \
     datafile2 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 2 ps 2 lc rgb 'blue' title 'Starting' , \
     datafile2 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.04 lc rgb 'blue' title 'Limit Cycle', \
     datafile3 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 3 ps 2 lc rgb 'green' title 'Starting', \
     datafile3 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.03 lc rgb 'green' title 'Limit Cycle' , \
     datafile4 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 4 ps 2 lc rgb 'brown' title 'Starting', \
     datafile4 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.02 lc rgb 'brown'  title 'Limit Cycle', \
     datafile5 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 6 ps 2 lc rgb 'red' title 'Starting', \
     datafile5 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.1 lc rgb 'red' title 'Limit Cycle'

-4 -4
-4 4
4 -4
4 4
e
unset label 1

set origin 0.5, 0.52  # Position the first plot in the top-left corner
set label 2 "(b)" at graph 0.025, 0.94
set size ratio 1
set size 0.5, 0.5 
set xrange [-19.5:19.5]
set yrange [-19.5:19.5]

unset xtics
unset ytics

fixed_points = "4 4\n6 6\n4 6\n6 4"

#set title 'Limiting orbit'
set xlabel 'x'
set ylabel 'y'
unset key

plot '-' using 1:2:(0.4) with circles lc rgb "black" fs solid 0.8 notitle,\
     datafile6 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 3 ps 2 lc rgb 'pink' title 'Starting', \
     datafile6 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.05 lc rgb 'pink' title 'Limit Cycle', \
     datafile7 using ($0 < skip_start ? $4 : NaN):($0 < skip_start ? $5 : NaN) with linespoints lt 1 lw 2 pt 4 ps 2 lc rgb 'blue' title 'Starting', \
     datafile7 using ($0 > skip_end ? $4 : NaN):($0 > skip_end ? $5 : NaN) with lines lt 1 lw 0.04 lc rgb 'blue' title 'Limit Cycle', \
     

-4 -4
-4 4
4 -4
4 4
e
unset label 2

set label 3 "(c)" at graph 0.025, 0.94
set size ratio 0
skip_start1 = 0
skip_end1 = 450000
set autoscale
set origin 0.0,0.255   
set size 0.5,0.28    
#set xrange [2:4]
#set yrange [-1:1]
unset xlabel
unset ylabel
unset key
#set format x ""
#set format y ""
#plot cos(x)
set xtics
set ytics 2
set xlabel 'R'
set ylabel 'L'
plot datafile1 using ($0 < skip_start1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 < skip_start1 ? ($4*$7-$5*$6) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'pink' title 'Starting', \
     datafile1 using ($0 > skip_end1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 > skip_end1 ? ($4*$7-$5*$6) : NaN) with lines lt 1 lw 0.1 lc rgb 'pink' title 'Limit Cycle', \
     datafile2 using ($0 < skip_start1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 < skip_start1 ? ($4*$7-$5*$6) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'red' title 'Starting' , \
     datafile2 using ($0 > skip_end1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 > skip_end1 ? ($4*$7-$5*$6) : NaN) with lines lt 1 lw 0.1 lc rgb 'red' title 'Limit Cycle', \

unset label 3


set label 4 "(d)" at graph 0.025, 0.94
set origin 0.5,0.255   # Inset position relative to full canvas
set size 0.5,0.28       # Inset size
#set xrange [2:4]
#set yrange [-1:1]
unset xlabel
unset ylabel
unset key
#set format x ""
#set format y ""
#plot cos(x)
set xtics
set ytics 2
set xlabel 'R'
set ylabel 'L'
plot datafile6 using ($0 < skip_start1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 < skip_start1 ? ($4*$7-$5*$6) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'pink' title 'Starting', \
     datafile6 using ($0 > skip_end1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 > skip_end1 ? ($4*$7-$5*$6) : NaN) with lines lt 1 lw 0.1 lc rgb 'pink' title 'Limit Cycle', \
     datafile7 using ($0 < skip_start1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 < skip_start1 ? (($4*$7-$5*$6)) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'blue' title 'Starting' , \
     datafile7 using ($0 > skip_end1 ? (sqrt($4*$4 + $5*$5)) : NaN):($0 > skip_end1 ? (($4*$7-$5*$6)) : NaN) with lines lt 1 lw 0.1 lc rgb 'blue' title 'Limit Cycle', \
     

unset label 4

set origin 0.0, 0.0  # Position the third plot in the bottom-left corner
set label 5 "(e)" at graph 0.02, 0.94
set size ratio 0
set size 0.5, 0.25
unset xrange
unset yrange
unset xlabel
unset ylabel
#set autoscale
set lmargin 6
#set title 'Time vs Angular velocity'
set xlabel 't'
set ylabel '{/Symbol w}' offset 1.5,0
unset key
#set grid
set xrange [450:500]
set yrange [-1.1:1]
set xtics 10   
set ytics 0.5
plot datafile1 using ($0 < skip_start ? $9 : NaN):($0 < skip_start ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'pink' title 'Starting', \
     datafile1 using ($0 > skip_end ? $9 : NaN):($0 > skip_end ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with lines lt 1 lw 0.1 lc rgb 'pink' title 'Limit Cycle', \
     datafile2 using ($0 < skip_start ? $9 : NaN):($0 < skip_start ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'blue' title 'Starting' , \
     datafile2 using ($0 > skip_end ? $9 : NaN):($0 > skip_end ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with lines lt 1 lw 0.1 lc rgb 'blue' title 'Limit Cycle', \
     datafile3 using ($0 < skip_start ? $9 : NaN):($0 < skip_start ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'green' title 'Starting', \
     datafile3 using ($0 > skip_end ? $9 : NaN):($0 > skip_end ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with lines lt 1 lw 0.1 lc rgb 'green' title 'Limit Cycle' , \
     datafile4 using ($0 < skip_start ? $9 : NaN):($0 < skip_start ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'brown' title 'Starting', \
     datafile4 using ($0 > skip_end ? $9 : NaN):($0 > skip_end ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with lines lt 1 lw 0.1 lc rgb 'brown'  title 'Limit Cycle', \
     datafile5 using ($0 < skip_start ? $9 : NaN):($0 < skip_start ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with linespoints lt 1 lw 2 pt 4 ps 1 lc rgb 'red' title 'Starting', \
     datafile5 using ($0 > skip_end ? $9 : NaN):($0 > skip_end ? (($4*$7-$5*$6)/sqrt($4*$4 + $5*$5)) : NaN) with lines lt 1 lw 0.1 lc rgb 'red' title 'Limit Cycle'


unset label 5

set origin 0.5, 0.0  # Position the fourth plot in the bottom-right corner
set label 6 "(f)" at graph 0.02, 0.94
set size ratio 0
set size 0.5, 0.25

set autoscale
#set title 'Time vs Torque'
set xlabel 't'
set ylabel '{/Symbol t}' offset 1,0
unset key
#set grid
set xrange [450:500]
set xtics 10   
set ytics 2
plot datafile10 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $2 : NaN) with linespoints lt 1 lw 3 pt 4 ps 2 lc rgb 'pink' title 'Starting', \
     datafile10 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $2 : NaN) with lines lt 1 lw 0.1 lc rgb 'pink' title 'Limit Cycle', \
     datafile11 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $2 : NaN) with linespoints lt 1 lw 3 pt 4 ps 2 lc rgb 'blue' title 'Starting', \
     datafile11 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $2 : NaN) with lines lt 1 lw 0.1 lc rgb 'blue' title 'Limit Cycle', \
     datafile12 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $2 : NaN) with linespoints lt 1 lw 3 pt 4 ps 2 lc rgb 'green' title 'Starting', \
     datafile12 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $2 : NaN) with lines lt 1 lw 0.1 lc rgb 'green' title 'Limit Cycle', \
     datafile13 using ($0 < skip_start ? $1 : NaN):($0 < skip_start ? $2 : NaN) with linespoints lt 1 lw 3 pt 4 ps 2 lc rgb 'red' title 'Starting', \
     datafile13 using ($0 > skip_end ? $1 : NaN):($0 > skip_end ? $2 : NaN) with lines lt 1 lw 0.1 lc rgb 'red' title 'Limit Cycle', \

unset label 6

unset multiplot
