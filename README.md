replacers, but with fewer bugs and fewer "features"

the aim of this variant is to try to use the highest level APIs provided, to trigger all possible callbacks.

#### creaplacer

there's a special creative-only replacer. to get one, do `/giveme replacer:creaplacer`.

additional features of the creaplacer:
* points at liquid nodes
* longer range (10 nodes)
* copies/pastes node metadata
* can force-replace nodes (as long as they're not blacklisted or something)

#### API

##### blacklists

* `replacer.api.blacklist_item(itemstring)`

  blacklists `itemstring` from use in the replacer.

* `replacer.api.blacklist_predicate(function(itemstring, definition))`

  blacklist nodes which match the supplied predicate, e.g.
  ```lua
  pred = function(itemstring, definition)
      return definition.groups.level >= 2 and definition.groups.cracky <= 2
  end
  ```
  bans any node which has both cracky <= 2 and level >= 2

* `replacer.api.blacklist_item_replacement(itemstring)`

  blacklists `itemstring` from being replaced w/ the replacer.

* `replacer.api.blacklist_predicate_replacement(function(itemstring, definition))`

  blacklist nodes which match the supplied predicate from being replaced, e.g.
  ```lua
  pred = function(itemstring, definition)
      return definition.groups.level >= 2 and definition.groups.cracky <= 2
  end
  ```
  bans any node which has both cracky <= 2 and level >= 2 from being replaced.

##### over-rideable callbacks

* `replacer.api.is_blacklisted(itemstring)`

  override if you want to customize the logic of what can be blacklisted

* `replacer.api.is_replacement_blacklisted(itemstring)`

  override if you want to customize the logic of what can be blacklisted from being replaced

* `replacer.api.can_copy(player, pos, node)`

  override if you want to customize which nodes a player can copy

* `replacer.api.can_place(player, pos, node)`

  override if you want to customize whether a node can be placed by a player

* `replacer.api.can_replace(player, pos, current_node, replace_node)`

  override if you want to customize whether a node can be replaced by a player

#### license

code license:
* LGPL

media license:
* replacer_inspector.png (C) Sokomine GPLv3+
* replacer_replacer.png (C) Sokomine GPLv3+
