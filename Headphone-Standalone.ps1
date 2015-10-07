
######################  Choco  ######################
Set-ExecutionPolicy Unrestricted -Force
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
######################  Choco  ######################

######################  Choco Packages  ######################
choco install python2 -y
choco install azcopy -y
######################  Choco Packages  ######################

######################  uTorrent ######################
$uTorrentUrl = "http://www.utorrent.com/downloads/complete/os/win/track/stable"
$uTorrentExe = "c:\uTorrent.exe"

#DL
iwr -uri $uTorrentUrl -OutFile $uTorrentExe

######################  uTorrent  ######################

######################  Headphones  ######################
$headphonesUrl = "https://github.com/rembo10/headphones/zipball/master"
$headphonesZip = "c:\headphones.zip"
$headphonesUnzip = "c:\headphones\"
$headphonesPy = $headphonesUnzip + "Headphones.py"

#DL
iwr -uri $headphonesUrl -OutFile $headphonesZip

#Unzip
$shell_app = new-object -com shell.application
$zip_file = $shell_app.namespace($headphonesZip)
$destination = $shell_app.namespace($headphonesUnzip)
$destination.Copyhere($zip_file.items())

#Start
Start-Process -FilePath $headphonesPy
######################  Headphones  ######################