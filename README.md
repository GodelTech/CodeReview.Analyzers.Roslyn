# CodeReview.Analyzers.Roslyn

NuGet: https://hub.docker.com/r/godeltech/codereview.analyzers.roslyn

## Description

This project provides a Docker image to run [Roslyn](https://www.nuget.org/packages/sonaranalyzer.csharp) analyzers for code inspection.

## How to build the Docker Image

To build the Docker image, run the following commands:

```bash
docker build -t godeltech/codereview.analyzers.roslyn:0.0.1 .
```

## How to run the Docker Container

To run the Docker container, use the following command:

```bash
docker run -v "/d/temp/src/ReviewItEasy.Orchestrator:/src" -v "/d/temp/artifacts:/artifacts" --env SOLUTION_FILE_PATH=/src/ReviewItEasy.Orchestrator.sln  -it --rm godeltech/codereview.analyzers.roslyn
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details.