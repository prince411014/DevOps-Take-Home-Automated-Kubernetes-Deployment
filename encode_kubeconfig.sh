#!/usr/bin/env bash
# Usage: ./encode_kubeconfig.sh ~/.kube/config
if [ -z "$1" ]; then
  echo "Provide kubeconfig path"
  exit 1
fi
cat "$1" | base64 | tr -d '\n'
echo
