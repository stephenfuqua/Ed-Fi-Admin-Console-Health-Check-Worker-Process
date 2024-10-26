# EdFi.AdminConsoleHealthCheckService.Dockerfile

# Imagen base de .NET SDK para compilar y publicar la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

# Copiar el archivo de EdFi.AdminConsoleServices y los archivos de proyecto
COPY ../Application/EdFi.AdminConsoleServices.sln .
COPY ../Application/EdFi.AdminConsoleHealthCheckService/EdFi.AdminConsoleHealthCheckService.csproj ./EdFi.AdminConsoleHealthCheckService/

# Restaurar las dependencias
RUN dotnet restore

# Copiar el resto del código fuente y compilar la aplicación
COPY ../Application/EdFi.AdminConsoleHealthCheckService/. ./EdFi.AdminConsoleHealthCheckService/
WORKDIR /source/EdFi.AdminConsoleHealthCheckService
RUN dotnet publish -c Release -o /app

# Imagen base de .NET Runtime para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# Ejecutar la aplicación
ENTRYPOINT ["dotnet", "EdFi.AdminConsoleHealthCheckService.dll"]
