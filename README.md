# Website2TwitterBanner
Simple bash script to update the Twitter banner image with a blurred screenshot of a website

I mainly wrote this to see if it can be done from a shell. It is deliberately kept simple. There is no error handling or parameter processing. This can of course be adapted to do all sorts of twitter stuff in more reliable ways.

## Dependencies

* **bash**
* **xvfb** if run on a headless system (such as a server)
* **cutycapt** to make the screenshot
* **imagemagick** to process the screenshot
* **curl** for the request
* **oauth_sign** (http://acme.com/software/oauth_sign) to create the OAuth signature
* **base64**
