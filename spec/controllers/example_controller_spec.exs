defmodule AuditApi.ExampleControllerSpec do
  use ESpec.Phoenix, controller: AuditApi.ExampleController

  describe "index" do
    let :examples do
      [
        %AuditApi.Example{title: "Example 1"},
        %AuditApi.Example{title: "Example 2"},
      ]
    end

    before do
      allow(AuditApi.Repo).to accept(:all, fn -> examples end)
    end

    subject do: action :index

    it do: should be_successful
    it do: should have_in_assigns(examples: examples)
  end
end
