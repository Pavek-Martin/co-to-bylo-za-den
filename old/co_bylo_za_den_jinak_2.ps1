cls
#$DayOfWeek = (Get-Date).ToString("dddd")
#echo $DayOfWeek

function CoByloZaDen ( [int] $d, [int] $m, [int] $y ) {
# prestupny den test
if (( $d -eq 29 ) -and ( $m -eq 2 )) {
#echo "zde"
$PrestupnyDen = (Get-Date -Day 1 -Month 3 -Year $y).ToString("dddd")
#echo $PrestupnyDen
}

# normalni den
$DayOfWeek = (Get-Date -Day $d -Month $m -Year $y).ToString("dddd") # rovnou uz v cestine

# vyhodnoceni presteuny/NEprestupny rok
if ( $PrestupnyDen -notlike $DayOfWeek ) {
echo "$d.$m.$y $DayOfWeek"
}else{
echo "$d.$m.$y tento den neexistuje"
}

} # konec funkce 

CoByloZaDen 28 2 2025
CoByloZaDen 29 2 2025 # neni prestupmej den
CoByloZaDen 1 3 2025
echo "----"
CoByloZaDen 29 3 2020 # byl prestupnej den
CoByloZaDen 13 2 1024 # Patek 13
CoByloZaDen 13 01 2034 # Patek 13

