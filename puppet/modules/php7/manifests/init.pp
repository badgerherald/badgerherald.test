class php7::install {

  exec { "common_tools":
    command => "apt-get install software-properties-common -y",
    user => "root"
  }

  exec { "install php7":
    command => "apt -y install lsb-release apt-transport-https ca-certificates \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo 'deb https://packages.sury.org/php/ $(lsb_release -sc) main' | sudo tee /etc/apt/sources.list.d/php7.3.list",
    user => "root"
  }

}
