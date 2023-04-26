<div align="center">
  <h1>VuFind environment</h1>
</div>

<p><strong>The purpose of creating this Dockerfile was to meet the requirements of the UMS Digital Library Scholarship project.</strong></p>
<p>DISCLAIMER:<br>This container is designed solely to provide a suitable environment for installing vufind,<br>and it does not install the vufind application automatically!</p>

#### How To Configure
1. Download the latest Vufind debian package installer (https://github.com/vufind-org/vufind/releases/)
2. Place the debian package file inside `./assets/` directory
3. Build the container using `sudo docker compose up --build -d` command
4. Check if the container already running and up using `sudo docker container ls -a`
5. Test the SSH connection using `ssh vufind@localhost -p 1338` with the vufind user default password is <i>vufind</i>
6. Also check the mysql service is running using `mysql -P 3316 -u root -p` using <i>vufind_databases</i> as the default root password
7. If everything is running properly, start to Install vufind inside the container using this [Installation Guide](https://vufind.org/wiki/installation:ubuntu)
8. Done, that's the Container do!

This environment is tested for running Vufind v.9.0.1<br>Created with 🔮 by [encrypt0r](https://s.id/encrypt0r)
<br>`Build date: Apr, 26. 2023`
