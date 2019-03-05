#!/usr/bin/gnuplot --persist
set xrange [-10:10]
set xlabel "E - Ef [eV]"
mu = 0.527266839    #From the final FillingsUpdate line
eV = 1/27.2114
plot \
   "PBE+U.dosUp" u (($1-mu)/eV):2 w l title "up", \
   "PBE+U.dosDn" u (($1-mu)/eV):2 w l title "dn" 

