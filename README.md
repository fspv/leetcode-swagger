# Swagger representation of Leetcode API

This repo contains a swagger file which describes the known methods in the leetcode API.

For now the code it produces been only tested for python. You can find the generated code in this repo: [https://github.com/prius/python-leetcode](https://github.com/prius/python-leetcode)

If you wish to build it for your preferred language - feel free to do so and send me a pull request.

Known issues (covered by patches):
1. Thread pool issue, causing the whole app to hang indefinitely
2. Cookie auth doesn't work for the generated code (even though doc says it is supported)
