# Windows Development Environment Automated Installation Script
 
#Check Script is running with Elevated Privileges
Check-RunAsAdministrator
# Check for administrator rights
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an administrator"
    Write-Host "Press any key to exit..."
    Read-Host
    exit
}

# Install Chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install development tools
choco install docker-desktop -y
choco install git -y
choco install maven -y
choco install intellijidea-community -y
choco install heidisql -y

# Install multiple JDK versions from Eclipse Temurin
choco install temurin11 -y
choco install temurin17 -y
choco install temurin21 -y

# Configure Java environment variables
$jdkPaths = @(
    "C:\Program Files\Eclipse Adoptium\jdk-11.0.22.7-hotspot\bin",
    "C:\Program Files\Eclipse Adoptium\jdk-17.0.10.7-hotspot\bin", 
    "C:\Program Files\Eclipse Adoptium\jdk-21.0.2.13-hotspot\bin"
)

$env:JAVA_HOME = $jdkPaths[2]  # Set JDK 21 as default JAVA_HOME
$env:PATH += ";$($jdkPaths -join ';')"

# Verify installations
Write-Host "`nVerifying installations:"
choco list --local-only

# Finish
Write-Host "`nInstallation completed. Restart your computer to finalize configuration."

Write-Host "Press any key to exit..."
Read-Host
exit
