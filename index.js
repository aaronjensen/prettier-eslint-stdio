const format = require('prettier-eslint')
const split = require('split')
const path = require('path')

process.stdin.setEncoding('utf8')

process.stdin.pipe(split(/\n# END\0/)).on('data', (chunk) => {
  if (!chunk) return

  const [filePath, text] = chunk.split("\n", 2)

  const options = {
    text,
    filePath
  }

  try {
    const formatted = format(options)
    process.stdout.write(formatted)
    process.stdout.write('\n# SUCCESS\0')
  } catch (e) {
    console.error(e.stack)
    process.stdout.write('\n# FAILURE\0')
  }
})
