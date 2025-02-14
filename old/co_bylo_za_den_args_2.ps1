#cls

$delka_args = $args.length
#echo "celkem args $delka_args" # int32
if ( $delka_args -lt 3 ) { #int32
echo "program 02 12 2024"
sleep 1
exit 1
}

$d = [int] $args[0]
$m = [int] $args[1]
$y = [int] $args[2]

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


CoByloZaDen $d $m $y

