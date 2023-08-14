import os
import pandas as pd
import logging
import subprocess

IRIS_URL = 'https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv'

logger = logging.getLogger(__name__)

if __name__ == '__main__':
    # Download file from the given URL
    cmd = f"wget {IRIS_URL}"
    process = subprocess.Popen(
        cmd,
        stdout = subprocess.PIPE,
        stderr = subprocess.PIPE,
        text = True,
        shell = True
    )
    std_out, std_err = process.communicate()
    print(std_out.strip(), std_err)

    # Read the file to pandas
    filename = os.path.basename(IRIS_URL)
    try:
        df = pd.read_csv(os.path.basename(IRIS_URL))
        logger.info('Successfully read IRIS file')
    except Exception as e:
        logger.error(f'Error while reading IRIS file with error {e}')
    
    # Remove the file
    os.remove(filename)