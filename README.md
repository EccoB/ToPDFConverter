# ToPDFConverter
Dockerimage that monitors a folder an convert new images to PDF
In addition to that, the OCR (optical character recognition) software Tesseract converts the image in a text, placing it behind the image to enable full-text search.

The Image monitors the folder /input. All files that are created to this folder are converted in put into to the path /output.



Mount the corresponding folders and start the container:
docker run -v ~/ownInput:/input -v ~/pathToOutput:/output 
