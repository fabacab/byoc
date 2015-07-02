# Bring Your Own Content (BYOC) Web publishing virtual appliance

Bring Your Own Content (BYOC) is a blogging toolkit that provides a unified dashboard for creating and managing content on multiple Web hosting services simultaneously. It inverts the traditional Web publishing paradigm, giving you a lot more control over your own content than is offered with free blogs and social media providers, while still giving you all the convenience and interactivity of a true social network experience. Rather than write your posts on a hosted service provider like Tumblr or WordPress.com, you write your posts on your own computer inside BYOC and then send a copy of your post out to Tumblr, WordPress.com, your Diaspora pod, or any combination of providers that you choose.

This means you will have a backup of your blog. You will never lose content to the whims of a faceless, nameless, censorship-happy administrator. And you can even import your reblogs/reshares, comments, and other content you create remotely back to your computer automatically.

BYOC runs on Mac OS X, Windows, Linux, and most UNIX personal computers. You can even start using it on one platform (like Windows) and then switch to another platform (like a Mac) seamlessly. Data portability is what it's all about!

# Installing

BYOC requires [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) to be installed on your system. Both of these prerequisites are free and have native OS installers for all major platforms. Once those are installed, simply do:

    vagrant init meitar/byoc; vagrant up --provider virtualbox

from a command prompt and follow the on-screen instructions. Happy blogging!

# Supported blogging providers

BYOC supports the following free blog providers out of the box:

* [WordPress.com](https://wordpress.com/) or any self-hosted WordPress site (if it has [JetPack](https://jetpack.me/) installed)
* [Tumblr.com](http://tumblr.com/)
* Any [Diaspora](https://diasporafoundation.org/) pod.

BYOC is extensible, allowing you to add support for new blogging providers without having to modify the core source code of BYOC itself. Blogging providers are supported through native WordPress plugins. If you want to use another social media/publishing service with BYOC, just write a WordPress plugin for it and host your plugin on the WordPress plugin repository. Then [open a new issue](https://github.com/meitar/byoc/issues/new) or send a pull request for adding your plugin to BYOC's list of default plugins. It's that easy!

# Contributing

This project is built on WordPress and uses a number of custom WordPress plugins to provide its core functionality. These plugins are all also available as stand-alone plugins for any self-hosted WordPress website:

* [Tumblr Crosspostr](https://wordpress.org/plugins/tumblr-crosspostr/) provides the Tumblr.com blogging provider bridge.
* [WordPress Crosspost](https://wordpress.org/plugins/wp-crosspost/) provides the WordPress.com and self-hosted WordPress blogging provider bridge.
* [Diasposter](https://wordpress.org/plugins/diasposter) provides the Diaspora pod provider bridge.

Contributions and donations to any of those plugin projects ultimately support this project, too.

You can also contribute directly to this project by sending a pull request or [making a donation to BYOC's maintainer](http://Cyberbusking.org/). Thanks! :)
