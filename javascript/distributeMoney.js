/**
Given an amount of money to distribute, a list of recipients and how much money each is owed, you should return the list of recipients and how much each would be paid after following the business logic below:

1 - no recipient is paid more than they are owed
2 - the amount is divided as evenly as possible between the recipients
3 - you can think of the amount as being in cents (i.e. recipients should only receive an integer amount and never a decimal)
4 - any left over amounts are divided up in alphabetical order by recipient name

Input: { a: 10, b: 10, c: 10, d: 10 } , 40
Output: { a: 10, b: 10, c: 10, d: 10 }

Input: { a: 12, b: 12, c: 12, d: 12 } , 24
Output: { a: 6, b: 6, c: 6, d: 6}

Input: { a: 10, b: 10, c: 10, d: 10 } , 6
Output: { a: 2, b: 2, c: 1, d: 1}

Input: { a: 10, b: 10, c: 10, d: 40 } , 60 => 15

First loop:
   { a: 10 }. remaind = 0 => 5
   { a: 10, b: 10 }, remainder = 5
Output: { a: 10, b: 10, c: 10, d: 30}


Input: { a: 12, b: 15, c: 13, d: 13 } , 50 => 12.5 => 12
       { a: 12, b: 12, c: 12, d: 12  } , 2
       { a: 12, b: 13, c: 13, d: 12  }
Output: { a: 12, b: 13, c: 13, d: 12 }

Input: { a: 10, b: 10, c: 10, d: 10 } , 200
Output: { a: 10, b: 10, c: 10, d: 10 }

*/

function expect(input, expected) {
    console.log(`input ${JSON.stringify(input)} expected ${expected}`);

    if (JSON.stringify(input) === expected) {
        console.log("SUCCCESS");
        return;
    }
    console.log("FAIL");
}
console.log('Hello world');

function calculatePayments(recipients, budget) {
    const recipientNames = Object.keys(recipients);
    const recipientCount = recipientNames.length;
    // Determine the distribution per person
    let evenDistrubution = budget / recipientCount;
    let remainder = budget % recipientCount;
    // console.log(`evenDistrubution ${evenDistrubution}`);
    // console.log(`remainder ${remainder}`);

    // Loop through people and we distribute funds
    // if the persons request is less than than the evenDistrubution
    // then person will get their distribution and the leftover will get added to the remainder
    // The person that was fully paid will get put in a hash that they were

    // Distribute the remainder to those that that have not been fully paid

    const response = { };


    const totalToPay = budget;
    while (totalToPay > 0) {
        let evenDistrubution = totalToPay / recipientCount;
        let remainder = budget % recipientCount;

        Object.keys(recipients).forEach(name => {
            response[name] += evenDistrubution;
            remainder -= evenDistrubution;
        });
        totalToPay = totalToPay - (evenDistrubution *
    }


    /*
    totalToPay
    amountAvailable
    while (totalToPay > 0 && amountAvailable > 0) {
        loop over recipients {
            still need to pay {
                pay & update amountAvailable &  totalToPay
            }
        }
    }
    */
    return response;
}

expect(calculatePayments({ a: 2, b: 2 }, 4),  '{"a":2,"b":2}');
expect(calculatePayments({a: 10, b: 10, c: 10, d: 10}, 40),  '{"a":10,"b":10,"c":10,"d":10}');
expect(calculatePayments({a: 10, b: 10, c: 10, d: 10}, 4),  '{"a":1,"b":1,"c":1,"d":1}');
expect(calculatePayments({a: 10, b: 10, c: 10, d: 10}, 6),  '{"a":2,"b":2,"c":1,"d":1}');
