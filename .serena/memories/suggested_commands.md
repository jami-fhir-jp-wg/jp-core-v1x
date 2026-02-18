# Suggested Commands

## System Utilities (Windows)
- `git` - Version control
- `ls` / `dir` - List directory (bash via Git Bash)
- `cd` - Change directory
- `grep` / `rg` - Search content (use Serena's search_for_pattern preferred)

## Initial Setup (run once)
```bash
bash _updateTx.sh        # Download terminology packages (Linux/Mac)
_updateTx.bat            # Windows variant
bash _updatePublisher.sh # Download IG Publisher JAR (Linux/Mac)
_updatePublisher.bat     # Windows variant
```

## Build Commands
```bash
# Compile FSH → FHIR JSON
sushi

# Single full IG build
bash _genonce.sh         # Linux/Mac
_genonce.bat             # Windows

# Continuous build (watches for changes)
bash _gencontinuous.sh   # Linux/Mac
_gencontinuous.bat       # Windows
```

## After Adding/Modifying Resources
```bash
sushi                                    # Compile FSH
ruby script/markdownlink_creator.rb      # Update markdown links
ruby script/specialurls_creator.rb       # Update sushi-config.yaml special URLs
```

## Validation
- SUSHI validates FSH syntax
- IG Publisher validates FHIR resources and terminology
- Check `input/ignoreWarnings.txt` for suppressed warnings

## SpecKit Workflow
- `/speckit.specify` - Create feature spec from issue
- `/speckit.clarify` - Clarify ambiguities
- `/speckit.plan` - Generate implementation plan
- `/speckit.tasks` - Generate task list
- `/speckit.implement` - Execute tasks
- `/speckit.checklist` - Generate quality checklist
- `/speckit.analyze` - Cross-artifact consistency analysis
