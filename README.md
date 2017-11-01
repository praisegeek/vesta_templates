# vesta_templates

### What is this
This repository contains useful config templates for [Vesta CP](https://vestacp.com)

Work with vesta 0.9.8

### Templates list

* Drupal 7
* Redmine
* Laravel 5.1
* Phoenix 1.2

### Installation
To install thoose templates just:

```sh
cd /usr/local/vesta/data/templates/web
git clone https://github.com/praisegeek/vesta_templates.git
cp -R -u vesta_templates/apache2 .
cp -R -u vesta_templates/nginx .
rm -rfd vesta_templates
```
