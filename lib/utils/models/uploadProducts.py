import firebase_admin
from firebase_admin import credentials, firestore
import json

# Initialize Firebase Admin SDK
cred = credentials.Certificate("F:/2. Software Projects/5. Flutter Projects/ReyNoon_eCommerceStore_Flutter/lib/utils/models/serviceAccountKey.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

# Load your data
with open("F:/2. Software Projects/5. Flutter Projects/ReyNoon_eCommerceStore_Flutter/lib/utils/models/products.json", "r") as f:
    products = json.load(f)

# Upload to Firestore
for product in products:
    doc_ref = db.collection("products").document(product["id"])
    doc_ref.set({
        "category": product["category"],
        "imagePath": product["imagePath"],
        "name": product["name"],
        "price": product["price"]
    })
    print(f"Uploaded {product['id']}")
