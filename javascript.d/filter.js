/**
 * ref: https://www.freecodecamp.org/news/javascript-filter-method/
 *
 * Explanation:
 *  array: The original array from which elements will be filtered.
 *  callback: A function that is executed on each element of the array.
 *  element: The current element being processed in the array.
 *  index (optional): The index of the current element being processed.
 *  array (optional): The array filter was called upon.
 *  thisArg (optional): An optional object to which this can refer in the callback function.
 */
const newArray = array.filter(callback(element[, index[, array]])[, thisArg]);

/**
 * Examples
 */
const numbers = [1, 2, 3, 4, 5];
const evenNumbers = numbers.filter(num => num % 2 === 0);
// evenNumbers: [2, 4]

const values = [10, null, 20, undefined, 30];
const filteredValues = values.filter(value => value !== null && value !== undefined);
// filteredValues: [10, 20, 30]

const products = [
  { id: 1, name: 'Product 1', price: 40 },
  { id: 2, name: 'Product 2', price: 60 },
  { id: 3, name: 'Product 3', price: 30 }
];
const expensiveProducts = products.filter(product => product.price > 50);
// expensiveProducts: [{ id: 2, name: 'Product 2', price: 60 }]
