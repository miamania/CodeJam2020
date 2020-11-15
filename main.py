import firebase_admin
import pyrebase
import google.cloud
from firebase_admin import credentials, firestore, storage



cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

config = {
  "apiKey": "AIzaSyDuQJ6RZE6dWs7vToVDCJIRvEWDmMy9GKs",
  "authDomain": "pmisha-misha.firebaseapp.com",
  "databaseURL": "https://misha-misha.firebaseio.com",
  "projectId": "misha-misha",
  "storageBucket": "misha-misha.appspot.com",
  "serviceAccount": "ServiceAccountKey.json"
}

firebase = pyrebase.initialize_app(config)
storage = firebase.storage()

path_on_cloud = "images/uploadedFile1"
path_local = "downloaded.jpeg"

storage.child(path_on_cloud).download(path_local)







#PUSHING NUMBER

val = 2

doc_ref = db.collection(u'data').document(u'TF')
doc_ref.set({
    u'TF' : val,
})

print(val)
