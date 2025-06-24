#set terminal pngcairo size 2000,2000 enhanced font 'Times-New-Roman,44' linewidth 2.5
#set output 'rdf_with_inset.png'

set terminal postscript eps size 10,10 enhanced color font 'Times-New-Roman,58' linewidth 1.5
set output 'rdf_inset_3d.eps'

set multiplot
set style line 1 lt 1 lw 2 pt 2 ps 1.5 lc rgb 'blue'
set style line 2 lt 1 lw 2 pt 5 ps 1.5 lc rgb 'red'
### MAIN PLOT ###
set border linewidth 1
set origin 0,0
#set rmargin 1
set size 1,1
#set grid
set xlabel 'r / {/Symbol s}'
set ylabel 'g(r)'
unset ytics
set yrange [0:3.6]
set xrange [0: 15]
#set title 'Radial Distribution Function'
plot 'rdf_output.dat' using 1:2 with lines lt 2 lw 2 lc rgb "black" notitle


# Inset of particle positions 
unset title
unset xlabel
unset ylabel
unset key
unset xtics
unset ytics
unset xrange
unset yrange
unset border


set origin 0.5, 0.5    
set size 0.47, 0.47  
#set rmargin 0.5
set object 1 rect from screen 0.54, 0.54 to screen 0.92, 0.94 behind fc rgb "white" fillstyle solid 1.0 border lc rgb "black"
set xrange [11:28]
set yrange [11:28]


set view equal xyz
set style data points
set style fill solid 1.0
set pm3d depthorder
unset key

circle_diameter = 1.012
circle_radius = circle_diameter / 2.0

plot 'position_data.txt' using 1:2:(circle_radius) with circles lc rgb "gray" fs solid 1.0 border lc rgb "#404040" notitle

unset object 1
unset multiplot
