const runner = require("./puppeteer");
(async function wrapper(search) {
  console.log(`Starting At: ${Date.now()}`);
  const data = await runner(search);
  console.log(`Ended At: ${Date.now()}`);
  console.log(data);
  process.exit(1);
})('github');
