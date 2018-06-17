#!py
import os

def run():
    config = {}
    base_dir = '/tmp/pillar/'
    contents = ''
    sls_files = []
    for root, dirs, files in os.walk("/tmp/pillar/", topdown=False):
        for name in files:
            if '.sls' in name:
                print(os.path.join(root, name))
                sls_files.append(os.path.join(root, name))

    for file in sls_files:
        with open(file, 'r') as f:
            contents += '\n' + f.read()
    config['/srv/pillar/data.sls'] = {
         'file.managed': [
             {'contents': contents}
         ],
     }
    
    return config

