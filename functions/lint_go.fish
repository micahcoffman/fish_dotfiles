function lint_go
    golangci-lint run --config=./.golangci-precommit.yml
end
