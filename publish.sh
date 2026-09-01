#!/usr/bin/env bash
# Commits and pushes the portfolio to GitHub Pages.
#
# resume.pdf is normally a symlink to ../../resume/Srihari_latest.pdf (kept that
# way so it always reflects the latest exported resume). GitHub Pages serves a
# symlink's literal target-path text instead of following it, so this script
# swaps it for a real copy just for the commit, then restores the symlink.
set -euo pipefail
cd "$(dirname "$0")"

target=$(readlink -f resume.pdf)
rm resume.pdf
cp "$target" resume.pdf

git add -A
git commit -m "${1:-Update portfolio}"
git push origin main

rm resume.pdf
ln -s ../../resume/Srihari_latest.pdf resume.pdf
