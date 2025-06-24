datafile1 = 'MSD_N=10_Kf=0.5.dat' 
datafile2 = 'MSD_N=10_Kf=0.695.dat' 
datafile3 = 'MSD_N=10_Kf=0.73.dat'
datafile4 = 'MSD_N=10_Kf=0.75.dat'

set terminal postscript eps size 10, 7.5 enhanced color font 'Times-New-Roman,58' linewidth 1.5
set output 'MSD_plots_N=10.eps'
#set terminal pngcairo size 2000,1500 enhanced font "Times-New-Roman,46" linewidth 1.5
#set output 'MSD_plots_N=10.png'

set multiplot
#set multiplot layout 1,2 title "MSD Analysis for 10 SPPs"

# General settings for both plots
#set grid
set style data linespoint
set key bottom right box
#set key font "Times-New-Roman,50" #For png
set key font "Times-New-Roman,48" #For eps
set key width 0.1
set lmargin 6
#set rmargin 2
# First plot: Column 9 (MSD(θ)) vs Column 11 (Time)
#set title "MSD(θ) vs Time"
#set xlabel "Time"
#set ylabel "MSD(θ)"
#plot \
#datafile1 using 11:9 title 'K_f = 0.71' lw 1 , \
#datafile2 using 11:9 title 'K_f = 0.71' lw 1 , \
#datafile3 using 11:9 title 'K_f = 0.71' lw 1 , \
#datafile4 using 11:9 title 'K_f = 0.71' lw 1 

# Second plot: Column 10 (MSD(r)) vs Column 11 (Time)
#set title "MSD(r) vs Time"
set xlabel "t" offset 0,0.5
set ylabel "MSD(r)" offset 2,0
#set legend 
set xrange [1:2.8]
set yrange [1.7:2.6]
#set xtics 0.2 offset 0, 0.45 font "Times, 48"
plot \
datafile1 using (log10($11)):(log10($10)) every 1000 with linespoints title '{K_F} = 0.5' lw 1 pt 1 ps 1 lc rgb 'purple', \
datafile2 using (log10($11)):(log10($10)) every 1000 with linespoints title 'K_F = 0.695' lw 1 pt 4 ps 1 lc rgb 'red', \
datafile3 using (log10($11)):(log10($10)) every 2000 with linespoints title 'K_F = 0.73' lw 1 pt 7 ps 1 lc rgb 'green', \
datafile4 using (log10($11)):(log10($10)) every 2000 with linespoints title 'K_F = 0.75' lw 1 pt 10 ps 1 lc rgb 'blue'


# Inset plot
unset xlabel
unset ylabel
#set size ratio 0.6
set size 0.6,0.4         # Size of inset (width, height)
set origin 0.35,0.33      # Position of inset (x, y)
set xrange [2.6:2.75]         # Zoomed range for inset
set yrange [2.33:2.5]
set xtics 0.05
set ytics 0.05
unset key               # Optionally hide legend for inset
set border 1+2+4+8       # Draw full box border
plot \
datafile1 using (log10($11)):(log10($10)) every 300 with linespoints title 'K_F = 0.5' lw 0.5 pt 1 ps 1.5 lc rgb 'purple', \
datafile2 using (log10($11)):(log10($10)) every 500 with linespoints title 'K_F = 0.695' lw 0.5 pt 4 ps 1.0 lc rgb 'red', \
datafile3 using (log10($11)):(log10($10)) every 5000 with linespoints title 'K_F = 0.73' lw 0.5 pt 7 ps 1.0 lc rgb 'green', \
datafile4 using (log10($11)):(log10($10)) every 5000 with linespoints title 'K_F = 0.75' lw 0.5 pt 10 ps 1.5 lc rgb 'blue'

# End multiplot
#unset multiplot
