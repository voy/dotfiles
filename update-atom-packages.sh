#!/bin/bash
apm list --installed --bare | cut -d @ -f 1 > atom-package-list.txt
