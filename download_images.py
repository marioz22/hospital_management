import os
import requests
from PIL import Image
from io import BytesIO

def download_image(url, filename):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            img = Image.open(BytesIO(response.content))
            # Convert image to RGB mode before saving as JPEG
            img = img.convert('RGB')
            img.save(filename)
            print(f"Downloaded {filename}")
        else:
            print(f"Failed to download {filename}: Status code {response.status_code}")
    except Exception as e:
        print(f"Error downloading {filename}: {e}")

def main():
    # Create directory if it doesn't exist
    os.makedirs("static/images/nurses", exist_ok=True)
    
    # Define image URLs and filenames using dummyimage.com
    images = {
        "static/images/nurses/team.jpg": "https://dummyimage.com/800x600/FFD700/000000&text=Expert+Nurses+Team",
        "static/images/nurses/facility.jpg": "https://dummyimage.com/800x600/FFD700/000000&text=Modern+Facilities",
        "static/images/nurses/care.jpg": "https://dummyimage.com/800x600/FFD700/000000&text=24/7+Care"
    }
    
    for filename, url in images.items():
        download_image(url, filename)

if __name__ == "__main__":
    main() 