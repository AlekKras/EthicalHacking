#!/bin/bash
# Aleksandr Krasnov
# Don't forget to run it :)
go get github.com/bettercap/bettercap
cd $GOPATH/src/github.com/bettercap/bettercap
make build && sudo make install
