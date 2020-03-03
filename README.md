# modern_times


## Setup Ruby environment
  | Ruby  | 2.6.5 |
  | Rails | 5.2.4.1 |

  I recommend you to install new Ruby and Bundler on the top of Rbenv before install modern_times.

  1) Install rbenv + ruby-build (check https://github.com/sstephenson/rbenv#basic-github-checkout for details)
     ```
       $ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
       $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
       # Edit your shell dot files to add some path and environment variables.
     ```

  2) Install Ruby and Bundler
     ```
       # Install ruby 2.6.5
       $ rbenv install 2.6.5

       # Installation check
       $ rbenv global 2.6.5
       $ ruby -v # -> You will see: ruby 2.6.5...

       # Install bundler for your new Ruby
       $ gem install bundler

       # Activate bundler
       $ rbenv rehash

       # Get back to your system default Ruby if you want
       $ rbenv global system # say, /usr/bin/ruby
       $ ruby -v
     ```

## Install modern_times

### Clone modern_times
  1) Clone modern_times from GitHub
     ```
       $ git clone git@github.com:p-salon/modern_times.git
     ```

  2) Setup to use installed ruby
     ```
       $ cd modern_times
       $ rbenv local 2.6.5
       $ ruby -v # -> You will see: ruby 2.6.5...
     ```
### Setup 
  1) Install vendor/bundle stuffs
     ```
       $ bundle install --path vendor/bundle
     ```

  2) Setup secret key
     ```
       $ bundle exec rake secret # -> You will see: foobarbuz... Copy the string.
       $ cp config/secrets.yml.template config/secrets.yml
       $ vim config/secrets.yml # -> Replace all <SECRETKEY> with the string outputted
     ```
     
  3) Setup GitHub OmniAuth (TODO)
     ```
       $ cp config/application_settings.yml.template config/application_settings.yml
       $ vim config/application_settings.yml # -> set client_id, client_secret, allowed_team_id
     ```

  4) Setup DB
     ```
       $ bundle exec rake db:migrate
       $ bundle exec rake db:migrate RAILS_ENV=production
     ```

## Launch modern_times
### development
   You can launch server by invoking bin/server.sh:
   ```
     # start
     $ bin/server.sh start dev

     # stop
     $ bin/server.sh stop
   ```

   Or, you can take these procedures by hand:
   ```
     # start
     $ export RAILS_ENV="development"
     $ export RAILS_SERVE_STATIC_FILES=true
     $ bundle exec rails server -b 0.0.0.0 -p 3000 -d -e "$RAILS_ENV"
     $ open http://localhost:3000/

     # stop
     $ kill $(cat tmp/pids/server.pid)
   ```

### production
   You can launch server by invoking bin/server.sh:
   ```
     # start
     $ bin/server.sh start pro

     # stop
     $ bin/server.sh stop
   ```

   Or, you can take these procedures by hand:
   ```
     # start
     $ export RAILS_ENV="production"
     $ export RAILS_SERVE_STATIC_FILES=true
     $ bundle exec rake assets:precompile RAILS_ENV="$RAILS_ENV"
     $ bundle exec rails server -b 0.0.0.0 -p 54321 -d -e "$RAILS_ENV"
     $ open http://localhost:54321

     # stop
     $ kill $(cat tmp/pids/server.pid)
   ```

# systemdによる起動
## 設定
+ 以下のコマンドを実行し適切な場所にファイルを配置する
  ```
  $ sudo cp systemd_conf/modern_times.service /etc/systemd/system/modern_times.service
  $ sudo cp systemd_conf/modern_times_env /etc/default/modern_times_env
  ```
   
+ コピーした`modern_times.service`について，以下の項目を環境に合わせて設定する．
  ```
  10 WorkingDirectory=/home/psalon/modern_times
  11 ExecStart=/bin/sh -c 'exec /home/psalon/modern_times/bin/server.sh start pro >> /var/log/modern_times.log 2>&1'
  12 User=psalon
  13 Group=psalon
  ```

+ コピーした`modern_times_env`について，PATHを環境に合わせて設定する．

## 実行
+ 以下のコマンドを実行することでmodern_timesを起動できる．
    ```
    $ sudo systemctl start modern_times
    ```
    
+ 以下のコマンドを実行することでmodern_timesを停止できる．
    ```
    $ sudo systemctl stop modern_times
    ```