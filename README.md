#Vagrant web development box for Symfony 3 project running on Debian Jessie 8.1 x64 with puppet provisioning
I prepared this box for a rapid start of web app development using Symfony 3 framework using Vagrant virtual machine. Environment configured is:

1. Apache 2.4 with mod_rewrite and mod_headers added
2. PHP 5.6 with Xdebug
3. MySQL 5.7
4. Memcached
5. PHPUnit
6. Composer

## Configuring and running

1. Go to \puppet\modules\mysql\files\dbschema.sql and paste your database schema at the end of the file
2. Run 'vagrant up' and wait to download box and install server
3. Put your Symfony 3 project into application directory
4. Use these gists (https://gist.github.com/velPL/5b96be072c5dbdd480fd7b67cea2a3e9 and https://gist.github.com/velPL/c4d2c3b294aa820978c6fbfd9bd8d19d) to replace default Symfony files in application\app directory - this ensures Symfony 3 uses directories outside VM synced folders for performance improvements
5. In composer.json add this section (https://gist.github.com/velPL/5899e844da6f2e6ee5b7d70f3e795893)
6. In your hosts file add following entry: 192.168.56.101 dev
7. Visit http://dev/ to view your app
8. MySQL is accessible via an ssh tunnel (username and password for SSH tunnel is 'vagrant') using username and password 'dev' for MySQL authentication
9. You can SSH into your server using username and password 'vagrant'
10. Develop your app!
11. If you change your database schema or provide any changes to puppet configuration files be sure to run 'vagrant provision'
 
Credits for Symfony vagrant optimization tips: http://by-examples.net/2014/12/09/symfony2-on-vagrant.html and http://www.whitewashing.de/2013/08/19/speedup_symfony2_on_vagrant_boxes.html