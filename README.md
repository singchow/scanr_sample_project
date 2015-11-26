# README
A sample project using scanR API to read text from images

# Recognition
Thanks to @https://github.com/puffygeek/scanr-ruby for creating the gem for ScanR

# Getting started
1. Register @ https://www.scanr.xyz/ to get your Token for ScanR. It's free for usage below 100 API calls.
2. Run bundle install.
3. Go to app > controller > scan_files_controller.rb > Line 31, and replace "YOUR_TOKEN" with your ScanR token.
4. Rails server
5. Go to localhost:3000
6. Pick a photo and upload. The photo will be stored in public/system
7. If there's text in the image, it'll be saved under "Result".

# Things to take note
1. ScanR is still new, so there's still room for improvement.
2. I did not use ScanR gem as I stumble into errors while trying to get it to work. It's faster for me to read thru how the Gem works and implement the code in this sample project.
