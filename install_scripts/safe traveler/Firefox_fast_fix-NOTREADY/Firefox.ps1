# Close Firefox
Get-Process -Name firefox -ErrorAction Ignore | Stop-Process -Force
Start-Sleep -Seconds 1



Invoke-WebRequest @Parameters

# Download user.js
#$Parameters = @{
#	Uri = "https://raw.githubusercontent.com/farag2/Mozilla-Firefox/master/user.js"
#	OutFile = "$env:APPDATA\Mozilla\Firefox\Profiles\$ProfileName\user.js"
#	Verbose = [switch]::Present
#}

Invoke-WebRequest @Parameters

# Check whether extensions installed
$Extensions = @{
	# uBlock Origin
	"$env:APPDATA\Mozilla\Firefox\Profiles\$ProfileName\extensions\uBlock0@raymondhill.net.xpi" = "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/"
	# httpseverywhere
	"$env:APPDATA\Mozilla\Firefox\Profiles\$ProfileName\extensions\https_everywhere-2020.8.13-an+fx.xpi?src=dp-btn-primary" = "https://addons.mozilla.org/firefox/downloads/file/3625427/https_everywhere-2020.8.13-an+fx.xpi?src=dp-btn-primary"
	# Canvas Blocker
	"$env:APPDATA\Mozilla\Firefox\Profiles\$ProfileName\extensions\canvasblocker-1.3-an+fx.xpi?src=dp-btn-primary" = "https://addons.mozilla.org/firefox/downloads/file/3586373/canvasblocker-1.3-an+fx.xpi?src=dp-btn-primary"
	# Cookie Auto Delete
	"$env:APPDATA\Mozilla\Firefox\Profiles\$ProfileName\extensions\cookie_autodelete-3.5.1-an+fx.xpi?src=dp-btn-primary""https://addons.mozilla.org/firefox/downloads/file/3630305/cookie_autodelete-3.5.1-an+fx.xpi?src=dp-btn-primary"
}
foreach ($Extension in $Extensions.Keys)
{
	if (-not (Test-Path -Path $Extension))
	{
		Start-Process -FilePath "$env:ProgramFiles\Mozilla Firefox\firefox.exe" -ArgumentList $Extensions[$Extension]
	}
}