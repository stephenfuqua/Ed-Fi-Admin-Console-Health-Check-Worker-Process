# Health Check Service - Developer Instructions

## Development Pre-Requisites

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Suggested to have either:
  - [Visual Studio 2022](https://visualstudio.microsoft.com/downloads), or
  - [Visual Studio 2022 Build
    Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)
    (install the ".NET Build Tools" component)
- Clone [this
  repository](https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-Admin-Console-Services.git) locally

## Project Initial Configuration

This project depends on AdminAPI, so it will be require to provide the information at [`Application/AdminConsoleHealthCheckService/appsettings.json`], where you can find the section [`AdminApiSettings`]. Following you can find an example configuration for this section: 

```json
"AdminApiSettings": {
    "HealthCheckUrl": "https://localhost/adminconsole/healthcheck",
    "TokenUrl": "https://localhost/connect/token",
    "ClientId": "[Your_Client_Id]",
    "ClientSecret": "[Your_Client_Secret]",
    "GrantType": "client_credentials",
    "Scope": "edfi_admin_api/full_access"
}
```

## Launch the project

If you want to launch Health Check service, you can open your terminal and redirect it to the directory [`/Application/AdminConsoleHealthCheckService/appsettings.json`], then run the command [`dotnet run`]

If you enabled swagger at [`appSettings.json`], then you will be able to access ['[Your_URL]/swagger']