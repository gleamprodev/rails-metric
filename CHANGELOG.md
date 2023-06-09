# Next Release

## 1.23.2 (2022-09-24)

* require_ruby_version 2.3.0

## 1.23.1 (2022-02-12)

* Do not strict activesupport dependency version

## 1.23.0 (2022-01-31)

* Support hash short syntax

## 1.22.0 (2021-10-27)

* Support atom editor

## 1.21.0 (2021-06-15)

* Disable check by inline comment
* Add type check for string

## 1.20.0 (2020-02-29)

* Support ruby 2.7
* Add the link format for vscode
* Add cli class
* Add table_name and module_prefix to model ignored methods
* Fix false positive remove unused method for around_action in
  controller
* Fix current_class_name in end_class callback

## 1.19.0 (2017-07-26)

* RestrictAutoGeneratedRoutesCheck is compatibale with rails api_only
* Remove Rails 2 support
* Remove haml ugly option
* Fix RemoveUnusedMethodsInControllers warning at inline routes

## 1.18.0 (2017-03-01)

* Add --config option

## 1.17.0 (2016-07-14)

* Detect index option in column creation
* Check against activerecord not rails
* Optimize methods of Klass for performance

## 1.16.0 (2016-02-22)

* Add check destroy return value review
* Support json and xml output
* Update urls on rails-bestpractices.com

## 1.15.0 (2014-02-03)

* Add `ignored_files` option to all checks

## 1.14.0 (2013-07-21)

* Add `--with-sublime` command option
* Add default_scope is evil check

## 1.13.0 (2012-11-23)

* Add use turbo-sprockets-rails3 check
* Add check save return value check

## 1.12.0 (2012-11-02)

* Add yaml output
* Add not rescue exception check

## 1.11.0 (2012-09-22)

* Add rabl support
* Extract `code_analyzer` gem
* Use `add_callback` for all checks

## 1.10.0 (2012-06-19)

* Do not support ripper in 1.8.7 anymore
* Add hash syntax check
* Add use parenthesis in method def check
* Add long line check

## 1.9.0 (2012-03-06)

* Parse nested scope routes
* Add protect mass assignment check

## 1.8.0 (2012-02-23)

* Add not use time ago in words check
* Ignore more unused methods
* Improve routes parser

## 1.7.0 (2011-12-14)

* Add slim template support
* Support mongomapper

## 1.6.0 (2011-12-10)

* Improve remove unused methods in controller check
* Add hg support
* Add `--output-file`, `--with-github`, `--only-table`,
  `--last-commit-id` command options

## 1.5.0 (2011-11-26)

* Bug fixes

## 1.4.0 (2011-11-20)

* Parse routes better

## 1.3.0 (2011-11-13)

* Enable RemoveUsedMethodsInModelsCheck by default

## 1.2.0 (2011-10-16)

* No needless_deep_nesting for more than 3 levels in shallow
* Add remove unused methods in models check

## 1.1.0 (2011-10-06)

* Use `sexp_processor` instead of `ruby_parser`
* Add restrict auto-generated routes check

## 1.0.0 (2011-09-24)

* First release
