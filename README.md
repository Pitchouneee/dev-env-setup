# Development Environment Automated Setup

## Overview
Automated PowerShell script to quickly set up a Windows development environment with essential tools for Java and web development.

## Script Execution
You can run the script using:
```powershell
powershell.exe -ExecutionPolicy Unrestricted ./install-env.ps1
```

*Note: This is optional and depends on your system's current execution policy settings.*

## Included Tools
- Docker Desktop
- Git
- Maven
- IntelliJ IDEA Community
- HeidiSQL
- Bruno
- VSCode
- Multiple JDK versions (11, 17, 21) from Eclipse Temurin

## Prerequisites
- Windows OS
- Administrator privileges
- Internet connection

## Usage
1. Open PowerShell as Administrator
2. Run the script
3. Restart computer to finalize configuration

## Requirements
- Chocolatey Package Manager (installed automatically)

## Customization
Modify the script to add or remove tools as needed.
