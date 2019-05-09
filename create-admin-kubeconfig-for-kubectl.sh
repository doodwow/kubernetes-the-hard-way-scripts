#!/bin/bash

{
  KUBERNETES_PUBLIC_ADDRESS=$(gcloud compute addresses describe kubernetes-mahirap \
    --region $(gcloud config get-value compute/region) \
    --format 'value(address)')

  kubectl config set-cluster kubernetes-mahirap \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443

  kubectl config set-credentials admin \
    --client-certificate=admin.pem \
    --client-key=admin-key.pem

  kubectl config set-context kubernetes-mahirap \
    --cluster=kubernetes-mahirap \
    --user=admin

  kubectl config use-context kubernetes-mahirap
}
