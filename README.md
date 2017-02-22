# wordpress-magento2
A vagrant image of a Magento 2.x system. 

A big part of this configuration comes from [https://www.vultr.com/docs/installing-magento-2-on-ubuntu](https://www.vultr.com/docs/installing-magento-2-on-ubuntu).

> THIS IS NOT A PRODUCTION ENVIRONMENT. THIS IS NOT "SECURE". USE IT ONLY FOR DEVELOPMENT

## start 

Magento is a bit complex with trying to install. You have to register in order to download the code from theier website. 

Go to [http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html) and generate your authentication keys. 

Then, rename the file `auth_template.json` in `auth.json` and fill with your data. 

At this point you can launch: 

```
vagrant up 
```

The first time it can take even 10 minutes to work. Once you're ready go to [http://127.0.0.1:8080/admin] and start the installation.  

> **Don't use localhost as a host**, change as soon as you can.

## To copy your plugins

put your plugins unzipped in the `plugins` folder. They will be copied over magento's `app/code/` directory. 

To install the plugin you have to launch this command: 

```
$ php bin/magento setup:up
```

## sensitive informations 

database user is `root`, password is `password`. 

database name is `magento`. 

## What does it contain 

an ubuntu image with a mysql server and Magento2, all at the latest available version (as of Feb, 9, 2016). 

