# Workspace

## Reason:

I have ideas for little HTML/JS/CSS experiments and wanted a workspace that would let me work with HAML and SCSS painlessly. I'm sure better options exist, but was just wanting to have a little potter.

## Getting started:

```
git clone git://github.com/adonaldson/workspace.git
cd workspace
bundle --binstubs
bin/rackup
open localhost:9292
```

## Usage:

### Markup:

Drop HAML files into /views/. If you want folders, create folders. If you want a folder to use a different layout, drop a layout file in that folder

```
/hello.html maps to /views/hello.haml
/ maps to /views.index.haml
/moobaa maps to /views/moobaa/index.haml
/moobaa/woof.html maps to /views/moobaa/woof.haml
```

### Stylesheets:

Drop SCSS stylesheets into /assets/stylesheets

```
/stylesheets/moo.css maps to /assets/moo.scss
```

### Javascripts:

Drop JS files into /assets/javascripts (or public/javascripts if you will, it's just a symlink)

```
/javascripts/baa.js maps to /assets/baa.js
```

## Contact:
Twitter: @adonaldson
