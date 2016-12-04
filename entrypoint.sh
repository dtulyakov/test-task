#!/bin/bash

# Env
puppet apply /puppet.pp
exec "$@"

