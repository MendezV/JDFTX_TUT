#!/usr/bin/gnuplot -persist
set xtics ( "Gamma" 0,  "X" 15,  "W" 23,  "L" 31,  "Gamma" 49,  "K" 68 )
unset key
nRows = real(system("awk '$1==\"kpoint\" {nRows++} END {print nRows}' bandstruct.kpoints"))
nCols = real(system("wc -c < bandstruct.eigenvals")) / (8*nRows)
formatString = system(sprintf("echo '' | awk 'END { str=\"\"; for(i=0; i<%d; i++) str = str \"%%\" \"lf\"; print str}'", nCols))
plot for [i=1:nCols] "bandstruct.eigenvals" binary format=formatString u 0:i w l
