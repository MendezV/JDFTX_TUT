#!/usr/bin/gnuplot -persist
set xtics ( "Gamma" 0,  "X" 15,  "W" 23,  "L" 31,  "Gamma" 49,  "K" 68 )
unset key
nRows = real(system("awk '$1==\"kpoint\" {nRows++} END {print nRows}' bandstruct.kpoints"))
nCols = real(system("wc -c < bandstruct.eigenvals")) / (8*nRows)
formatString = system(sprintf("echo '' | awk 'END { str=\"\"; for(i=0; i<%d; i++) str = str \"%%\" \"lf\"; print str}'", nCols))
set xzeroaxis               #Add dotted line at zero energy
set ylabel "E - VBM [eV]"   #Add y-axis label
set yrange [*:10]           #Truncate bands very far from VBM
eV = 1/27.2114              #Value of eV in Hartrees
VBM = 0.227557              #VBM value (HOMO from totalE.eigStats)
xEnd = 68                   #Last x-tic value on k-path
set arrow \
  from first xEnd, graph 0 \
    to first xEnd, graph 1  #Draw separator

set key top right outside
plot \
   for [i=1:nCols] "bandstruct.eigenvals" binary format=formatString u 0:((column(i)-VBM)/eV) w l title "", \
   "Si.dos" u (xEnd+0.5*$2):(($1-VBM)/eV) w l lw 2 title "s", \
   "Si.dos" u (xEnd+0.5*$3):(($1-VBM)/eV) w l lw 2 title "p"
