import os
import json

try:
    cred_file = open(os.environ["CRED_FILE"])
    data = json.load(cred_file)
    creds = data['mongolab']
    config = {
      'var1_name': creds['ADDON_NAME_PARAMETER1'],
      'var2_name': creds['ADDON_NAME_PARAMETER2'],
      'var3_name': creds['ADDON_NAME_PARAMETER3']
      # e.g. for MYSQLS: 'hostname': creds[MYSQLS_HOSTNAME]
    }
except IOError:
    print 'Could not open file'
