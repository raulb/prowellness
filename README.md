Prowelleness
============

Steps to configure the project correctly

Instalation
-----------

The main folder contains the `.rvmrc` file. This set a gemset with Ruby 1.9.2-p290 version.

1. `rvm install ruby-1.9.2-p180`
2. `gem install bundler`

This gem require a RubyGems version >= 1.3.6. If there isn't:

`gem update --system`

3. `rvm use ruby-1.9.2-p180@prowellness`
4. `bundle`

If there is an error with linecache19 or ruby-debug-base19 gems, do:

`gem install linecache19 --backtrace` or `gem install ruby-debug-base19` (if it's case)

And `bundle` again to following

* NOTE: There are dependencies with postgres (gem pg).
* If not exists. You have to install it. For example, with brew: `brew install postgres` and then `env ARCHFLAGS="-arch x86_64" gem install pg`

Database
--------

PostgreSQL, in development, testing and production.

`rake db:create`
`rake db:migrate`
`rake db:seed`

* NOTE: If you have any problem with postgres user (postgres installed with Brew), [look at this](http://tumblr.com/xgs3z5o61k)

Testing
-------

`RAILS_ENV=test rake db:drop db:create db:migrate spec:models spec:acceptance`