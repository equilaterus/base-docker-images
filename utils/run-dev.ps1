. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
  # Run!
  docker-compose -f docker-compose.yml up -d --build
}

Start-Cli -Title 'Run DEV' -Filename 'docker-compose.yml'
