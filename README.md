The following issue may caused Roslyn analysis to stop. It's suggested to run through the files and remove this parameter.

```xml
 <NoWarn>$(NoWarn);1591</NoWarn>
 ```
Here is better fix for this issue:

```bash
dotnet build -property:NoWarn=""
```

docker build -t diamonddragon/roslyn . 
docker run -v "/d/temp/src/ReviewItEasy.Orchestrator:/src" -v "/d/temp/artifacts:/artifacts" --env SOLUTION_FILE_PATH=/src/ReviewItEasy.Orchestrator.sln  -it --rm diamonddragon/roslyn