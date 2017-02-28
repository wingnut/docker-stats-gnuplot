set title title
set terminal qt size 1600,1000 font "Helvetica,20"
set datafile separator ","
set autoscale 
set xdata time
set timefmt '%Y-%m-%dT%H:%M:%S'
set for [i=1:words(fileNames)] linetype i dashtype i linewidth 2
plot for [file in fileNames] file using 1:col with lines title file
pause 5
reread