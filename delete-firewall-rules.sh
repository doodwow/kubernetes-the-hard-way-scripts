#!/bin/bash

gcloud -q compute firewall-rules delete \
  kubernetes-mahirap-allow-nginx-service \
  kubernetes-mahirap-allow-internal \
  kubernetes-mahirap-allow-external \
  kubernetes-mahirap-allow-health-check
