# Swagger representation of Leetcode API
This implements methods that are available publicly for leetcode.
There is already an implementation of them in form of CLI [1], but
it has a list of disadvantages.


1. It is written in JS

2. Even for JS in order to reuse it you have to invoke it via CLI

3. It is not supported very well, so authentication doesn't work anymore


So I have decided to create my own implementation and here is it.


Using the swagger file you'll be able to generate the code for any language
you like and start using leetcode API directly from your code.


Just keep in mind that swagger doesn't really support cookie auth,
which is needed in order to use LC API. If you use python you can
just use the generated code from this repo. Otherwise you'll have to
implement something like `fix_cookies.patch` for your target language.

For now the code it produces been only tested for python. You can find the generated code in this repo: [https://github.com/prius/python-leetcode](https://github.com/prius/python-leetcode)

If you wish to build it for your preferred language - feel free to do so and send me a pull request.

Known issues (covered by patches):
1. Thread pool issue, causing the whole app to hang indefinitely
2. Cookie auth doesn't work for the generated code (even though doc says it is supported)
