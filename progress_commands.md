
<-------------------------------MODULE 1 -------------------------------------->
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


<-------------------------------MODULE 2 -------------------------------------->

create db server:

```
docker-compose -f mongo_compose.yml up -d
```


login to db container:
```
docker exec -it [container] bash
```

login to mongo
```
mongosh -u db_user -p s3cr3t --authenticateDatabase admin 
```
--authenticationDatabase admin:

This part specifies the authentication database as "admin." In MongoDB, users and their credentials are typically stored in a specific database, and this database is known as the authentication database. The user account specified (in this case, "root") and its password are looked up in the "admin" database.

local:

After successful authentication against the specified authentication database ("admin" in this case), MongoDB switches to the "local" database by default. The "local" database is a system database used by MongoDB for various purposes, and it often contains information specific to the MongoDB instance.

mongosh command
```
show dbs
use your_database_name (for selecting and also creating)
show collections
db.collection_name.insert({ key: "value" })
db.collection_name.find()
db.collection_name.count()
db.electronics.createIndex({type: 1}) # ascending
db.electronics.find({type:'laptop'}) # filter laptops

```


import data from catalog.json:
```
mongoimport --username db_user --password s3cr3t --db catalog --collection electronics --file electronics.json --authenticationDatabase admin
```

create index on field 'type':
```
db.electronics.createIndex({type: 1}) # ascending
```

queries:
```
db.electronics.find({type: 'smart phone', 'screen size': 6})


db.yourCollection.aggregate([
    {
        $match: {
            type: "smart phone"
        }
    },
    {
        $group: {
            _id: "$type",
            averageScreenSize: { $avg: "$screen size" }
        }
    }
])

```


exporting data:
```
mongoexport --username db_user --password s3cr3t --db catalog --collection electronics --fields _id,type,model --out electronics.csv --authenticationDatabase admin
```