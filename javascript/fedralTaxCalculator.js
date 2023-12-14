/*
# Background

Gusto’s payroll system allows employers to enter some basic information about employees being paid (like how much they should get paid) and then submit the payroll for processing. The payroll system does a lot of the work at this point and calculates the taxes to withhold for an employee, the taxes due by the employee, etc.

IRS withholding (federal income tax) is one of these taxes. The IRS uses a concept of federal income tax brackets to determine the amount of money to withhold from employees. A good description of tax brackets is described here: https://www.nerdwallet.com/blog/taxes/federal-income-tax-brackets/.

# Problem Statement

We’ll be working to create a software library that will know how to calculate federal income taxes. We’ll spend some time to understand federal income taxes using https://www.nerdwallet.com/blog/taxes/federal-income-tax-brackets/.

*/

/*
Input
- Gross Pay

Output the taxes witheld

A top level function of calculateTaxes()....
Taxes range from 10-37%

10%.     $0 to $10,275.      10% of taxable income.

12% to $10,276 to $41,775.   $1,027.50 plus 12% of the amount over $10,275.
22% $41,776 to $89,075.      $4,807.50 plus 22% of the amount over $41,775.
24% $89,076 to $170,050.    $15,213.50 plus 24% of the amount over $89,075.
32% $170,051 to $215,950.   $34,647.50 plus 32% of the amount over $170,050.
35% $215,951 to $539,900.   $49,335.50 plus 35% of the amount over $215,950.
37% $539,901 or more.      $162,718 plus 37% of the amount over $539,900.

*/
function expect(actual, expected) {
    if (actual === expected) {
        console.log("SUCCCESS");
        return;
    }
    console.log(`actual ${actual} expected ${expected}`);
    console.log("FAIL");
}

const taxBrackets = [
    { multiplier: 0.37, bottomBoundary: 539900, topBoundary: Number.MAX_SAFE_INTEGER},
    { multiplier: 0.35, bottomBoundary: 215950, topBoundary: 539900},
    { multiplier: 0.32, bottomBoundary: 170050, topBoundary: 215950},
    { multiplier: 0.24, bottomBoundary: 89075, topBoundary: 170050},
    { multiplier: 0.22, bottomBoundary: 41775, topBoundary: 89075},
    { multiplier: 0.12, bottomBoundary: 10275, topBoundary: 41775},
    { multiplier: 0.10, bottomBoundary: 0, topBoundary: 10275},
]
function calculateTaxes(grossIncome) {
    let totalTaxes = 0;
    taxBrackets.forEach(bracket => {
        if (grossIncome < bracket.bottomBoundary) {
            return;
        }
        // console.log(totalTaxes);
        const minValue = Math.min(bracket.topBoundary, grossIncome)
        totalTaxes += (minValue - bracket.bottomBoundary) * bracket.multiplier * 100;
        // console.log(JSON.stringify({totalTaxes, bracket, minValue}));
    });
    return totalTaxes / 100;
}

expect(calculateTaxes(0), 0);
expect(calculateTaxes(10275), .10 * 10275);
expect(calculateTaxes(10276), 1027.5 + (.12 * 1));
expect(calculateTaxes(41776),  4807.50 + (.22 * 1));
expect(calculateTaxes(539901), 162718 + (.37 * 1));

/*
*
{ "2022_single": [
    { multiplier: 0.37, bottomBoundary: 539900, topBoundary: Number.MAX_SAFE_INTEGER},
    { multiplier: 0.35, bottomBoundary: 215950, topBoundary: 539900},
    { multiplier: 0.32, bottomBoundary: 170050, topBoundary: 215950},
    { multiplier: 0.24, bottomBoundary: 89075, topBoundary: 170050},
    { multiplier: 0.22, bottomBoundary: 41775, topBoundary: 89075},
    { multiplier: 0.12, bottomBoundary: 10275, topBoundary: 41775},
    { multiplier: 0.10, bottomBoundary: 0, topBoundary: 10275},
]
},


*/
