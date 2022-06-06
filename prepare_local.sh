#!/bin/bash

# Get sample videos
#wget https://storage.googleapis.com/lp_testharness_assets/official_test_source_2s_keys_24pfs.mp4
#wget https://storage.googleapis.com/lp_testharness_assets/official_test_source_2s_keys_24pfs_3min.mp4
#wget https://storage.googleapis.com/lp_testharness_assets/bbb_sunflower_1080p_30fps_normal_t02.mp4
#wget https://storage.googleapis.com/lp_testharness_assets/bbb_sunflower_1080p_30fps_normal_2min.mp4
#wget https://storage.googleapis.com/lp_testharness_assets/official_test_source_2s_keys_24pfs_30s.mp4
wget -qO- https://storage.googleapis.com/lp_testharness_assets/official_test_source_2s_keys_24pfs_30s_hls.tar.gz | tar xvz -C .

# Get Mainnet wallet secrets
DATADIR="$(pwd)/temp/TEST_ORCHTESTER_MAINNET"
KEYSTORE="${DATADIR}/keystore"
mkdir -p "${KEYSTORE}"
kubectl get secret staging-orch-tester-broadcaster-secret -o json |jq .data | jq -r '."wallet.secret"' | base64 -d > "${KEYSTORE}/wallet"
kubectl get secret staging-orch-tester-broadcaster-secret -o json |jq .data | jq -r '."passphrase.secret"' | base64 -d > "${DATADIR}/pw.txt"

