## ADO pipelines

### Passing variables between tasks in the same job

```yaml
steps:

  # Sets FOO to be "some value" in the script and the next ones
  - bash: |
      FOO="some value"
      echo "##vso[task.setvariable variable=FOO]$FOO"

  # Using the $() syntax, the value is replaced inside Azure Pipelines
  # before being submitted to the script task
  - bash: |
      echo "$(FOO)"

  # The same variable is also present as environmental variable
  # in scripts; here the variable expansion happens within bash
  - bash: |
      echo "$FOO"
```

### Passing variables between jobs

```yaml
jobs:

  - job: firstjob
    pool:
      vmImage: 'Ubuntu-16.04'
    steps:

      # Sets FOO to "some value", then mark it as output variable
      - bash: |
          FOO="some value"
          echo "##vso[task.setvariable variable=FOO;isOutput=true]$FOO"
        name: mystep

      # Show output variable in the same job
      - bash: |
          echo "$(mystep.FOO)"

  - job: secondjob
    # Need to explicitly mark the dependency
    dependsOn: firstjob
    variables:
      # Define the variable FOO from the previous job
      # Note the use of single quotes!
      FOO: $[ dependencies.firstjob.outputs['mystep.FOO'] ]
    pool:
      vmImage: 'Ubuntu-16.04'
    steps:

      # The variable is now available for expansion within the job
      - bash: |
          echo "$(FOO)"

      # To send the variable to the script as environmental variable,
      # it needs to be set in the env dictionary
      - bash: |
          echo "$FOO"
        env:
          FOO: $(FOO)
```

### Passing variables between stages

```yaml
stages:

  - stage: firststage
    jobs:

      - job: firstjob
        pool:
          vmImage: 'Ubuntu-16.04'
        steps:

          # To pass the variable FOO, write it to a file
          # While the file name doesn't matter, naming it like the variable
          # and putting it inside the $(Pipeline.Workspace)/variables folder
          # could be a good pattern
          - bash: |
              FOO="some value"
              mkdir -p $(Pipeline.Workspace)/variables
              echo "$FOO" > $(Pipeline.Workspace)/variables/FOO

          # Publish the folder as pipeline artifact
          - publish: $(Pipeline.Workspace)/variables
            artifact: variables

  - stage: secondstage
    jobs:

      - job: secondjob
        pool:
          vmImage: 'Ubuntu-16.04'
        steps:

          # Download the artifacts
          - download: current
            artifact: variables

          # Read the variable from the file, then expose it in the job
          - bash: |
              FOO=$(cat $(Pipeline.Workspace)/variables/FOO)
              echo "##vso[task.setvariable variable=FOO]$FOO"

          # Just like in the first example, we can expand the variable
          # within Azure Pipelines itself
          - bash: |
              echo "$(FOO)"

          # Or we can expand it within bash, reading it as environmental variable
          - bash: |
              echo "$FOO"
```

[Predefined variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml)
