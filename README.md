# bash scripts 
- bash scripts i made for practice, in order:

* local ci: A local CI made with docker, bash and python/flask, with 3 jobs
    --loop:it works launching the bash script, reading and comparing all the files constantly, and recreating the flask web            every time it finds a difference, also change the version of the fyle "app.yp"
    --pull: upload the whole files to a dockerfile and relaunch a docker container with them in 0.0.0.0:5000
    --push: download all the files from the docker image to the current directory
    
* ListaIguales: List recursivelly all the files in a folder (and subfolders) and check if there are any duplicates.

* LogProcess: Logs every process that is launcher after the script.

* Medidor: Shows the CPU usage of a process with a bar and percentage

* PrimeraLetra: Changes recursivelly the first letter of all files to an Uppercase

* Segundos: Copy the content of files, and stops X seconds every Y seconds.

* API: Workspace ONE Api call
