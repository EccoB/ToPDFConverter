# ToPDFConverter
Dockerimage that monitors a folder an convert new images to PDF
In addition to that, the OCR (optical character recognition) software Tesseract converts the image in a text, placing it behind the image to e$

The Image monitors the folder /input. All files that are created to this folder are converted in put into to the path /output.


## Usage
Mount the corresponding folders and start the container.
The OCR runs as non-root - Take care that the output is writable for the container.

You can run the container with the corresponding UserID of the output and input folder (find yours with the command id):
```bash
docker run --user 1000:1000 -v ~/ownInput:/input -v ~/pathToOutput:/output
```

As a docker-compose file:

```bash
pdfconverter:
    image: ebaeum/topdfconverter
    user: "1000:1000"
    volumes:
      - ./localinput:/input
      - ./localoutput:/output
    restart: unless-stopped
```
