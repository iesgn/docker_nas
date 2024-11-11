# docker_nas
Docker nas

```
docker build -t iesgn/nas .
docker run --name dit_nas -p 8002:80 -v /directorio:/usr/local/apache2/htdocs/
```