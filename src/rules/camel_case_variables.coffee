regexes =
    camelCase : /^\$?[a-zA-Z][a-zA-Z\d]*$/

# If you edit this then you need to run this:
# cd ~/mysrc/coffeelint && cake compile

module.exports = class CamelCaseVariables

  rule:
    name: 'camel_case_variables'
    level : 'error'
    message : 'Variable names should be camel cased'
    description: """
        BLAH FIX!

        This rule mandates that all variable names are camelCased.
        <pre>
        <code># Good!
        variableName = 'foo'

        # Bad!
        variable_name = 'whut'
        NotAVariable = 'nope'
        </code>
        </pre>
        This rule is enabled by default.
        """
  tokens: [ 'IDENTIFIER' ]

  lintToken: (token, tokenApi) ->
    if tokenApi.peek(1)[1] == '='
      variableName = token[1]
      if not regexes.camelCase.test(variableName)
        return {context: "variable name: #{variableName}"}
