#!/bin/sh


touch package.json

curl https://express-bootstrap.s3.amazonaws.com/package.json >> package.json
