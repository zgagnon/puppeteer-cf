# puppeteer-cf

Get puppeteer to run on Cloud Foundry

## steps

1. Run `getlibs.sh` using docker to populate your `libs/` directory
```
 docker run -v $(pwd):/app cloudfoundry/cflinuxfs2 /app/getdebs.sh
```

1. Push your app with CF Push
