if [ -e "/usr/local/bin/powershell" ]; then
  echo "found powershell"
else
  curl -L -O "https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.10/powershell-6.0.0-alpha.10.pkg"
  sudo installer -pkg powershell-6.0.0-alpha.10.pkg -target /
  rm powershell-6.0.0-alpha.10.pkg
fi
sudo cp ../../workdocs-NWchecker.ps1 /usr/local/bin
sudo cp workdocs-NWchecker /usr/local/bin
sudo chmod +x /usr/local/bin/workdocs-NWchecker

