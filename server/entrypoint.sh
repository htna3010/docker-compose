#!/bin/bash

while [[ $# -gt 0 ]]; do
  case "$1" in
    --)
        shift
        launch=("$@")
        break
        ;;
    -d)
        shift
        echo "Mode DEV"
        ;;
    *)
        echo "Unknown argument: $1"
        exit 1
        ;;
  esac
done

echo -e "### Préparation du conteneur ###"
echo "<p>${NOM}</p>" >> /usr/local/apache2/htdocs/index.html

python run/manage.py makemigrations
python run/manage.py migrate
python run/manage.py init_admin
python run/manage.py load_products

echo -e "### Démarrage du conteneur ###"
exec "${launch[@]}"

