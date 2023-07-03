FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime

WORKDIR /app
COPY orgmgmt/ ./

CMD ["dotnet", "Wktaae.OrganizationManagement.Web.dll"]