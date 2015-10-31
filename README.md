# feeds2email - send news feeds by email
Retrieve all your RSS or Atom feeds, read them to detect new articles, and then
send them to you by email.

* homepage: https://github.com/didier-barvaux/feeds2email
* license:  Simplified BSD License (see COPYING)

## Installation
Just run `make install` as root. 

It requires `bash`, `curl`, `xmlstarlet`, `Python html2text`, `logger`,
`md5sum`, `awk`, `sed`, `tr`, `mail`, and `mktemp`.

## Uninstall
Just run `make uninstall`.

## Usage
Add your feeds URI in `$HOME/.config/feeds2email/feedlist` (one per line).
Then, run `feeds2email me@example.com feeds2email@example.com` to update feed
list and send new articles by email to `me@example.com`.

Use cron to update your feeds periodically. To do that, run `crontab -e` then
add the line below:

  `@hourly /usr/local/bin/feeds2email -q me@example.com feeds2email@example.com`

To filter your mail, use the `X-Rss` header. It is set to 1.

## Thanks
Thanks to thuban <thuban@yeuxdelibad.net> and his srss software for the ideas:
http://git.yeuxdelibad.net/srss/

