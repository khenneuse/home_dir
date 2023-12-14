const fs = require("fs");

console.log(process.argv[2]);
const logRows = fs.readFileSync(process.argv[2], "utf8").split("\n");

for (const rawRow of logRows) {
  const row = JSON.parse(rawRow);
  console.log(row.message);
}
