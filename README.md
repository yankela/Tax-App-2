# README

## This is a project done by Yankel Amarante & William Bright.

This is an app that helps you keep track of your receipts and helps you create
expense reports quickly. You upload pictures of receipts and using Optical Character
Recognition, it grabs all text from the receipt for better indexing and quickly find specific
receipts. It will also parse through the text data and update the total fields automatically.





-This is a project done by [Yankel Amarante](https://github.com/yankela/)
 & [William Bright](https://github.com/whb07/).


-Framework- Rails 5.1, & webpacker

-DB: Postgres & Redis(for Resque)

-Search Page uses React & the Algolia Instant Search

-Scanning of Receipts : Google Cloud Vision for the OCR

-Storage : Into S3, using PaperClip & Delayed Paperclip gems

-PDF: creates PDF of all receipts & categories using wicked_pdf gems
