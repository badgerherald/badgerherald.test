# badgerherald.test

Run a local instance of The Badger Herald's website.

## What this gets you

This repo gets you a Vagrant box preloaded with configured server settings and a production database without the grunt-work 

#### Contents:

- **[👇 Setup](#setup)** - Get the site running locally for the first time
- **[👇 Components](#components)** - Some details about each component of the stack
- **[👇 FAQs](#faqs)** - Ask questions, and maybe we'll answer them!

* * *

## Setup

#### 1. Install some VM software

You'll need copies of both [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html).

This is the software that lets us run a server without messing with a bunch of settings on the host machine.

#### 2. Cloning

Then, run this command from terminal to clone the repo. Save it to a folder like `~/Documents/`, `C:/badgerherald/` or pick your own favorite place

    git clone https://github.com/badgerherald/badgerherald.test.git

#### 3. Vagrant up

If you have a copy of `badgerherald.test.sql` (ask in the #web slack), move this into the repo directory and it will be loaded. Otherwise, a new database will be created.

From the root of the repo, run:

    vagrant up

This will prevision a new virtual machine on your computer with the same LAMP stack as the Herald's production server. This process can take anywhere between 5 and 15 minutes, depending on your machine. Once the script is finished running, you'll have a vagrant box running at the ip address `192.168.19.69`. 

> Note: If you're running Windows and get this message: "You are trying to allocate >3GB of RAM to the VM. This requires: (a) a 64 bit host system; and (b) true hardware pass-through ie VT-x," follow the instructions [here](https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/) to enable virtualization in your BIOS

> If you have an issue with guest additions, run `vagrant plugin install vagrant-vbguest`

Now, we have to map the hostname "badgerherald.test" to the IP address of the vagrant machine. To do so open Terminal and type:

`sudo nano /etc/hosts` (on Windows this is located at `C:\Windows\System32\Drivers\etc\hosts` and will need to be edited as admin).

Enter your password as prompted. Insert the following in a new line:

`192.168.19.69	badgerherald.test` 

Use `control+o` to save the file and `control+c` to quit. 

> For some reason, if `/etc/hosts` is not properly set up as an alias for `/private/etc/hosts`, change your `/private/etc/hosts` file directly instead. The `hosts` file is on your host computer, not the Virtual Machine. Also, make sure there aren't any file extension attached to the hosts file, especially if you edit it through program/applications other than vi, vim, nano etc. 

#### 4. Clone other repos

A few additional repos are needed for development.

###### First, cd to the WordPress theme directory.

    $ cd ./badgerherald.test/wordpress/wp-content/themes/

And clone the Herald's main theme [exa](http://github.com/badgerherald/exa) and the Herald's child theme [hexa](https:)

    $ git clone https://github.com/badgerherald/exa.git
    $ git clone https://github.com/badgerherald/hexa.git

###### Installing App endpoint

_// todo_

#### 5. Using Sass: a CSS Preprocessor

We use Sass to help make the web design process easier and more efficient. It is required, or the website won't have a working stylesheet. Here's how to get it running:

###### Install Sass

Visit [`http://sass-lang.com/install`](http://sass-lang.com/install) and follow the instructions. A command-line install is sufficient for our purposes, but feel free to play around with the related applications.

###### Have Sass watch for changes

Now that you have installed Sass to your host machine, `cd` to the `themes/exa` directory:

	$ cd ./wp/wp-content/themes/exa

Use the following command to have Sass watch for changes you make to the stylesheets:

	$ sass --update sass:.

This will recompile the sass files into `style.css`. The same command should be used in the hexa directory.

When developing, run sass in watch mode such that every change to a `*.scss` file gets automatically update:

    $ sass --watch sass:.

Otherwise, you won't see css changes on the site.

** That's it! Happy developing. **

* * *

## Components

### Vagrant

The Vagrantfile takes care of provisioning a Linux server and maps it to the 192.168.19.96 IP on the host machine. It also installs apache2, mysql and other necessary utilities.

The document root for the webserver (`/var/www/`) is mapped to main repo folder.

##### Useful Vagrant commands 

To work on the machine, `cd` into the repo and `ssh` in:

    vagrant ssh

To logout of ssh, run `logout` from the virtual machine

To stop "working" on the machine, run from the host:

    vagrant suspend

This will essentially put your virtual machine to sleep. Running `vagrant up` will reboot the machine.

To completely remove the virtual machine in it's entirety, run:

    vagrant destroy

_Note: This will destroy the entire machine, including any databases and additional server maintanence you might have done._

### WordPress

The newest version of WordPress is downloaded and installed as part of the vagrant's provisioning.

### Utilities

##### PhpMyAdmin

To look at the database that was installed, visit: [http://badgerherald.com/phpmyadmin](badgerherald.test/phpmyadmin) and login with username: `root` password: `root`

## FAQs

###### I don't like badgerherald.test, how do I change the local URL?

If for some reason you'd like to change the URL of the test website, there are a few places you'll need to edit.

First, in `./wp/wp-config.php`, where you'll need to update the `WP_HOME` and `WP_SITEURL` constants with the new URL

Then, you'll need to ssh into vagrant (run `vagrant ssh`) and edit the virtual host configuration with:
    
    sudo nano /etc/apache2/sites-enabled/vagrant

After you do this, you'll need to restart apache2 with `sudo service apache2 restart`. Log out of ssh with `logout`

And finally, update your `/etc/host` (Windows: `C:\Windows\System32\Drivers\etc\hosts`)


