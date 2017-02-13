sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

# System Packages, tools, and dependencies
yes | sudo apt-get install git-core curl zlib1g-dev liblzma-dev libgmp-dev build-essential patch libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties nodejs imagemagick npm libgdbm-dev libncurses5-dev automake libtool bison libffi-dev make gcc ruby-dev postgresql-common postgresql-9.3 libpq-dev htop qt5-default libqt5webkit5-dev

# Install RVM/Ruby/Rails
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash
source /etc/profile.d/rvm.sh
rvmsudo rvm install ruby-2.3.0 --default
rvm use ruby-2.3.0
sudo -u postgres psql postgres -c "CREATE USER recipes WITH PASSWORD 'r3c1p3s' SUPERUSER"
rvmsudo gem install rails --no-rdoc --no-ri

# Setup Postgres User
sudo cp ./pg_hba.conf /etc/postgresql/9.3/main/
sudo service postgresql restart

# Install Gems
# bundle install
#
# # Setup Database
# rake db:create
# rake db:migrate
# rake db:seed
#
# # Start the server
# puma -d -p 3000
