import os

print("TEMPLATE_GCS_LOCATION: ", os.environ.get("TEMPLATE_GCS_LOCATION", "Not Found")[:5], "...")
print("IMAGE_NAME: ", os.environ.get("IMAGE_NAME", "Not Found")[:5], "...")
