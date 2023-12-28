# Javascript

## Check if string contains only alphanumeric characters

```js
// ref: https://www.30secondsofcode.org/js/s/is-alpha-numeric
const isAlphaNumeric = str => /^[a-z0-9]+$/gi.test(str);
```

## Improve scrolling

```js
// ref: https://www.30secondsofcode.org/articles/s/passive-scroll-listener-performance
// The speed improvement comes from the `{ passive: true }`
window.addEventListener('scroll', () => {
    // Do something here
    // We can not use `preventDefault` at this place
}, { passive: true })
```

## Construct an url

```js
// ref: https://www.30secondsofcode.org/articles/s/js-construct-url
@todo
```

## Replace or append

```js
// ref: https://www.30secondsofcode.org/js/s/replace-or-append
@todo
```

## Select focused DOM element

```js
// ref: https://www.30secondsofcode.org/articles/s/select-focused-dom-element
const focusedElement = document.activeElement;
```

## Validate an email address in javascript

```js
@todo
```

## Link

* [A complete guide to JavaScript typechecking: 30secondsofcode.org](https://www.30secondsofcode.org/js/s/complete-guide-to-js-type-checking/) - 20231228
