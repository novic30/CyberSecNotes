#!/usr/bin/env bash

git init

git remote add origin "$1" 2>/dev/null
git remote set-url origin "$1"

git add .

git commit -m "$2"

git branch -M main
git push -u origin main
