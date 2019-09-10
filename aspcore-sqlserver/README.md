# ASP Core + SQL Server - Base docker image

This images were optimized for a standard .net core structure:

* root
  * SolutionFile.sln
  * .gitignore
  * docker-compose
  * ...
  * **src**
    * **ProjectA**
      * ProjectA.csproj
      * ...
    * **ProjectB**
      * ProjectB.csproj
      * ...
  * **test**
    * **ProjectA.Tests**
      * ProjectA.Tests.csproj
      * ...
    * **ProjectB.Tests**
      * ProjectB.Tests.csproj
      * ...
   

## Bibliography

* Visual Studio 2019 default docker images.
* https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/docker/building-net-docker-images?view=aspnetcore-2.2
* https://docs.docker.com/engine/examples/dotnetcore/
* https://natemcmaster.com/blog/2017/11/13/dotnet-watch-and-docker/
* https://andrewlock.net/optimising-asp-net-core-apps-in-docker-avoiding-manually-copying-csproj-files-part-2/
