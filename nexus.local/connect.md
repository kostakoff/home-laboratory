# Instruction

## Atifactory hot commands

- set nexus proxy for powershell gallery
```pwsh
Register-PSRepository -Name Nexus -SourceLocation "http://nexus.local/repository/psgallery/" -PublishLocation "http://nexus.local/repository/psgallery/" -InstallationPolicy Trusted
```

- delete default PSGallery 
```pwsh
Unregister-PSRepository -Name PSGallery
```

- nuget set proxy repo
```pwsh
dotnet nuget add source -n nexus http://nexus.local/repository/nuget/index.json --allow-insecure-connections --protocol-version 3
```

- nuget remove default repo
```pwsh
dotnet nuget remove source nuget
```

- choco add proxy repo
```pwsh
choco.exe source add -n=nexus -s=http://nexus.local/repository/chocolatey/
```
- choco revome default repo
```pwsh
choco.exe source remove -n=chocolatey
```
