#!/usr/bin/gnuplot --persist
set xrange [-10:10]
set xlabel "E - Ef [eV]"
mu = 0.525465784   #From the final FillingsUpdate line
eV = 1/27.2114
plot \
   "PBE.dosUp" u (($1-mu)/eV):2 w l title "up", \
   "PBE.dosDn" u (($1-mu)/eV):2 w l title "dn" 

