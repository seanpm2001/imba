import {
  editFileAndWaitForHmrComplete,
  fetchPageText,
  getColor,
  isBuild,
  page,
  untilMatches,
} from "~utils";

test("server config works (define)", async () => {
  // after hydration
  const html = await fetchPageText();
  expect(html).toContain("Imba App 1.1"); // before hydration
});

test("client config works: env prefix", async () =>{
	expect(await page.textContent("button")).toBe("Hello 0 times hello. Version: abdellah")
})
