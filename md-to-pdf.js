const markdownpdf = require('markdown-pdf');
const path = require('path');

const input = path.join(__dirname, 'hosting_guide.md');
const output = path.join(__dirname, 'hosting_guide.pdf');

markdownpdf()
  .from(input)
  .to(output, function () {
    console.log('PDF created at', output);
  });
