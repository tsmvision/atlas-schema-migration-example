#!/bin/sh

kaffold delete && skaffold dev --cache-artifacts=false
