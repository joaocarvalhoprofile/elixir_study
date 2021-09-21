# Coffee

**Example of functions simulating an API for creating tests**

## Installation

**mix deps.get**

# Run unit tests
**mix test --cover**

```elixir
def deps do
  [
    {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
    {:excoveralls, "~> 0.10", only: :test}
  ]
end
```