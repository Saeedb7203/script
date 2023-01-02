## About Script 

this script download ssl-certificate from seo.ir or any website and after that download Investment funds list on the /home/sandoogh repository

## How to use :
1.pull repository

2.run 
```get-crt.sh -u seo.ir```

(-u option download your certificate from your url)

3.run `get-list.sh`

if you want to run daily:

```sudo crontab -e```

and if you want to download daily certificate and list, add this script at the end of file:
```
1 0 * * * /path-to-the-get-cert/get-crt.sh -u seo.ir
2 0 * * * /path-to-the-get-list/get-list.sh
```

or if you want just download just list, only add get-list script in crontab file:

```1 0 * * * /path-to-the-get-list/get-list.sh```
