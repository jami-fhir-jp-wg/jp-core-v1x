// short , definitionを同時に出力する
RuleSet: SetDefinition(name, definition)
* {name} ^short = "{definition}"
* {name} ^definition = "{definition}"

// short , definitionを同時に出力する
// shortの最後に【詳細参照】コメントを付与する
RuleSet: SetDefinitionRef(name, definition)
* {name} ^short = "{definition}【詳細参照】"
* {name} ^definition = "{definition}"
