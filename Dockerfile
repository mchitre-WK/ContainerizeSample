FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

ARG appName
ENV App_Name=${appName}
WORKDIR /app
COPY files/ ./

CMD ["dotnet", "${App_Name}"]