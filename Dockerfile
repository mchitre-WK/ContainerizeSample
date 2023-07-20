FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

ARG appName
WORKDIR /app
COPY files/ ./

CMD ["dotnet", $appName]