## What's this?
[![NPM version](https://badge.fury.io/js/aspax-less-handler.png)](http://badge.fury.io/js/aspax-less-handler)
[![Dependency Status](https://david-dm.org/icflorescu/aspax-less-handler.png)](https://david-dm.org/icflorescu/aspax-less-handler)

A plugin that enables [ASPAX](http://aspax.github.io) to handle [LESS](http://lesscss.org) files.

## Installation
Type this in the folder where you're running ASPAX:

    npm install aspax-less-handler

If you're running ASPAX in a Node.js application root folder, consider using the `--save-dev` option to avoid deploying this plugin to your production environment:

    npm install aspax-less-handler --save-dev

## Usage
Simply add `.less` source files in `aspax.yml`:

    app.css:
      - lib.css
      - styles-1.less
      - script-2.less

## What about watching for imported files?
This plugin is smart enough to recursively scan for `@import` statements and automatically trigger ASPAX to rebuild the parrent asset if one of the files in your import tree changes.

## Endorsing the author
If you find this piece of software useful, please [tweet about ASPAX](http://twitter.com/share?text=Checkout%20ASPAX%2C%20the%20simple%20Node.js%20asset%20packager!&url=http%3A%2F%2Faspax.github.io&hashtags=aspax&via=icflorescu) and/or [![endorse](https://api.coderwall.com/icflorescu/endorsecount.png)](https://coderwall.com/icflorescu) me on Coderwall!

