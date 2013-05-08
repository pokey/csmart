from fabric.api import local, run, sudo
import time

def initialSetup():
   """Sets up a new server"""
   sudo("yum -y install git")

   # Apache stuff
   sudo("yum -y install httpd")
   sudo("chkconfig --level 235 httpd on")
   sudo("yum -y install mod_wsgi")
   # FixMe: [correctness] Install pip and django
   # FixMe: [correctness] Make sure that Django-1.3 directory is a sibling of
   # csmart_site, because symlink at apache/static/admin relies on this
   # FixMe: [correctness] Install django-debug-toolbar
   # FixMe: [correctness] Install mysql-python
   # FixMe: [correctness] Install utils (remembering to enter empty username
   # and password
   # FixMe: [correctness] Install daemonize:
   # http://software.clapper.org/daemonize/
   # FixMe: [correctness] Disable SELinux?
   # FixMe: [correctness] Set up iptables to accept incoming requests on port
   # 80
   sudo("pip install simplejson")
   sudo("yum install java-1.6.0-openjdk")

   sudo("yum -y install mysql-server") 
   sudo("yum -y install mysql") 
   sudo("yum -y install mysql-devel")

   # FixMe: [correctness] Where should we be setting up?
   with cd("~"):
      run("git clone git://github.com/bipsandbytes/csmart_site.git")
      # FixMe: [correctness] Deploy into different directory
      apacheDir = run("pwd") + "/csmart_site/apache"
      sudo("echo \"Alias /static/ " + apacheDir + "/static/\" >> /etc/httpd/conf/httpd.conf")
      sudo("echo \"WSGIScriptAlias / " + apacheDir + "/django.wsgi\" >> /etc/httpd/conf/httpd.conf")
      sudo("echo \"LoadModule wsgi_module modules/mod_wsgi.so\" >> /etc/httpd/conf/httpd.conf")
      solrDir = run("pwd") + "/csmart_site/solr"
      sudo("ln -s " + solrDir + "/solrService.sh /etc/init.d/solr")
   # FixMe: [correctness] Do we want to dump database from existing server and
   # transfer it here?

# Info on how to dump and restore database from:
# http://news.softpedia.com/news/How-to-copy-an-MYSQL-database-from-an-computer-to-another-63919.shtml
# We use the last method, which dumps to a folder
def dumpDatabase():
   """Dumps the mysql database into the file /tmp/csmartDump.tar.gz"""
   sudo("mkdir /tmp/csmartDump")
   sudo("chown mysql:mysql /tmp/csmartDump")
   sudo("sudo chmod 777 /tmp/csmartDump")
   with cd("/tmp/csmartDump"):
      run("mysqldump --user=root --password=thisiscsmart --tab=`pwd` csmart")
   with cd("/tmp"):
      run("tar -czvf csmartDump.tar.gz csmartDump")
   # FixMe: [correctness] Make tarball of solr folder and replace solr folder
   # from git.  This replicates the solr index

# These are the steps I used to restore the database
# FixMe: [correctness] Add these to restoreDatabase
# tar -xzvf csmartDump.tar.gz 
# sudo mysqladmin create csmart
# # The next line might have an error, but it doesn't seem like a big deal
# sudo cat csmartDump/*.sql | sudo mysql csmart
# cd ..
# mv csmartDump /tmp/csmartDump
# cd /tmp
# sudo chown mysql:mysql csmartDump/
# sudo chmod 777 csmartDump/
# cd csmartDump/
# sudo chown mysql:mysql *
# sudo chmod 777 *
# sudo mysqlimport csmart /tmp/csmartDump/*.txt
# sudo mysqladmin flush-privileges
def restoreDatabase():
   pass

def start():
   sudo("service httpd start")
   sudo("service mysqld start")
   sudo("service solr start")

def stop():
   sudo("service httpd stop")
   sudo("service mysqld stop")
   sudo("service solr stop")

def restart():
   sudo("service httpd restart")
   sudo("service mysqld restart")
   sudo("service solr restart")
   # FixMe: [correctness] Test this, remembering to change solrService path

def deploy():
   # FixMe: [correctness] Use with cd bipins csmart_site
   run("git pull origin master")
   run("python manage.py syncdb")
   sudo("service httpd restart")
   sudo("service solr restart")

def test():
   run("echo `pwd`")
