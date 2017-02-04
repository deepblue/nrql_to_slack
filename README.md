# NewRelic insights to Slack 


This script run NRQL query and post the result to Slack. I use it to monitor transaction errors for applications.

The following is sample Slack message created with this script.

![](https://www.evernote.com/l/AAF7bUeK3kxMBYbwgON_QV_CydRple7J_0gB/image.png)


## How to Run

First, fill `config/dev.exs`. You need newrelic query key and slack API key.

```
$ mix deps.get
$ mix escript.build
$ ./nrql_to_slack
```
