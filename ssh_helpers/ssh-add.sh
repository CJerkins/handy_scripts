#! /bin/bash
eval `ssh-agent`
ssh-add .ssh/drok@aws.vanguard.net
ssh-add .ssh/drok@local.vanguard.net
ssh-add .ssh/drok@local.drokdev.pro