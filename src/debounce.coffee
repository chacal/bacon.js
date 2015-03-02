# build-dependencies: flatmaplatest, scheduled, once
# build-dependencies: concat, filter

Bacon.EventStream :: debounce = (delay) ->
  withDescription(this, "debounce", delay, @flatMapLatest (value) ->
    Bacon.later delay, value)

Bacon.Property :: debounce = (delay) -> @delayChanges("debounce", delay, (changes) -> changes.debounce(delay))

Bacon.EventStream :: debounceImmediate = (delay) ->
  withDescription(this, "debounceImmediate", delay, @flatMapFirst (value) ->
    Bacon.immediately(value).concat(Bacon.later(delay).filter(false)))
