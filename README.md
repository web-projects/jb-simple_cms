SerenataWeb | Ruby on Rails with MySQL CMS Application
================================================================================

# REPOSITORY
git remote add origin git@github.com:web-projects/simple_cms.git

# This is a Ruby on Rails project with MySQL:

  * rails new simple_cms -d mysql
  * CREATE DATABASE simple_cms_development;
  * CREATE DATABASE simple_cms_test;
  * CREATE DATABASE simple_cms_production;
  * CREATE USER 'webuser'@'localhost' IDENTIFIED BY 'secretpassword';
  * GRANT ALL PRIVILEGES ON simple_cms_development.* TO 'webuser'@'localhost' WITH GRANT OPTION;
  * GRANT ALL PRIVILEGES ON simple_cms_test.* TO 'webuser'@'localhost' WITH GRANT OPTION;
  * UPDATE db credentials in database.yml and TEST: $ rails db:schema:dump

  * MIGRATE to PostgreSQL database:

    1. install gem:

      gem install valkyrie

    https://www.datachomp.com/archives/quickly-migrate-a-db-from-mysql-to-postgres/

    2.  MIGRATE DB

        valkyrie mysql://datachomp@localhost/seppuku?password=QuickAndPainless postgres://datachomp@127.0.0.1/seppuku


# To run:

    $ bin/rails server

# HISTORY
-----------------

    $ 2018/08/02 - Initial repository.
    $ 2018/08/03 - Added Pages and Sections.
    $ 2018/08/04 - Added partials format and Application helpers.
    $ 2018/08/05 - Added Form validation.

# -------------------------------------------------
# HEROKU HOSTING
# -------------------------------------------------

  From the root of the project:

  $ heroku create jb-simple-cms

  https://jb-simple-cms.herokuapp.com

  $ git push heroku master
