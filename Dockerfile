# Usa la imagen base de .NET SDK para compilar
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copia los archivos de tu proyecto
COPY . ./

# Restaura dependencias e instala paquetes
RUN dotnet restore

# Compila el proyecto
RUN dotnet publish -c Release -o out

# Usa una imagen base más liviana para ejecutar
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copia los archivos publicados
COPY --from=build /app/out .

# Expone el puerto (ajusta si tu proyecto usa otro)
EXPOSE 80

# Comando para ejecutar la API
ENTRYPOINT ["dotnet", "API_MAUI_Server.dll"]
