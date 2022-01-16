#Import de la fonction pause pour validation finale
function Pause ($Message="Appuyez sur une touche pour fermer cette fenêtre...")
{
Write-Host -NoNewLine $Message
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host ""}

#Import des users depuis csv
$Computers = @{Import-Csv -Path "C:\tmp\ListeComputer.csv"}
foreach ($computer in $Computers)
{
Invoke-Command -Computername $Computers -ScriptBlock {wusa.exe \\WSUS-SRV\Emergengy_Updates\windows10.0-kb3186568-x64_086bd10d344a5bb614725135a1589cd784d1e768.msu /quiet /norestart} -confirm:$false
}

#Appel de la fonction Pause défini au début
Pause