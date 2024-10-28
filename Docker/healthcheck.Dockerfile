# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# EdFi.AdminConsoleHealthCheckService.Dockerfile

# Image based on .NET SDK to compile and publish the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

# Copy EdFi.AdminConsoleHealthCheckService.csproj file
COPY ../Application/EdFi.AdminConsoleServices.sln .
COPY ../Application/EdFi.AdminConsoleHealthCheckService/EdFi.AdminConsoleHealthCheckService.csproj ./EdFi.AdminConsoleHealthCheckService/

# Restore dependencies
RUN dotnet restore

# Copy source code and compile the application
COPY ../Application/EdFi.AdminConsoleHealthCheckService/. ./EdFi.AdminConsoleHealthCheckService/
WORKDIR /source/EdFi.AdminConsoleHealthCheckService
RUN dotnet publish -c Release -o /app

# .NET Runtime image to execute the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# Execute the app
ENTRYPOINT ["dotnet", "EdFi.AdminConsoleHealthCheckService.dll"]
