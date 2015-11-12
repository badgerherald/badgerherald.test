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

Now, we have to map the hostname "bhrld.dev" to the IP address directed to the vagrant machine. To do so, (MAC) open Terminal and type:

`sudo vi /etc/hosts`

enter your password as prompted. Insert the following in a new line:

`192.168.19.69	bhrld.dev` 

(Note: use the tab key between 69 and bhrld instead of a space.)

For some reason, if `/etc/hosts` is not properly set up as an alias for `/private/etc/hosts`, change your `/private/etc/hosts` file directly instead. The `hosts` file is on your host computer, not the Virtual Machine. Also, make sure there aren't any file extension attached to the hosts file, especially if you edit it through program/applications other than vi, vim, nano etc. 

Typing [http://bhrld.dev](http://bhrld.dev) into a browser should now take you to a local instance of the Herald site. The site will most likely be blank.  Make sure your browser resolves the `http://`.

#### 3. Clone other repos

A few addtional repos are needed for development.

###### First, cd to the WordPress theme directory.

    $ cd ./wp/wp-content/themes/

And clone the Herald's main theme [exa](http://github.com/badgerherald/exa), and the Herald's child theme [hexa](https:)

    $ git clone https://github.com/badgerherald/exa.git
    $ git clone https://github.com/badgerherald/hexa.git

###### Now, we need to set up the core plugins.

First we remove the default plugins from the plugin directory:

    $ cd ../plugins/
    $ rm -rf * 

_careful with the `rm` command; it will remove everything in the folder. Be sure you're in the plugin folder, or this won't just delete plugins but possibly the operating system._

Then, we clone the plugin directory *directly* into the WordPress plugin directory. We do this by specifying `.` as the folder name to clone into. Still in the plugins folder.
    
    $ git clone https://github.com/badgerherald/hexa-plugins.git .

(__protip:__ Clone these core plugins into your [`wp-content/mu-plugins`](https://codex.wordpress.org/Must_Use_Plugins) folder and keep your plugin folder free of git stuff.)(optional)

Next, init the nested submodules of this repo

    $ cd plugins
    $ git submodule update --init --recursive 

#### 4. Using Sass: a CSS Preprocessor

The Herald website requires extensive CSS formatting. We use Sass to help make the web design process easier and more efficient. It is required, or the website won't have a working stylesheet. Here's how:

###### Install Sass

Visit [`http://sass-lang.com/install`](http://sass-lang.com/install) and follow the instructions. A command-line install is sufficient for our purposes, but feel free to play around with the related applications.

###### Have Sass watch for changes

Now that you have installed Sass to your host machine, cd to the themes/exa directory:

	$ cd path/to/themes/exa

After movign to exa, use the following command to have Sass watch for changes you make to the stylesheets:

	$ sass --watch sass:.

This way, every time you make a change to the style sheets in exa/sass, Sass will recompile the style.css file in themes/exa automatically. The same command can be used in the hexa directory.


** That's it! Happy developing. **

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
