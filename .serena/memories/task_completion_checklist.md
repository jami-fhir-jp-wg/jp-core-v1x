# Task Completion Checklist

## After Every Code Change
1. Run `sushi` to verify FSH compilation (0 errors, 0 warnings ideal)
2. Check for trailing spaces (cause validation warnings)
3. Verify naming conventions match constitution rules

## After Adding New Resources
1. Run `sushi`
2. Run `ruby script/markdownlink_creator.rb` to update markdown links
3. Run `ruby script/specialurls_creator.rb` to update sushi-config.yaml
4. Create documentation files:
   - `input/intro-notes/{ProfileName}-intro.md`
   - `input/intro-notes/{ProfileName}-notes.md`

## After Modifying Existing Profiles
1. Run `sushi` to verify no regressions
2. Check referencing profiles/extensions for consistency
3. Verify aliases in `aliases-jpcore.fsh` if URL references changed

## Before PR
1. Run full IG build (`_genonce.bat` on Windows)
2. Review `input/ignoreWarnings.txt` for new warnings
3. Verify constitution compliance (`.specify/memory/constitution.md`)
4. Use `[ci skip]` in commit message if CI bypass needed

## Quality Gates
- SUSHI: 0 errors required
- Constitution: all 7 principles must PASS or N/A
- Documentation: -intro.md and -notes.md exist for new profiles
