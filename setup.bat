@echo off

type NUL > .git/hooks/post-merge
echo #!/bin/sh > .git/hooks/post-merge
echo java -jar InstanceSync.jar >> .git/hooks/post-merge

echo Done setting up hooks
echo Running InstanceSync

java -jar InstanceSync.jar

echo.
@echo on
copy "mods+\*" mods /y
del /f "mods\Pam's HarvestCraft 1.12.2zg.jar"

pause