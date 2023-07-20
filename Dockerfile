FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

ARG appName
ENV APP_NAME=${appName}
WORKDIR /app
COPY files/ ./

CMD ["dotnet", ${APP_NAME}]