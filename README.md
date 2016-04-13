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
 4. Use these gists (TO DO!) to replace default Symfony files - this ensures Symfony 3 uses directories outside VM synced folders for performance improvements
 5. In composer json add this section (TO DO!)
 6. In your hosts file add following entry: 192.168.56.101 dev
 7. Visit http://dev/ to view your app
 8. MySQL is accessible via an ssh tunnel (username and password for SSH tunnel is 'vagrant') using username and password 'dev' for MySQL authentication
 9. Develop your app!
 10. If you change your database schema or provide any changes to puppet configuration files be sure to run 'vagrant provision'
 
 

