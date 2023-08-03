# README

In this template we have:

* Web
  * HTML+JS: Web/
  * PHP: Web+PHP/
  * Python: Web+Python/
  * GoLang: Web+GoLang/
* Pwn
* Crypto
* Misc

In each category we use GZCTF's dynamic flag. If you don't want to use dynamic flag, please edit the `start.sh` file and remove the corresponding lines.

Note: for CTFd user, please replace the `GZCTF_FLAG` env in `start.sh` to `FLAG` env.

## File structure

The template file structure would be like:

* [category]
  * files/ or src/: source code of the application or front/backend of the web server.
  * ctf.xinetd: multi-end service initializer, create different environment for different users.
  * Dockerfile: main setup file for the category, add or remove function accordingly.
  * docker-compose.yml: local environment testing only, doesn't use in the produce environment.
  * start.sh: entry point of Dockerfile and dynamic flag setup.

## Upload to Docker hub

1. Setup your docker hub account and login: `docker login -u YOUR-USER-NAME`.
2. Create the remote repo in docker hub web page.
3. Build and tag the image: `docker build --platform linux/amd64 -t YOUR-USER-NAME/IMAGE-NAME .`, be aware the dot in the end.
4. Push the image: `docker push YOUR-USER-NAME/IMAGE-NAME`.