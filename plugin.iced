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

  newImports = []
  while match = regex.exec contents
    item = match[1]
    item += '.less' if path.extname(item) is ''
    item = path.resolve path.dirname(file), item
    unless item in imports
      newImports.push item
      imports.push    item

  for item in newImports
    await findImports imports, item, defer err
    return callback err if err

  callback()

exports.compile = (file, flags, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err
  await less.render contents,
      filename: file
      paths: [ path.dirname(file) ]
    , defer err, output
  return callback err if err
  callback null, output
