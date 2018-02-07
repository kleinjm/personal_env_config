#!/bin/bash

# a lot of apps rely on the docker container in doximity so keep it at top
apps=(patientpal patientpal-lambda patientpal-console dotfiles)

for app in ${apps[@]}; do
  echo "Starting $app"
  tmuxinator start $app --no-attach
done

tmux attach -t patientpal