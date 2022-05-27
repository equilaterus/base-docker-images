docker ps
$container = Read-Host "Please enter container ID:"
docker exec -it $container sh
