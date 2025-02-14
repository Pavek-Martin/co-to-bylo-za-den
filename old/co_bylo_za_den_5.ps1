cls

function CoByloZaDen ( [int] $d, [int] $m, [int] $y ) {
# kontrola vstupu den
if (( $d -lt 1 ) -or ( $d -gt 31 )) {
echo "spatne zadany den, den = 1-31; 01-31" 
sleep 3
exit 1
}

# kontrola vstupu mesic
if (( $m -lt 1 ) -or ( $m -gt 12 )) {
echo "spatne zadany mesic, mesic = 1-31; 01-31" 
sleep 3
exit 1
}
# osetreni vstupu pro rok neni zarazeno, roky jako napr 4000 nebo naopat rok cislo 1 apod. netestovany na zpravnost
# pouzivat aktualni rok plus minis neco malo

# zde pro normalni den, neprestupnej
$SpecificDate = Get-Date -Day $d -Month $m -Year $y
[string] $Den = $SpecificDate.DayOfWeek
#echo $Den

# test jestli by prestupnej den 29.2 nebo nebyl, kdyz neni prestupnej rok tak je 29.3 stejnej den napr. Pondeli jako 1.3 (coz je kravina)
# a kdyz je prestupnej rok tak je den v tydny ruznej, takze podle toho se pozna prestupnej rok a neprestupnej
if (( $d -eq 29 ) -and ( $m -eq 2 )) {
#echo "zde"
$dp=$d
$mp=$m
$SpecificDatePrestupnej = Get-Date -Day 1 -Month 3 -Year $y
[string] $DenPrestupnej = $SpecificDatePrestupnej.DayOfWeek
#echo $DenPrestupnej
}


# prevede do $Den do Cestiny
if ( $Den -like "Monday" ){
$Den_Cz = "Pondeli"
}elseif ( $Den -like "Tuesday" ){
$Den_Cz = "Utery"
}elseif ( $Den -like "Wednesday" ){
$Den_Cz = "Streda"
}elseif ( $Den -like "Thursday" ){
$Den_Cz = "Ctvrtek"
}elseif ( $Den -like "Friday" ){
$Den_Cz = "Patek"
}elseif ( $Den -like "Saturday" ){
$Den_Cz = "Sobota"
}elseif ( $Den -like "Sunday" ){
$Den_Cz = "Nedele"
}else{
$Den_Cz = "Chyba den Cz"
}

# vyhodnoceni presteuny/NEprestupny rok
if ( $DenPrestupnej -notlike $Den ) {
#echo "$d.$m.$y $Den" # angl.
echo "$d.$m.$y $Den_Cz" # Cz
}else{
echo "$d.$m.$y tento den neexistuje"
}

} # end funkce

# test prestupny rok
CoByloZaDen 29 2 2020
CoByloZaDen 29 2 2025 # tento den neni !


#exit 1

<#
# testuje nekolik patku 13tyho
CoByloZaDen 13 12 2024
CoByloZaDen 13 06 2025
CoByloZaDen 13 02 2026
CoByloZaDen 13 03 2026
CoByloZaDen 13 11 2026
CoByloZaDen 13 08 2027
CoByloZaDen 13 10 2028
CoByloZaDen 13 04 2029
CoByloZaDen 13 07 2029
CoByloZaDen 13 09 2030
CoByloZaDen 13 12 2030
#>



<#
# testuje prestupny roky
CoByloZaDen 29 2 2020 # je prestupnej rok
CoByloZaDen 29 2 2021 # neni prestupnej rok
CoByloZaDen 29 2 2022 # neni prestupnej rok
CoByloZaDen 29 2 2023 # neni prestupnej rok
CoByloZaDen 29 2 2024 # je prestupnej rok
CoByloZaDen 29 2 2025 # neni prestupnej rok
#>


<#
CoByloZaDen 1 3 1971
CoByloZaDen 2 3 1971
CoByloZaDen 3 3 1971
CoByloZaDen 4 3 1971
CoByloZaDen 5 3 1971
CoByloZaDen 6 3 1971
CoByloZaDen 7 3 1971
#>


<#
CoByloZaDen 28 3 1971
CoByloZaDen 28 03 1971
CoByloZaDen 1 3 1971
CoByloZaDen 01 3 1971
echo "--------------"

CoByloZaDen 28 2 2025
CoByloZaDen 29 2 2025 # tento den neni !
CoByloZaDen 1 3 2025
echo "---------------------"
CoByloZaDen 28 2 2020
CoByloZaDen 29 2 2020 # tento den BYL
CoByloZaDen 1 3 2020
echo "--"
CoByloZaDen 28 2 2024
CoByloZaDen 29 2 2024 # tento den BYL
CoByloZaDen 1 3 2024
echo "---"
CoByloZaDen 28 2 2023
CoByloZaDen 29 2 2023 # tento den neni !
CoByloZaDen 1 3 2023
#>



