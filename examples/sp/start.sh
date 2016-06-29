#!/bin/bash

unamestr=`uname`
host=127.0.0.1
name=sp@$host
if [[ "$unamestr" == 'Linux' || "$unamestr" == 'Darwin' ]]; then
     exename=erl
else
    exename='start //MAX werl.exe'
    #exename='erl.exe'
fi

# Node name
node_name="-name $name"

# Cookie
cookie="-setcookie $ck"

# PATHS
paths="-pa"
paths=$paths" ebin"
paths=$paths" deps/*/ebin"

start_opts="$paths $cookie $node_name"

# DDERL start options
echo "------------------------------------------"
echo "Starting ESaml (SP)"
echo "------------------------------------------"
echo "Node Name : $node_name"
echo "Cookie    : $cookie"
echo "EBIN Path : $paths"
echo "------------------------------------------"

# Starting dderl
$exename $start_opts -eval "application:ensure_all_started(sp)."
