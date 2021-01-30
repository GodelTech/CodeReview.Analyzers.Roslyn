The following issue may caused Roslyn analysis to stop. It's suggested to run through the files and remove this parameter.

```xml
 <NoWarn>$(NoWarn);1591</NoWarn>
 ```

```bash
docker build -t godeltech/codereview.analyzers.roslyn:0.0.1 . 
docker image tag godeltech/codereview.analyzers.roslyn:0.0.1 godeltech/codereview.analyzers.roslyn:latest
docker push godeltech/codereview.analyzers.roslyn:latest
docker push godeltech/codereview.analyzers.roslyn:0.0.1
```


Here is better fix for this issue:

```bash
dotnet build -property:NoWarn=""
```

docker run -v "/d/temp/src/ReviewItEasy.Orchestrator:/src" -v "/d/temp/artifacts:/artifacts" --env SOLUTION_FILE_PATH=/src/ReviewItEasy.Orchestrator.sln  -it --rm godeltech/codereview.analyzers.roslyn