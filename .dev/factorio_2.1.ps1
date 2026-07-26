Set-Variable -Name workspace -Value $Env:FACTORIO_WORKSPACE
Set-Variable -Name mod_base -Value $Env:FACTORIO_21_MODS_BASE
Set-Variable -Name package -Value "cubium-and-more"

New-Item -ItemType Directory -Force -Path "$mod_base" | Out-Null
Copy-Item -Force -Recurse -Path "$workspace\$package\.dev\mods2.1\*" -Destination "$mod_base" -ErrorAction SilentlyContinue

Set-Variable -Name version -Value (Get-Content "$workspace\$package\info.json" | ConvertFrom-Json).version
Move-Item -Path "$workspace\$package\${package}_${version}.zip" -Destination "$mod_base" -Force -ErrorAction SilentlyContinue

Set-Variable -Name version_khaoslib -Value (Get-Content "$workspace\khaoslib\info.json" | ConvertFrom-Json).version
Move-Item -Path "$workspace\khaoslib\khaoslib_$version_khaoslib.zip" -Destination "$mod_base" -Force -ErrorAction SilentlyContinue

Set-Variable -Name version_technology_or -Value (Get-Content "$workspace\technology-or-redux\info.json" | ConvertFrom-Json).version
Move-Item -Path "$workspace\technology-or-redux\technology-or-redux_$version_technology_or.zip" -Destination "$mod_base" -Force -ErrorAction SilentlyContinue

Start-Process -FilePath "${Env:FACTORIO_21_PATH}\bin\x64\Factorio.exe" -ArgumentList "--mod-directory $mod_base"
