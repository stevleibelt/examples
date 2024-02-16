/**
 * ref: https://www.freecodecamp.org/news/the-javascript-promises-handbook/
 *
 * async and await are special keywords that simplify working with Promises.
 *  They remove the need for callback functions and calls to then or catch.
 *  They work with try-catch blocks, as well.
 *
 * Prefixing a function with async implicitly returns a promise when called
 */
function wait(duration) {
	return new Promise(resolve => {
        setTimeout(resolve, duration);
    });
}
// wrapping setTimeout in a promise

getUsers().then(users => {
    console.log('Got users:', users);
});
// awaiting a promise with then

const users = await getUsers();
console.log('Got users:', users);
// awaiting a promise with await

async function add(a, b) {
  return a + b;
}

add(2, 3).then(sum => {
   console.log('Sum is:', sum);
});
// using an async prefixed function

try {
    const data = await readFile(sourceFile);
    const result = await processData(data);
    await writeFile(result, outputFile);
} catch (error) {
    console.error('Error occurred while processing:', error);
}
// error handling with a try-catch block for async function calls

getUsers()
  .then(users => {
    console.log('Got users:', users);
  }, error => {
    console.error('Failed to load users:', error);
  });
// add error handling if promise could not be fulfilled

readFile('sourceData.json')
  .then(data => {
    processData(data)
      .then(result => {
        writeFile(result, 'processedData.json')
          .then(() => {
            console.log('Done processing');
          });
      });
  }
// nested promises

getUsers()
  .then(users => users[0])
  .then(firstUser => {
    console.log('First user:', firstUser.username);
  });
// returning a value from a previous then handler

readFile('sourceData.json')
  .then(data => processData(data))
  .then(result => writeFile(result, 'processedData.json'))
  .then(() => console.log('Done processing'))
  .catch(error => console.log('Error while processing:', error));
// error handling with catch in a promise chain

openDatabase()
  .then(data => processData(data))
  .catch(error => console.error('Error'))
  .finally(() => closeDatabase());

// using finally

const userId = 100;

const profilePromise = loadUserProfile(userId);
const postsPromise = loadUserPosts(userId);

Promise.all([profilePromise, postsPromise])
  .then(results => {
    const [profile, posts] = results;
    renderUserPage(profile, posts);
  });
// execute multiple promise tasks in parallel
// if one promise rejected with an error, all values of the fulfilled promies are lost

function getUsers() {
  return fetch('https://example.com/api/users')
    .then(result => result.json())
    .catch(error => {
      console.error('Error loading users:', error);
      return Promise.reject(error);
    });
}
// returning a rejected promise after error handling to bubble up the error
