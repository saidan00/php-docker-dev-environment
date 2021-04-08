## **Build composer image**
```
docker build -t localcomposer -f ./composer/composer.dockerfile ./composer
```

</br>

## **Build npm image**
```
docker build -t localnode -f ./node/node.dockerfile ./node
```

<hr>

## **Run npm install**
```
docker run -it -v $(pwd):/usr/app localnode:latest npm install
```

</br>

## **Run composer**
```
docker run -v $(pwd)/app:/var/www/html localcomposer:latest composer install
```

</br>

## **Run into container and use `bash`**
```
docker exec -it <container-name> bash
```

</br>

## **Permission denied**
run into container and run this command:
```
chown -R www-data:www-data /var/www
```

for Drupal:
```
chown -R www-data:www-data /opt/drupal/web
```

</br>

## **The requested URL was not found on this server**
run into container and run this command to enable the mod_rewrite on the .htaccess file:
```
a2enmod rewrite
```

then:
```
service apache2 restart
```

</br>

## **`cat` file from container**
```
docker run --rm <image-name>:<tag> cat <container-file-path> > <local-file-path>
```

</br>

## **Remove dangling images**
```
docker rmi -f $(docker images -f "dangling=true" -q)
```

</br>

## **Set edit permission Laravel**
```
sudo setfacl -Rm u:saidan00:rwx,d:u:saidan00:rwx <path>
```

</br>

## **Moodle data**
```
sudo chown -R daemon:daemon moodledata_data
```
