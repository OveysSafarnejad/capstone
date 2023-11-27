create db server:

```
	docker-compose -f mysql_compose.yml up -d
```


login to db container:
```
	docker exec -it [container] bash
```

login to mysql
```
	mysql -u root -p
```


create database:
```
	CREATE DATABASE sales;
```


