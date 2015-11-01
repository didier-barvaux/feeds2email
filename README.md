# feeds2email - send news feeds by email
Retrieve all your RSS, Atom or RDF feeds, read them to detect new articles, and
then send them to you by email.

* homepage: https://github.com/didier-barvaux/feeds2email
* license:  Simplified BSD License (see COPYING)

## Installation
Build the man page as normal user: `make all`

Then install as root: `make install`

It requires `help2man`, `bash`, `curl`, `xmlstarlet`, `Python html2text`,
`logger`, `md5sum`, `awk`, `sed`, `tr`, `find`, `grep`, `mail`, `base64`,
and `mktemp`.

## Uninstall
Just run `make uninstall`.

## Usage

All commands hereafter are run with your normal user, not with root.

### Configure
Configure the sender email address:
```$ feeds2email config email-from feeds2email@example.com```

Configure your name and email address:
```$ feeds2email config email-to 'John Snow <john.snow@example.com>'```

### Add news feeds
Add new feeds as follow:
```$ feeds2email add https://github.com/didier-barvaux/feeds2email/commits/master.atom```

### Update the feeds
Manually update the feeds as follow:
```$ feeds2email update```

The output is quite verbose, you may run it in quiet mode (only warnings and
errors are printed):
```$ feeds2email --quiet update```

Use cron to update your feeds periodically:
```$ crontab -e```
then add the line below to update the feeds every 2 hours:
```5 */2 * * * /usr/local/bin/feeds2email --quiet update```

To filter the emails in your favorite email client, use:
* the sender address as configured previously,
* the general `X-Rss` header that is set to 1,
* the specific `X-RSS-Feed` header that contains the feed URI.

### Maintenance operations
Print the current configuration:
```$ feeds2email config```

Print the existing feeds:
```$ feeds2email list```

Add a new feed:
```$ feeds2email add https://github.com/didier-barvaux/feeds2email/commits/master.atom```

Delete an existing feed:
```$ feeds2email del https://github.com/didier-barvaux/feeds2email/commits/master.atom```

Disable an existing feed (feed won't be updated any more):
```$ feeds2email disable https://github.com/didier-barvaux/feeds2email/commits/master.atom```

Enable back an existing feed (feed will be updated again):
```$ feeds2email disable https://github.com/didier-barvaux/feeds2email/commits/master.atom```

Update one single feed:
```$ feeds2email update https://github.com/didier-barvaux/feeds2email/commits/master.atom ```

Update all feeds:
```$ feeds2email update```

Print the status of an existing feed:
```$ feeds2email status https://github.com/didier-barvaux/feeds2email/commits/master.atom```

Print the status of the feeds in error:
```$ feeds2email status```

## Workarounds

### Publishers that block unknown HTTP User Agents
Some publishers blocks HTTP requests with unknown User Agents. They probably
try to stop robots, spammers, or even unknown probably-badly-implemented news
readers. Here is how to workaround the problem.

You may try the following trick if feeds2email reports HTTP 403 Forbidden for
that feed:
```
$ feeds2email status https://github.com/didier-barvaux/feeds2email/commits/master.atom`
...
HTTP status..... HTTP/1.1 403 Forbidden
...
```

Define a fake User Agent for feeds2email to use with such feeds (better choose
a well-known one such as the one of Mozilla Firefox):
``` $ feeds2email config fake-user-agent 'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0' ```

Now, tell feeds2email to fake the HTTP User Agent for the problematic feed:
```
$ feeds2email del https://github.com/didier-barvaux/feeds2email/commits/master.atom
$ feeds2email add https://github.com/didier-barvaux/feeds2email/commits/master.atom fake-user-agent
```

Finally, try again to update the feed:
``` $ feeds2email update https://github.com/didier-barvaux/feeds2email/commits/master.atom ```

### Authentication using cookies
Some feeds might be protected by some authentication mechanism based on HTTP
cookies. Here is how to workaround the problem.

Tell feeds2email to use some cookies for the problematic feed:
```
$ feeds2email del https://github.com/didier-barvaux/feeds2email/commits/master.atom
$ feeds2email add https://github.com/didier-barvaux/feeds2email/commits/master.atom cookie=$( echo "var1=val1; var2=val2; var3=val3" | base64 --wrap=0 )
```

Then, try again to update the feed:
```feeds2email update https://github.com/didier-barvaux/feeds2email/commits/master.atom```

## Thanks
Thanks to thuban <thuban@yeuxdelibad.net> and his srss software for the ideas:
http://git.yeuxdelibad.net/srss/

