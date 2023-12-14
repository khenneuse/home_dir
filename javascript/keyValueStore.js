/**
 We have a product problem to solve that requires us to implement a custom data store for key-value pairs.

Implement a Key-Value Store with simple add, get, and delete functions.

 // We initialize the key value store
 kvs = new KeyValueStore()

 // We add an entry for the key 'a'
 kvs.add('a', 10)

 // We add an entry for the key 'b'
 kvs.add('b', 15)

 // We update the entry for the key 'a'
 kvs.add('a', 20)

 // We ask for the current value of the key 'a'
 kvs.get('a') // returns 20

 // We ask for the current value of the key 'b'
 kvs.get('b') // returns 15

 // We delete the key 'a'
 kvs.delete('a') // return null / None
........ Part Duex

 We now want to add some advanced functionality to our key value store: keeping track of historical values. Modify the Key-Value Store to keep track of previous values for a given key. Specifically, we want to implement a function get_at_effective_date that takes a key and a specific time, and returns the value for the key at the specified point in time. Here is an example:

// At 7:00 AM, we initialize the key value store
 kvs = new KeyValueStore()

 // At 7:30 AM, we add an entry for the key 'a'
 kvs.add('a', 10)

 // At 8:00 AM, we update the entry for the key 'a'
 kvs.add('a', 20)

 // At 8:30 AM, we ask for the current value of the key 'a'
 kvs.get('a') // returns 20

  // At 8:35 AM, we ask what the value was for the key 'a' at 7:35 AM

kvs.get('a')
kvs.get('a', new Date(8:30 AM)) -> 20

{
    a: [ {7:30, 10}, {8:00, 20} ]
}
7:29 null
7:35: 10
8:01: 20
 */


function expect(actual, expected) {
    if (JSON.stringify(actual) === JSON.stringify(expected)) {
        console.log("SUCCCESS");
        return;
    }
    console.log(`actual ${JSON.stringify(actual)} expected ${JSON.stringify(expected)}`);
    console.log("FAIL");
}


class KeyValueStore {
    constructor() {
        this.store = {};
    }

    add(key, value, date) {
        if (!this.store[key]) {
            this.store[key] = [];
        }
        this.store[key].push({ value, date });
        this.store[key].sort((a, b) => {
           return a.date.getTime() -  b.date.getTime();
        });
        return value;
    }

    get(key, inputDate = null) {
        let values = this.store[key];
        if (!values) {
            return null
        }
        values = values.filter(e => e.deleted);

        if (values.length === 0) {
          return null;
        }

        if (!inputDate) {
          const lastEntry = values[values.length - 1];
          return lastEntry.value;
        }

        for (let index = 0; index < values.length; index++) {
            const { value, date } = values[index];
            if (inputDate < date) {
                return value;
            }
        }
        return null;
    }

    delete(key) {
        delete this.store[key];
        return null;
    }

    softDelete(key) {
        const values = this.store[key];
        values[values.length - 1].deleted = true;
        return null;
    }

}

const kvs = new KeyValueStore();

// expect(kvs.add('b', 15,  new Date("2023-06-23 08:30:00Z")), 15);
expect(kvs.add('a', 20,  new Date("2023-06-23 08:30:00Z")), 20);
expect(kvs.add('a', 10, new Date("2023-06-23 07:30:00Z")), 10);

expect(kvs.get('a'), 20);
expect(kvs.get('a', new Date("2023-06-23 07:35:00Z")), 10);
expect(kvs.get('a', new Date("2023-06-23 08:35:00Z")), 20);
expect(kvs.get('a', new Date("2023-06-23 07:00:00Z")), null);
expect(kvs.softDelete('a'), null);
expect(kvs.get('a'), null);
expect(kvs.get('a', new Date("2023-06-23 08:35:00Z")), null);
// expect(kvs.get('a'), 20);
// expect(kvs.get('b'), 15);
// expect(kvs.get('c'), null);
// expect(kvs.get('b'), 15);
// expect(kvs.delete('a'), null);
// expect(kvs.get('a'), null);
