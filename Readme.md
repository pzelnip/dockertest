

```shell
docker build -t foo:latest .
docker run --rm --name foobar -p 6500:8080 foo:latest
```

Go to <http://127.0.0.1:6500/static/hello.html> or <http://127.0.0.1:6500/success>
