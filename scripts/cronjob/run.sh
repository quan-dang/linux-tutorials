#!/bin/bash
python3 -m venv myenv
source myenv/bin/activate
pip3 install pandas
cd /home/quandv/Desktop/mlopsvn-seminars/linux/scripts/cronjob
python3 crawl.py