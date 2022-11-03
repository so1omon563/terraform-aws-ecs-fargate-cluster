# frozen_string_literal: true

include_controls 'inspec-aws'
require './test/library/common'

tfstate = StateFileReader.new

cluster_id = tfstate.read['outputs']['fargate-cluster']['value']['cluster']['arn'].to_s
log_group_name = tfstate.read['outputs']['fargate-cluster']['value']['container_insights']['0']['name'].to_s

cluster_override_id = tfstate.read['outputs']['fargate-override-cluster']['value']['cluster']['arn'].to_s
log_group_override_name = tfstate.read['outputs']['fargate-override-cluster']['value']['container_insights']['0']['name'].to_s

cluster_insights_id = tfstate.read['outputs']['fargate-insights-cluster']['value']['cluster']['arn'].to_s

control 'default' do
  describe aws_ecs_cluster(cluster_id) do
    it { should exist }
  end

  describe aws_cloudwatch_log_group(log_group_name: log_group_name) do
    it { should exist }
  end

  describe aws_ecs_cluster(cluster_override_id) do
    it { should exist }
  end

  describe aws_cloudwatch_log_group(log_group_name: log_group_override_name) do
    it { should exist }
  end

  describe aws_ecs_cluster(cluster_insights_id) do
    it { should exist }
  end

  describe aws_cloudwatch_log_group(log_group_name: '/aws/ecs/containerinsights/kitchen-insights-example/performance') do
    it { should_not exist }
  end
end
