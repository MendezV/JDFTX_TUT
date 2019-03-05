#!/usr/bin/gnuplot --persist
set xrange [-10:10]
set xlabel "E - Ef [eV]"
mu = 0.6377     #From the final FillingsUpdate line
eV = 1/27.2114
plot \
   "totalE.dosUp" u (($1-mu)/eV):2 w l title "up", \
   "totalE.dosDn" u (($1-mu)/eV):2 w l title "dn" 
