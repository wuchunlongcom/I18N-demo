#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
BASE_DIR=`pwd -P`
popd > /dev/null

#############
# Functions
#############
function logging {
    echo "[INFO] $*"
}

pip install -r requirements.txt

function rebuild_db {
	logging "Clean"
	rm -rf "db.sqlite3"
	rm -rf "account/migrations/0001_initial.py"

	logging "makemigrations" "account"
	python "manage.py" "makemigrations" "account"

	logging "migrate"
	python "manage.py" "migrate"

	logging "initdb.py"
	python "initdb.py"
}

function launch_webapp {
    cd ${BASE_DIR}/mysite
    python "manage.py" "runserver"
}

#############
# Main
#############
cd ${BASE_DIR}
OPT_ENV_FORCE=$1

if [ "${OPT_ENV_FORCE}x" == "-ix" ];then
    cd ${BASE_DIR}/mysite
    rebuild_db
fi

launch_webapp
