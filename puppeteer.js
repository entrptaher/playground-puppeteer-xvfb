const puppeteer = require("puppeteer");

const runner = async search => {
  let data = [];

  console.log("Opening browser");
  const browser = await puppeteer.launch({
    headless: false,
    args: ["--no-sandbox", "--disable-setuid-sandbox"]
  });
  const page = await browser.newPage();

  async function cleanup() {
    try {
      console.log("Cleaning up instances");
      await page.close();
      await browser.close();
    } catch (e) {
      console.log("Cannot cleanup istances");
    }
  }

  try {
    console.log("Navigating url");
    await page.goto("https://duckduckgo.com/", { waitUntil: "networkidle2" });
    console.log("Typing text");
    await page.type("input#search_form_input_homepage", search, { delay: 50 });
    await page.click("input#search_button_homepage");
    console.log("Wait for results");
    await page.waitForSelector(".results--main #r1-0");
    data = await page.evaluate(() =>
      [...document.querySelectorAll("a.result__a")].map(e=>e.textContent.trim())
    );
    console.log("Extracted data");
    await cleanup();
  } catch (e) {
    console.log("Error happened", e);
    await page.screenshot({ path: "error.png" });
    await cleanup();
  }
  return data;
};

module.exports = runner;
