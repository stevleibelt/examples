/**
 * ref: https://www.freecodecamp.org/news/javascript-map-method/
 *
 * Explanation:
 *  array: The original array that you want to iterate over.
 *  callback: A function that will be executed on each element of the array.
 *  currentValue: The current element being processed in the array.
 *  index (optional): The index of the current element being processed.
 *  array (optional): The array that map was called upon.
 *  thisArg (optional): An optional object to which this can refer in the callback functi
 */
const newArray = array.map(callback(currentValue[, index[, array]]) {
  // return element for newArray, after executing something
}[, thisArg]);

/**
 * Examples
 */
const numbers = [1, 2, 3, 4, 5];
const doubledNumbers = numbers.map(num => num * 2);
// doubledNumbers: [2, 4, 6, 8, 10]

const users = [
  { id: 1, name: 'John' },
  { id: 2, name: 'Jane' },
  { id: 3, name: 'Doe' }
];
const userIds = users.map(user => user.id);
// userIds: [1, 2, 3]

const names = ['John', 'Jane', 'Doe'];
const uppercasedNames = names.map(name => name.toUpperCase());
// uppercasedNames: ['JOHN', 'JANE', 'DOE']

const numbers = [1, 2, 3, 4, 5];
const incrementedNumbers = numbers.map((num, index) => num + index);
// incrementedNumbers: [1, 3, 5, 7, 9]
