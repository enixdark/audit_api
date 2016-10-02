defmodule AuditApi.ExampleModelSpec do
  use ESpec.Phoenix, model: AuditApi.Example

  let :example, do: %AuditApi.Example{title: "Example 1"}
  it do: example.title |> should(eq "Example 1")
end
