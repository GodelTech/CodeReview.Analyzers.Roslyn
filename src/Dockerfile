FROM mcr.microsoft.com/dotnet/sdk:5.0 AS worker

RUN apt-get update
RUN apt-get --yes install nuget
RUN apt-get --yes install dos2unix

RUN mkdir packages
WORKDIR /packages

# convert run.sh file to unix format
ADD ./assets/run.sh /user/local/bin/run.sh
RUN dos2unix /user/local/bin/run.sh

# installing Nuget packages which later be used for analysis
RUN nuget install SonarAnalyzer.CSharp -Version 8.16.0.25740

# Main image
# Image used for analysis
FROM mcr.microsoft.com/dotnet/sdk:5.0.102-ca-patch-buster-slim

ENV SOLUTION_FILE_PATH=""
VOLUME /artifacts
VOLUME /src

# Move NuGet packages from previous build
RUN mkdir packages
WORKDIR /packages
COPY --from=worker /packages .

# Copy analysis script
COPY --from=worker /user/local/bin/run.sh /user/local/bin/run.sh

# Copy rule set
WORKDIR /
RUN mkdir rulesets
ADD ./assets/RuleSet.ruleset /rulesets/RuleSet.ruleset

#Install targets
RUN mkdir -p /root/.local/share/Microsoft/MSBuild/Current/Microsoft.Common.targets/ImportBefore
ADD ./assets/RoslynAnalyzers.targets /root/.local/share/Microsoft/MSBuild/Current/Microsoft.Common.targets/ImportBefore/RoslynAnalyzers.targets

WORKDIR /src

CMD ["bash", "/user/local/bin/run.sh"]  

