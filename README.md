# Workspace

Don't use this on a live server, just yet :)

## Reason:

I have ideas for little HTML/JS/CSS experiments and wanted a workspace that would let me work with HAML and SCSS painlessly. I'm sure better options exist, but was just wanting to have a little potter.

I'm not sure the best way to lay out the directory structure yet, so my first stab is as follows:

```
/workspace <you create this folder>
    \ workspace_app <the cloned repo>
    \ assets
        \ stylesheets
        \ javascripts
        \ images <this is missing at the moment>
    \ public
```

I'm trying to separate the templates and assets from the app itself, but this approach seems pretty flawed (question: how do you commit your experiments in the 'workspace' folder without affecting the 'workspace_app' folder inside it).

## TODO

- Figure out directory structure / means of running the app that allows the user to commit their assets folder without conflicting with the workspace app
- Alter the way .js files are hosted so that we can reuse it for images (ideally served from /assets/images)
- Check for gaping security holes caused by the 'accept paths from the params'

## Getting started:

```
mkdir workspace
cd workspace
git clone git://github.com/adonaldson/workspace_app.git
cd workspace_app
bundle --binstubs
bin/rake install
bin/rackup
open localhost:9292
```

## Usage:

### Markup:

Drop HAML files into /views/. If you want folders, create folders. If you want a folder to use a different layout, drop a layout file in that folder

```
/hello.html maps to /templates/hello.haml
/ maps to /templates.index.haml
/moobaa maps to /templates/moobaa/index.haml
/moobaa/woof.html maps to /templates/moobaa/woof.haml
```

### Stylesheets:

Drop SCSS stylesheets into /assets/stylesheets

```
/stylesheets/moo.css maps to /assets/moo.scss
```

### Javascripts:

Drop JS files into /assets/javascripts

```
/javascripts/baa.js maps to /assets/baa.js
```

## Contact:
Twitter: @adonaldson
