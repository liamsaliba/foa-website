This repository builds the LMS for Foundations of Algorithms.

It is based on the jekyll static site builder.

The deploy script builds the jekyll site, and then inlines all the CSS to make it Canvas compatible, before using the Canvas API to upload the site to the LMS.



To deploy run ./deploy.sh

Requirements:
Ruby
npm

Installation:
Run ```npm install```
Add a valid Canvas API token to a file named .canvastoken in the directory
