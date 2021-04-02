# BUILD COMPOSER IMAGE
`docker build -t localcomposer -f ./composer/composer.dockerfile ./composer`

# BUILD NPM IMAGE
`docker build -t localnode -f ./node/node.dockerfile ./node`

##########

# RUN NPM INSTALL
`docker run -it -v $(pwd):/usr/app localnode:latest npm install`

# RUN COMPOSER
`docker run -v $(pwd)/app:/var/www/html localcomposer:latest composer install`

# RUN INTO CONTAINER and USE bash
`docker exec -it <container-name> bash`

# PERMISSION DENIED
- run into container and run this command:
`chown -R www-data:www-data /var/www`

# The requested URL was not found on this server
- run into container and run this command to enable the mod_rewrite on the .htaccess file:
`a2enmod rewrite`
- then:
`service apache2 restart`

# CAT file from container
`docker run --rm <image-name>:<tag> cat <container-file-path> > <local-file-path>`

# Remove dangling images
`docker rmi -f $(docker images -f "dangling=true" -q)`

# Set edit permission Laravel
`sudo setfacl -Rm u:saidan00:rwx,d:u:saidan00:rwx <path>`

# Moodle data
`sudo chown -R daemon:daemon moodledata_data`
