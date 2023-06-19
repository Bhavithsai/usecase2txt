#!/usr/bin/env python3

import aws_cdk as cdk

from ami_lifecycle_workflow.ami_lifecycle_workflow_stack import AmiLifecycleWorkflowStack
#from ami_lifecycle_workflow.ami_pipeline_stack import AmiPipelineStack


app = cdk.App()
accountid = app.node.try_get_context("accountid")
region = app.node.try_get_context("region")
#vpc_id = app.node.try_get_context("VPC_ID")
ami_id = app.node.try_get_context("imageid")
instance_type = app.node.try_get_context("instance-type")
subnet_id = app.node.try_get_context("subnet-id")
instance_id = app.node.try_get_context("instance_id")

env_EU = cdk.Environment(account=accountid, region=region)

AmiLifecycleWorkflowStack(app, "ami-lifecycle-workflow", env=env_EU)
#AmiPipelineStack(app, "ami-pipeline-stack", env=env_EU)
#PipelineStack(app, "pipelineStack", env=env_EU, vpc_id=vpc_id)
app.synth()
