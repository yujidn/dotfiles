#!/usr/bin/env bash
set -euo pipefail

# Go 1.17+ では `go get` によるバイナリインストールは廃止されたため `go install` を使う
go install golang.org/x/tools/gopls@latest
