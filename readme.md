# bhrld.dev

This repo contains tools The Badger Herald's web team uses for development.

## What this gets you

This repo gives you a configured vagrant box preloaded with configured server settings and a production database.

* * *

## Setup

#### 1. Cloning

First, run this command from terminal to clone the repo.

    git clone https://github.com/badgerherald/bhrld.dev.git

#### 2. Vagrant up

You'll need copies of both [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads).

If you have a copy of hrld_wp_dev.sql, move this into the repo directory and it will be loaded. Otherwise, a new database will be created.

From the root of the repo, run:

    vagrant up

This will prevision a new virtual machine on your computer with the same LAMP stack as the Herald. This process can take anywhere between 5 and 10 minutes, depending on your machine. Once the script is finished running, you'll have a vagrant box running at the ip address `192.168.19.69`. 

Add the following to your `/etc/hosts` file:

    192.168.19.69 bhrld.dev

On some operating systems, change your `/private/etc/hosts` file on your host computer (not the VM). Also, make sure there aren't any file extension attached to the hosts file, especially if you edit it through program/applications other than vi, vim, nano etc. 

Typing [http://bhrld.dev](http://bhrld.dev) into a browser should now take you to a local instance of the Herald site. Make sure your browser resolves the `http://`.

#### 3. Clone other repos

A few addtional repos are needed for development.

First, cd to the WordPress theme directory.

    $ cd ./wp/wp-content/themes/

And clone the Herald's main theme [exa](http://github.com/badgerherald/exa), and the Herald's child theme [hexa](https:)

    $ git clone https://github.com/badgerherald/exa.git
    $ git clone https://github.com/badgerherald/hexa.git

Now, clone the plugin directory *directly* into the WordPress plugin directory. We do this by specifying `.` as the folder name to clone into.

    $ cd ./wp/wp-content/plugins/
    $ git clone https://github.com/badgerherald/hexa-plugins.git .

That's it! Happy developing.

* * *

## Components

#### Vagrant

The Vagrantfile takes care of provisioning the server and applies the following additional configurations:

- installs LAMP stack including phpmyadmin, 

#### WordPress

The newest version of WordPress is downloaded and installed as part of the vagrant's provisioning.

#### Structure

Along with the Vagrantfile, this repo comes set up with the full Herald software stack, minus the physical install of WordPress.


#### Utilities

To work on the machine, `cd` into the repo and `ssh` in:

    vagrant ssh

Like the Herald's production server, the document root for the site is located at `/var/www/`. This should contain point to all the files in the main repo.

#### Vagrant tools 

To stop "working" on the machine, run

    vagrant suspend

This will essentially put your virtual machine to sleep. Running `vagrant up` will reboot the machine.

To completely remove the virtual machine in it's entirety, run:

    vagrant destroy

Note: This will destroy the entire machine, including any databases and additional server maintanence you might have done.
