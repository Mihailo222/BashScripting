#! /bin/bash

#Script that reads a list of links from a file and checks if they are working. If link is not working (status code != 200), the administrator will be informed via email.

urls_file="" #provide a path to a file of urls
mail_address="" #provide an email address
cat $urls_file | while IFS=' ' read -r url
do
  if [[ $(curl -s -o /dev/null -w "HTTP CODE : %{http_code}\n" $url | awk '{print $4}' ) -ne 200 ]]
  then
   echo Site $url not working | mail -s "Checking links..." $mail_address
  fi

done