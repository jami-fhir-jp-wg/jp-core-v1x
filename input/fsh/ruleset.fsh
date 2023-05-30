RuleSet: SetDefinition(name, definition)
* {name} ^short = {definition}
* {name} ^definition = {definition}

RuleSet: SetDefinitionRef(name, definition)
* {name} ^short = {definition}【詳細参照】
* {name} ^definition = {definition}

RuleSet: SetComment(name, definition, comment)
* {name} ^short = {definition}
* {name} ^definition = {definition} 
* {name} ^comment = {comment}
