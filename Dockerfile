FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

ARG APP_NAME

WORKDIR /app
COPY files/ ./

ENV PROG_NAME=${APP_NAME}

CMD ["dotnet", ${PROG_NAME}]