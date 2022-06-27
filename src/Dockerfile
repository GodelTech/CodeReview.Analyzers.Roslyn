FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine

ENV SOLUTION_FILE_PATH=""
VOLUME /artifacts
VOLUME /src

RUN apk add --no-cache dos2unix
RUN apk add --no-cache bash

# convert run.sh file to unix format
ADD ./assets/run.sh /user/local/bin/run.sh
RUN dos2unix /user/local/bin/run.sh

# Copy rule set
WORKDIR /
RUN mkdir rulesets
ADD ./assets/RuleSet.ruleset /rulesets/RuleSet.ruleset

#Install targets
RUN mkdir -p /root/.local/share/Microsoft/MSBuild/Current/Microsoft.Common.targets/ImportBefore
ADD ./assets/RoslynAnalyzers.targets /root/.local/share/Microsoft/MSBuild/Current/Microsoft.Common.targets/ImportBefore/RoslynAnalyzers.targets
ADD ./assets/Directory.Build.targets /Directory.Build.targets

WORKDIR /src

CMD ["bash", "/user/local/bin/run.sh"]

