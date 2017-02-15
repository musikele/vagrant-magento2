# wordpress-vagrant
A vagrant image of a wordpress blog. 

A big part of this configuration comes from [https://www.vultr.com/docs/installing-magento-2-on-ubuntu](https://www.vultr.com/docs/installing-magento-2-on-ubuntu).

> THIS IS NOT A PRODUCTION ENVIRONMENT. THIS IS NOT "SECURE". USE IT ONLY FOR DEVELOPMENT

## start 

```
vagrant up 
```

Magento is a bit complex with trying to install. You have to register in order to download the code from theier website. 

Go to [http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html) and generate your authentication keys. 

Then, rename the file `auth_template.json` in `auth.json` and fill with your data. 

Once you're ready go to [http://localhost:8080/admin] and start the installation.  

## To copy my plugins

put your plugins in a folder called `plugins`, they will be copied over magento's `app/code/` directory. 

## sensitive informations 

database user is `root`, password is `password`. 

database name is `magento`. 

## What does it contain 

an ubuntu image with a mysql server and Magento2, all at the latest available version (as of Feb, 9, 2016). 
