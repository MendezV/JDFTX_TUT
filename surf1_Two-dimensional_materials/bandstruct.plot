#!/usr/bin/gnuplot -persist
set xtics ( "Gamma" 0,  "M" 25,  "K" 44,  "Gamma" 82 )
unset key
nRows = real(system("awk '$1==\"kpoint\" {nRows++} END {print nRows}' bandstruct.kpoints"))
nCols = real(system("wc -c < bandstruct.eigenvals")) / (8*nRows)
formatString = system(sprintf("echo '' | awk 'END { str=\"\"; for(i=0; i<%d; i++) str = str \"%%\" \"lf\"; print str}'", nCols))
set xzeroaxis               #Add dotted line at zero energy
set ylabel "E - VBM [eV]"   #Add y-axis label
set yrange [*:10]           #Truncate bands very far from VBM
eV = 1/27.2114              #Value of eV in Hartrees
VBM = -0.155824413             #VBM value (HOMO from totalE.eigStats)

plot for [i=1:nCols] "bandstruct.eigenvals" binary format=formatString u 0:((column(i)-VBM)/eV) w l

