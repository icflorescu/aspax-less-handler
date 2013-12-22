## What's this?
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
If you find this piece of software useful, please [![endorse](https://api.coderwall.com/icflorescu/endorsecount.png)](https://coderwall.com/icflorescu) me on Coderwall!
