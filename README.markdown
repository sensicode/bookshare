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

Make a copy of the sample configuration file:

	$ cp config/config-sample.yml config/config.yml

---

Open `config/config.yml` in your text editor and fill in your details. You can change these at any time in future.

It might look something like this:

	sitename: Casterbridge Bookshare
	theme: casterbridge
	email: mike.henchard@casterbridge.gov.uk
	noreply_email: noreply@casterbridge.gov.uk
	twitter: casterbridgebookshare
	google_analytics: UA-XXXXX-X

_sitename_ is the human-readable name of your site

_theme_ is the name of your theme's folder within `/themes`

_email_ is your main public contact email address

_noreply\_email_ is used as the sender address on some outbound email messages. Use a noreply address at your domain if you've got one or your main contact address if you're happy to receive replies to these.

_twitter_ is the name of the Twitter account for your Bookshare project. Don't include the @ sign at the beginning.  Leave this out if you don't have a Twitter account for your Bookshare.

_google\_analytics_ is the web property ID (starts with "UA") for your site on [Google Analytics](http://www.google.com/intl/en/analytics/). If you're not using Analytics to track your web statistics just leave this blank.

---

Put your database details in `config/database.yml`

---

Build the database:

	$ rake db:migrate

---

Now you're good to go.
