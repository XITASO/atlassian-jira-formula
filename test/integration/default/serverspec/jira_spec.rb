require "serverspec"

set :backend, :exec

describe service("atlassian-jira") do
  it { should be_enabled }
  it { should be_running }
end

describe port("8009") do
  it { should be_listening }
end

describe command("sleep 10s") do
  its(:exit_status) { should eq 0 }
end

describe port("8080") do
  it { should be_listening }
end

describe command("curl -L localhost:8080") do
  its(:stdout) { should contain("jira") }
end
