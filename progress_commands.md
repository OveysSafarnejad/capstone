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


create database and use it:
```
CREATE DATABASE sales;
USE sales;
```

create sales_data table:
```
CREATE TABLE sales_data (
    ->     product_id INT,
    ->     customer_id INT,
    ->     price INT,
    ->     quantity INT,
    ->     timestamp TIMESTAMP
    -> );
```

create an index:
```
CREATE INDEX ts ON sales_data (timestamp);
SHOW INDEX FROM sales_data;
```

create export_data.sh on the docker container and run:
```
chmod +x export_data.sh 
./export_data.sh 
```

to export data.