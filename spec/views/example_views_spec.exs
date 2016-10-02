defmodule AuditApi.ExampleViewsSpec do
  use ESpec.Phoenix, view: AuditApi.ExamplesView

  describe "index html" do
    let :examples do
      [
        %AuditApi.Example{title: "Example 1"},
        %AuditApi.Example{title: "Example 2"},
      ]
    end

    subject do: render("index.html", examples: examples)

    it do: should have_content "Example 1"
    it do: should have_text "Example 2"
  end
end
