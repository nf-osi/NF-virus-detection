import os
import synapseclient
from synapseclient import File, Folder

PROJECT = 'syn25992642'
START_PATH = '/home/ssm-user/STAR_MetaPhlAn/analysis/star_results/'
syn=synapseclient.login('username','password')

parents = {START_PATH: PROJECT}
for dirpath, dirnames, filenames in os.walk(START_PATH):
    #Add the subfolders
    for dirname in dirnames:
        print( 'creating', dirname)
        f = syn.store(Folder(dirname, parent = parents[dirpath]))
        parents[os.path.join(dirpath, dirname)] = f.id
    #Add the files
    for name in filenames:
        path = os.path.join(dirpath, name)
        if os.stat(path).st_size>0:
            print( 'uploading', path)
            f = File(path, parent = parents[dirpath], name=name)
            #f.fileType = name[-3:]
            #f.project = 'Cool imaging library
            syn.store(f, forceVersion=False)
            
