class exa::install {

  exec { "exa_clone":
    command => "git clone git@github.com:badgerherald/exa.git",
    cwd => "/vagrant/badgerherald.test/wordpress/wp-content/themes/",
    user => "root"
  }

    exec { "hexa_clone":
    command => "git clone git@github.com:badgerherald/hexa.git",
    cwd => "/vagrant/badgerherald.test/wordpress/wp-content/themes/",
    user => "root"
  }

}
