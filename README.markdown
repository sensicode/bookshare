NESTA Bookshare
===============

A web application for peer-to-peer community lending and borrowing of books.

Copyright (c) 2011 [London Borough of Sutton](http://www.sutton.gov.uk/)

Funded by [NESTA](http://www.nesta.org.uk/)


Licence
-------

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


Installation
------------

In Terminal, move to the folder you want to contain your Bookshare application.

We're going to set up Bookshare for the fictional town of Casterbridge.

---

Fork the main project repository into your own account by clicking the **Fork** button on the [main project page](https://github.com/adrianshort/nesta-bookshare).

---


Clone your new git repository to your local machine:

    $ git clone git://github.com/your-username/nesta-bookshare.git casterbridgebookshare

---

Move into your Bookshare folder:

    $ cd casterbridgebookshare

---

Make a copy of the default theme to use for your own site.

**Do not edit the default theme itself as it'll get overwritten when you next pull down a copy of the latest Bookshare version.**

    $ cp -r themes/default/ themes/casterbridge/

---

Add your theme to your git repository:

    $ git add themes/casterbridge

---

If you're hosting on [Heroku](http://heroku.com/), set up your [configuration variables](http://devcenter.heroku.com/articles/config-vars) like this:

    $ heroku config:add BOOKSHARE_SITENAME="Casterbridge Bookshare"
    $ heroku config:add BOOKSHARE_THEME=casterbridge
    $ heroku config:add BOOKSHARE_EMAIL=mike.henchard@casterbridge.gov.uk
    $ heroku config:add BOOKSHARE_NO_REPLY_EMAIL=noreply@casterbridge.gov.uk
    $ heroku config:add BOOKSHARE_TWITTER=casterbridgebookshare
    $ heroku config:add BOOKSHARE_GOOGLE_ANALYTICS=UA-XXXXX-X

---

If you're not hosting on Heroku (or if you want to run a local server, set up your configuration as environment variables. It might look something like this:

    $ export BOOKSHARE_SITENAME="Casterbridge Bookshare"
    $ export BOOKSHARE_THEME=casterbridge
    $ export BOOKSHARE_EMAIL=mike.henchard@casterbridge.gov.uk
    $ export BOOKSHARE_NO_REPLY_EMAIL=noreply@casterbridge.gov.uk
    $ export BOOKSHARE_TWITTER=casterbridgebookshare
    $ export BOOKSHARE_GOOGLE_ANALYTICS=UA-XXXXX-X

BOOKSHARE\_SITENAME is the human-readable name of your site

BOOKSHARE\_THEME is the name of your theme's folder within `/themes`

BOOKSHARE\_EMAIL is your main public contact email address

BOOKSHARE\_NO\_REPLY\_EMAIL is used as the sender address on some outbound email messages. Use a noreply address at your domain if you've got one or your main contact address if you're happy to receive replies to these.

BOOKSHARE\_TWITTER is the name of the Twitter account for your Bookshare project. Don't include the @ sign at the beginning.  Leave this out if you don't have a Twitter account for your Bookshare.

BOOKSHARE\_GOOGLE\_ANALYTICS is the web property ID (starts with "UA") for your site on [Google Analytics](http://www.google.com/intl/en/analytics/). If you're not using Analytics to track your web statistics just leave this blank.

---

Put your database details in `config/database.yml`

---

Build the database:

    $ rake db:migrate

---

Check that all the tests run OK:

    $ rake

---

Register as the first user on your new site. You'll automatically be made a site administrator. You can promote other users to be administrators in the Administration section.

---

Now you're good to go.
