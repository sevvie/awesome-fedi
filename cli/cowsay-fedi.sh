#!/bin/sh

curl -s -X GET -H 'Accept: application/json' $1 |
  perl -MJSON -MURI -E '
    my $json = decode_json(<>); 
    my $user_url = URI->new($json->{attributedTo});
    my $user = $user_url->path =~ s/\/users\///r;
    say "$json->{source}\n -- \@$user\@${\$user_url->host}"' |
  cowsay |
  lolcat
