#!/bin/sh

# download & setup miab on a fresh ubuntu image that's had the right ports opened:

cd ~
curl -s https://mailinabox.email/setup.sh | sudo bash

# ... not sure how to automate that yet.  but basically 
# create toor@remail.mykle.com as the user/domain, which 
# also becomes the smtp acct/passwd for sending mail.

# but that fucks up, and you have to do it over, or else you cant get ssl keys.

sudo mailinabox

# then make this config change so that there's only one smtp acct 
# which can send as any user.  Not a good idea for a big installation,
# but this is just for me & g. (To be more fine-grained, i'd have to do
# bigger hacks in sender-login-maps.cf 
# DANGER: if miab is updated, this should be re-checked.
# In fact really this should be done as a patch, not a copy.

sudo cp ~/local_config/etc/postfix/main.cf /etc/postfix/main.cf

# restart postfix:

sudo postfix stop
sleep 3
sudo postfix start

# THEN go to the web admin UI,
# create SSL keys,
# create aliases for mykle@mykle.com, gesine@mykle.com and a catch-all.
