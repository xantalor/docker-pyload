Docker-Pyload
=============

Sets up a container with [pyload](https://github.com/pyload/pyload) installed listening on 8000 and 7227.

Usage
=============

With the script pyload.sh you can build, run, start, stop and remove the container from docker:

    pyload.py {build, run, start, stop, remove}

To get access to the downloads you have to map the /pyload/downloads dir to the host by adding the following command:

    -v </path/to/your/downloads>:/pyload/downloads

If you want a persistant config you have to map the /pyload/config dir to the host by adding the following command:

    -v </path/to/pyload/config>:/pyload/config

Your pyload instance is now available by going to http://localhost:8000.
Username: admin Password: admin for pyload

If you want to create users, you need to run the following command on the docker host:

    docker exec -it pyload bash

Afterwards, inside the container this command:

    python /pyload/pyLoadCore.py -u


Notes:

* New users seems to be available only after pyLoad restart (Top right corner > Administrate > Restart pyLoad)
* Don't forget to leave the user management script with choice 4 (Quit) or users won't be added

