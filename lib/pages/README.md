
Each file in this directory represents one of the 4 main pages
of the app:

 - Quickchat
 - Modules
 - Profile
 - Settings

Modify the `child` of each of these pages to add the content of
that page. I don't think we need to create any other files in
this directory. I'm thinking that each feature (e.g. modules, 
quickchat, etc) should have its own directory in `lib/` to hold
its respective files, and then just attach the main entry point
into `child` in its page file.