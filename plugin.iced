fs     = require 'fs'
path   = require 'path'

less   = require 'less'

regex = ///
  @import\s+      # @import followed by one or more whitespace chars
  ['"]            # single or double quote
  ([^'"]+)        # capture chars except single or double quote
///gi

exports.findImports = findImports = (imports, file, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err

  while match = regex.exec contents
    item = match[1]
    item += '.less' if path.extname(item) is ''
    item = path.resolve path.dirname(file), item
    unless item in imports
      imports.push item
      await findImports imports, item, defer err
      return callback err if err

  callback()

exports.compile = (file, flags, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err
  parser = new less.Parser
    filename: file
    paths: [ path.dirname(file) ]
  await parser.parse contents, defer err, lessTree
  return callback err if err
  try
    contents = lessTree.toCSS()
  catch err
    return callback err
  callback null, contents
